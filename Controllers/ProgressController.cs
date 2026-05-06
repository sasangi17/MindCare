using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using MindCare_Pro.Areas.Identity.Data;
using MindCare_Pro.Models;
using Microsoft.Data.SqlClient;

[Authorize]
public class ProgressController : Controller
{
    private readonly string _conn;
    private readonly UserManager<ApplicationUser> _userManager;

    public ProgressController(IConfiguration config, UserManager<ApplicationUser> userManager)
    {
        _conn = config.GetConnectionString("MindCareDbContextConnection");
        _userManager = userManager;
    }

    public IActionResult Index()
    {
        var model = new ProgressViewModel
        {
            Dates = new List<string>(),
            Scores = new List<int>(),

            // separate charts for each category
            DepressionScores = new List<int>(),
            AnxietyScores = new List<int>(),
            StressScores = new List<int>()
        };

        var userId = _userManager.GetUserId(User);

        using (SqlConnection con = new SqlConnection(_conn))
        {
            SqlCommand cmd = new SqlCommand(@"
                SELECT 
                    AssessmentDate, 
                    TotalScore,
                    DepressionScore,
                    AnxietyScore,
                    StressScore
                FROM Assessments
                WHERE Id = @Id
                ORDER BY AssessmentDate ASC", con);

            cmd.Parameters.AddWithValue("@Id", userId);

            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                var date = Convert.ToDateTime(reader["AssessmentDate"]);

                model.Dates.Add(date.ToString("yyyy-MM-dd"));
                model.Scores.Add(Convert.ToInt32(reader["TotalScore"]));

                // NEW
                model.DepressionScores.Add(Convert.ToInt32(reader["DepressionScore"]));
                model.AnxietyScores.Add(Convert.ToInt32(reader["AnxietyScore"]));
                model.StressScores.Add(Convert.ToInt32(reader["StressScore"]));
            }
        }

        return View(model);
    }
}