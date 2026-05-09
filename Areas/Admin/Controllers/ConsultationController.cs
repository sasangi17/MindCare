using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MindCare_Pro.Areas.Identity.Data;
using MindCare_Pro.Data;
using MindCare_Pro.Models;

namespace MindCare_Pro.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = "Admin")]
    public class ConsultationController : Controller
    {
        private readonly MindCareDbContext _context;

        private readonly UserManager<ApplicationUser> _userManager;

        public ConsultationController(
            MindCareDbContext context,
            UserManager<ApplicationUser> userManager)
        {
            _context = context;

            _userManager = userManager;
        }

        // LIST
        public async Task<IActionResult> Index()
        {
            var consultations = await _context.Consultations
                .OrderByDescending(x => x.CreatedAt)
                .ToListAsync();

            return View(consultations);
        }

        // DETAILS
        public async Task<IActionResult> Details(int id)
        {
            var consultation = await _context.Consultations
                .FirstOrDefaultAsync(x => x.ConsultationId == id);

            if (consultation == null)
            {
                return NotFound();
            }

            var user = await _userManager.FindByIdAsync(
                consultation.UserId);

            ViewBag.UserName = user?.UserName;

            ViewBag.FirstName = user?.FirstName;

            ViewBag.LastName = user?.LastName;

            return View(consultation);
        }

        // COMPLETE CONSULTATION
        public async Task<IActionResult> Complete(int id)
        {
            var consultation = await _context.Consultations
                .FindAsync(id);

            if (consultation == null)
            {
                return NotFound();
            }

            consultation.IsCompleted = true;

            consultation.IsCancelled = false;

            consultation.Status = "Completed";

            await _context.SaveChangesAsync();

            return RedirectToAction(nameof(Index));
        }

        // DELETE CONSULTATION
        public async Task<IActionResult> Delete(int id)
        {
            var consultation = await _context.Consultations
                .FindAsync(id);

            if (consultation == null)
            {
                return NotFound();
            }

            _context.Consultations.Remove(consultation);

            await _context.SaveChangesAsync();

            return RedirectToAction(nameof(Index));
        }
    }
}