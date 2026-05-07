using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MindCare_Pro.Data;
using MindCare_Pro.Models;

namespace MindCare_Pro.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = "Admin")]
    public class DoctorController : Controller
    {
        private readonly MindCareDbContext _context;

        public DoctorController(MindCareDbContext context)
        {
            _context = context;
        }

        
        public async Task<IActionResult> Index()
        {
            var doctors = await _context.Doctors.ToListAsync();

            return View(doctors);
        }

        // Create page
        public IActionResult Create()
        {
            return View();
        }

        // Save doctor
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(Doctor doctor)
        {
            if (ModelState.IsValid)
            {
                _context.Doctors.Add(doctor);

                await _context.SaveChangesAsync();

                return RedirectToAction(nameof(Index));
            }

            return View(doctor);
        }

        // Edit page
        public async Task<IActionResult> Edit(int id)
        {
            var doctor = await _context.Doctors.FindAsync(id);

            if (doctor == null)
            {
                return NotFound();
            }

            return View(doctor);
        }

        // Update doctor
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(Doctor doctor)
        {
            if (ModelState.IsValid)
            {
                _context.Doctors.Update(doctor);

                await _context.SaveChangesAsync();

                return RedirectToAction(nameof(Index));
            }

            return View(doctor);
        }

        // Delete doctor
        public async Task<IActionResult> Delete(int id)
        {
            var doctor = await _context.Doctors.FindAsync(id);

            if (doctor == null)
            {
                return NotFound();
            }

            _context.Doctors.Remove(doctor);

            await _context.SaveChangesAsync();

            return RedirectToAction(nameof(Index));
        }
    }
}