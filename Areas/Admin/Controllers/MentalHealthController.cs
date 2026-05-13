using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using MindCare_Pro.Areas.Identity.Data;
using MindCare_Pro.Data;
using MindCare_Pro.Models;

namespace MindCare_Pro.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = "Admin")]
    public class MentalHealthController : Controller
    {
        private readonly MindCareDbContext _context;

        private readonly UserManager<ApplicationUser> _userManager;

        public MentalHealthController(
            MindCareDbContext context,
            UserManager<ApplicationUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }

        // LIST OF USERS
        public async Task<IActionResult> Index()
        {
            var users = _userManager.Users.ToList();

            var list = new List<AdminUserMentalHealthViewModel>();

            using (SqlConnection con =
                new SqlConnection(_context.Database.GetConnectionString()))
            {
                con.Open();

                foreach (var user in users)
                {
                    SqlCommand cmd = new SqlCommand(@"
                        SELECT TOP 1 *
                        FROM Assessments
                        WHERE Id=@Id
                        ORDER BY AssessmentDate DESC", con);

                    cmd.Parameters.AddWithValue("@Id", user.Id);

                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        int total =
                            Convert.ToInt32(reader["TotalScore"]);

                        string condition =
                            total <= 20 ? "Low"
                            : total <= 30 ? "Moderate"
                            : "Critical";

                        list.Add(new AdminUserMentalHealthViewModel
                        {
                            UserId = user.Id,

                            UserName = user.UserName,

                            FirstName = user.FirstName,

                            LastName = user.LastName,

                            TotalScore = total,

                            DepressionScore =
                                Convert.ToInt32(reader["DepressionScore"]),

                            AnxietyScore =
                                Convert.ToInt32(reader["AnxietyScore"]),

                            StressScore =
                                Convert.ToInt32(reader["StressScore"]),

                            AssessmentDate =
                                Convert.ToDateTime(reader["AssessmentDate"]),

                            CurrentCondition = condition
                        });
                    }

                    reader.Close();
                }
            }

            return View(list);
        }

        // USER FULL DETAILS
        public async Task<IActionResult> Details(string id)
        {
            var user = await _userManager.FindByIdAsync(id);

            if (user == null)
            {
                return NotFound();
            }

            var model = new AdminUserMentalHealthViewModel();

            model.UserId = user.Id;

            model.UserName = user.UserName;

            model.FirstName = user.FirstName;

            model.LastName = user.LastName;

            model.History = new List<AssessmentHistoryItem>();

            using (SqlConnection con =
                new SqlConnection(_context.Database.GetConnectionString()))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(@"
                    SELECT *
                    FROM Assessments
                    WHERE Id=@Id
                    ORDER BY AssessmentDate DESC", con);

                cmd.Parameters.AddWithValue("@Id", id);

                SqlDataReader reader = cmd.ExecuteReader();

                bool first = true;

                while (reader.Read())
                {
                    int total =
                        Convert.ToInt32(reader["TotalScore"]);

                    string condition =
                        total <= 20 ? "Low"
                        : total <= 30 ? "Moderate"
                        : "Critical";

                    var item = new AssessmentHistoryItem
                    {
                        TotalScore = total,

                        DepressionScore =
                            Convert.ToInt32(reader["DepressionScore"]),

                        AnxietyScore =
                            Convert.ToInt32(reader["AnxietyScore"]),

                        StressScore =
                            Convert.ToInt32(reader["StressScore"]),

                        AssessmentDate =
                            Convert.ToDateTime(reader["AssessmentDate"]),

                        Condition = condition
                    };

                    model.History.Add(item);

                    if (first)
                    {
                        model.TotalScore = item.TotalScore;

                        model.DepressionScore =
                            item.DepressionScore;

                        model.AnxietyScore =
                            item.AnxietyScore;

                        model.StressScore =
                            item.StressScore;

                        model.AssessmentDate =
                            item.AssessmentDate;

                        model.CurrentCondition =
                            item.Condition;

                        first = false;
                    }
                }
            }

            return View(model);
        }
    }
}