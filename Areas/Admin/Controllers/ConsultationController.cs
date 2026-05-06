using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace MindCare_Pro.Areas.Admin.Controllers
{
    public class ConsultationController : Controller
    {
        [Area("Admin")]
        [Authorize(Roles = "Admin")]
        public IActionResult Index()
        {
            return View();
        }
    }
}
