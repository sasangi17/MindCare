using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using MindCare_Pro.Areas.Identity.Data;
using MindCare_Pro.Models;
using Microsoft.Data.SqlClient;
using System.Data;

[Authorize]
public class AssessmentController : Controller
{
    private readonly string _conn;
    private readonly UserManager<ApplicationUser> _userManager;

    public AssessmentController(IConfiguration config, UserManager<ApplicationUser> userManager)
    {
        _conn = config.GetConnectionString("MindCareDbContextConnection");
        _userManager = userManager;
    }

    // load questions
    public IActionResult Index()
    {
        var model = new AssessmentViewModel
        {
            Questions = new List<Question>()
        };

        using (SqlConnection con = new SqlConnection(_conn))
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM Questions", con);
            con.Open();

            var reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                model.Questions.Add(new Question
                {
                    QuestionId = (int)reader["QuestionId"],
                    QuestionText = reader["QuestionText"].ToString()
                });
            }
        }

        return View(model);
    }

    // submit the answers
    [HttpPost]
    public IActionResult Submit(AssessmentViewModel model)
    {
        if (model.Answers == null || model.Answers.Count == 0)
        {
            return RedirectToAction("Index");
        }

        var userId = _userManager.GetUserId(User);

        int depression = 0;
        int anxiety = 0;
        int stress = 0;

        var answers = model.Answers.Values.ToList();

        for (int i = 0; i < answers.Count; i++)
        {
            int score = answers[i];

            switch (i)
            {
                // Anxiety
                case 0:
                case 5:
                case 7:
                    anxiety += score;
                    break;

                // Depression
                case 1:
                case 2:
                case 4:
                case 9:
                    depression += score;
                    break;

                // Stress
                case 3:
                case 6:
                case 8:
                    stress += score;
                    break;
            }
        }

        int totalScore = depression + anxiety + stress;

        using (SqlConnection con = new SqlConnection(_conn))
        {
            con.Open();

            SqlCommand cmd = new SqlCommand("sp_AddAssessment", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Id", userId);
            cmd.Parameters.AddWithValue("@TotalScore", totalScore);
            cmd.Parameters.AddWithValue("@DepressionScore", depression);
            cmd.Parameters.AddWithValue("@AnxietyScore", anxiety);
            cmd.Parameters.AddWithValue("@StressScore", stress);

            cmd.ExecuteNonQuery();
        }

        return RedirectToAction("Index", "Dashboard");
    }

    // history of assessments
    public IActionResult History()
    {
        var list = new List<AssessmentHistory>();
        var userId = _userManager.GetUserId(User);

        using (SqlConnection con = new SqlConnection(_conn))
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT * FROM Assessments WHERE Id=@Id ORDER BY AssessmentDate DESC",
                con);

            cmd.Parameters.AddWithValue("@Id", userId);

            con.Open();
            var reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                int score = Convert.ToInt32(reader["TotalScore"]);

                string level = score <= 20 ? "Low"
                             : score <= 30 ? "Medium"
                             : "High";

                list.Add(new AssessmentHistory
                {
                    AssessmentId = (int)reader["AssessmentId"],
                    TotalScore = score,
                    AssessmentDate = Convert.ToDateTime(reader["AssessmentDate"]),
                    Level = level
                });
            }
        }

        return View(list);
    }
}