using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using MindCare_Pro.Areas.Identity.Data;
using MindCare_Pro.Models;
using Microsoft.Data.SqlClient;

[Authorize]
public class DashboardController : Controller
{
    private readonly string _conn;
    private readonly UserManager<ApplicationUser> _userManager;

    public DashboardController(IConfiguration config, UserManager<ApplicationUser> userManager)
    {
        _conn = config.GetConnectionString("MindCareDbContextConnection");
        _userManager = userManager;
    }

    public IActionResult Index()
    {
        var model = new DashboardViewModel();
        var userId = _userManager.GetUserId(User);

        using (SqlConnection con = new SqlConnection(_conn))
        {
            con.Open();

            // summary
            SqlCommand summaryCmd = new SqlCommand(@"
                SELECT 
                    COUNT(*) AS TotalAssessments,
                    ISNULL(AVG(CAST(TotalScore AS FLOAT)),0) AS AverageScore
                FROM Assessments
                WHERE Id=@Id", con);

            summaryCmd.Parameters.AddWithValue("@Id", userId);

            var summaryReader = summaryCmd.ExecuteReader();

            if (summaryReader.Read())
            {
                model.TotalAssessments = Convert.ToInt32(summaryReader["TotalAssessments"]);
                model.AverageScore = Convert.ToDouble(summaryReader["AverageScore"]);
            }

            summaryReader.Close();

            
            SqlCommand latestCmd = new SqlCommand(@"
                SELECT TOP 1 
                    DepressionScore,
                    AnxietyScore,
                    StressScore,
                    AssessmentDate
                FROM Assessments
                WHERE Id=@Id
                ORDER BY AssessmentDate DESC", con);

            latestCmd.Parameters.AddWithValue("@Id", userId);

            var latestReader = latestCmd.ExecuteReader();

            if (latestReader.Read())
            {
                model.DepressionScore = Convert.ToInt32(latestReader["DepressionScore"]);
                model.AnxietyScore = Convert.ToInt32(latestReader["AnxietyScore"]);
                model.StressScore = Convert.ToInt32(latestReader["StressScore"]);
                model.LastAssessmentDate = Convert.ToDateTime(latestReader["AssessmentDate"]);

                model.DepressionLevel = GetLevel(model.DepressionScore);
                model.AnxietyLevel = GetLevel(model.AnxietyScore);
                model.StressLevel = GetLevel(model.StressScore);
            }

            latestReader.Close();

            // chart
            SqlCommand trendCmd = new SqlCommand(@"
                SELECT TOP 7 TotalScore, AssessmentDate
                FROM Assessments
                WHERE Id=@Id
                ORDER BY AssessmentDate DESC", con);

            trendCmd.Parameters.AddWithValue("@Id", userId);

            var trendReader = trendCmd.ExecuteReader();

            while (trendReader.Read())
            {
                model.WeeklyScores.Add(Convert.ToInt32(trendReader["TotalScore"]));
                model.WeeklyLabels.Add(Convert.ToDateTime(trendReader["AssessmentDate"]).ToString("ddd"));
            }

            model.WeeklyScores.Reverse();
            model.WeeklyLabels.Reverse();

            trendReader.Close();

            // reminders
            SqlCommand reminderCmd = new SqlCommand(@"
                SELECT TOP 5 *
                FROM Reminders
                WHERE Id=@Id AND IsCompleted=0
                ORDER BY ReminderDate ASC", con);

            reminderCmd.Parameters.AddWithValue("@Id", userId);

            var reminderReader = reminderCmd.ExecuteReader();

            while (reminderReader.Read())
            {
                model.TodayReminders.Add(new Reminder
                {
                    ReminderId = (int)reminderReader["ReminderId"],
                    Title = reminderReader["Title"].ToString(),
                    ReminderDate = Convert.ToDateTime(reminderReader["ReminderDate"]),
                    IsCompleted = (bool)reminderReader["IsCompleted"]
                });
            }
        }

        return View(model);
    }

    private string GetLevel(int score)
    {
        if (score <= 5) return "Low";
        if (score <= 10) return "Medium";
        return "High";
    }
}