using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using MindCare_Pro.Areas.Identity.Data;
using MindCare_Pro.Models;
using System.Data;
using Microsoft.Data.SqlClient;

[Authorize]
public class ReminderController : Controller
{
    private readonly string _conn;
    private readonly UserManager<ApplicationUser> _userManager;

    public ReminderController(IConfiguration config, UserManager<ApplicationUser> userManager)
    {
        _conn = config.GetConnectionString("MindCareDbContextConnection");
        _userManager = userManager;
    }


    public IActionResult Index()
    {
        var list = new List<Reminder>();
        var userId = _userManager.GetUserId(User);

        using (SqlConnection con = new SqlConnection(_conn))
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM Reminders WHERE Id=@Id", con);
            cmd.Parameters.AddWithValue("@Id", userId);

            con.Open();
            var reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                list.Add(new Reminder
                {
                    ReminderId = (int)reader["ReminderId"],
                    Title = reader["Title"].ToString(),
                    ReminderDate = Convert.ToDateTime(reader["ReminderDate"]),
                    IsCompleted = (bool)reader["IsCompleted"]
                });
            }
        }

        return View(list);
    }

    // add reminder
    [HttpPost]
    public IActionResult Create(Reminder model)
    {
        var userId = _userManager.GetUserId(User);

        using (SqlConnection con = new SqlConnection(_conn))
        {
            SqlCommand cmd = new SqlCommand("sp_AddReminder", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Id", userId);
            cmd.Parameters.AddWithValue("@Title", model.Title);
            cmd.Parameters.AddWithValue("@ReminderDate", model.ReminderDate);

            con.Open();
            cmd.ExecuteNonQuery();
        }

        return RedirectToAction("Index");
    }

    // complete/uncomplete reminder
    [HttpPost]
    public IActionResult Toggle(int id)
    {
        using (SqlConnection con = new SqlConnection(_conn))
        {
            SqlCommand cmd = new SqlCommand(@"
                UPDATE Reminders 
                SET IsCompleted = CASE WHEN IsCompleted = 1 THEN 0 ELSE 1 END
                WHERE ReminderId = @rid", con);

            cmd.Parameters.AddWithValue("@rid", id);

            con.Open();
            cmd.ExecuteNonQuery();
        }

        return RedirectToAction("Index");
    }

    // delete reminder
    [HttpPost]
    public IActionResult Delete(int id)
    {
        using (SqlConnection con = new SqlConnection(_conn))
        {
            SqlCommand cmd = new SqlCommand(
                "DELETE FROM Reminders WHERE ReminderId=@rid", con);

            cmd.Parameters.AddWithValue("@rid", id);

            con.Open();
            cmd.ExecuteNonQuery();
        }

        return RedirectToAction("Index");
    }
}