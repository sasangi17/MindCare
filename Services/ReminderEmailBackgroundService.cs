using Microsoft.AspNetCore.Identity;
using Microsoft.Data.SqlClient;
using MindCare_Pro.Areas.Identity.Data;

namespace MindCare_Pro.Services
{
    public class ReminderEmailBackgroundService : BackgroundService
    {
        private readonly IServiceScopeFactory _scopeFactory;
        private readonly IConfiguration _config;

        public ReminderEmailBackgroundService(
            IServiceScopeFactory scopeFactory,
            IConfiguration config)
        {
            _scopeFactory = scopeFactory;
            _config = config;
        }

        protected override async Task ExecuteAsync(
            CancellationToken stoppingToken)
        {
            while (!stoppingToken.IsCancellationRequested)
            {
                using (var scope = _scopeFactory.CreateScope())
                {
                    var emailService =
                        scope.ServiceProvider
                        .GetRequiredService<EmailService>();

                    var userManager =
                        scope.ServiceProvider
                        .GetRequiredService<
                            UserManager<ApplicationUser>>();

                    string conn =_config.GetConnectionString("MindCareDbContextConnection");

                    using (SqlConnection con =
                        new SqlConnection(conn))
                    {
                        con.Open();

                        SqlCommand cmd = new SqlCommand(@"

SELECT *
FROM Reminders
WHERE IsCompleted = 0
AND CAST(ReminderDate AS DATETIME) <= GETDATE()", con);

                        SqlDataReader reader =
                            cmd.ExecuteReader();

                        var reminders =
                            new List<(int Id, string UserId,
                            string Title, DateTime Date)>();

                        while (reader.Read())
                        {
                            reminders.Add((
                                Convert.ToInt32(
                                    reader["ReminderId"]),

                                reader["Id"].ToString(),

                                reader["Title"].ToString(),

                                Convert.ToDateTime(
                                    reader["ReminderDate"])
                            ));
                        }

                        reader.Close();

                        foreach (var reminder in reminders)
                        {
                            var user =
                                await userManager
                                .FindByIdAsync(
                                    reminder.UserId);

                            if (user != null &&
                                !string.IsNullOrEmpty(
                                    user.Email))
                            {
                                string body = $@"

                                   <div style='font-family:Arial;padding:30px;background:#f4f7fb;'>

<div style='max-width:600px;margin:auto;background:white;padding:40px;border-radius:20px;box-shadow:0 10px 30px rgba(0,0,0,0.08);'>

<h2 style='color:#111827;'>
MindCare Reminder
</h2>

<p style='font-size:16px;color:#4b5563;'>

Hello {user.FirstName},

</p>

<p style='font-size:16px;color:#4b5563;'>

This is a reminder for your scheduled wellness activity.

</p>

<div style='background:#f9fafb;
padding:20px;
border-radius:12px;
margin-top:20px;'>

<h3 style='margin:0;color:#111827;'>
{reminder.Title}
</h3>

<p style='margin-top:10px;color:#6b7280;'>

Reminder Time:
<strong>
{reminder.Date:dd MMM yyyy hh:mm tt}
</strong>

</p>

</div>

<p style='margin-top:25px;color:#6b7280;'>

Stay consistent with your mental wellness journey.

</p>

<div style='margin-top:30px;'>



</div>

</div>

</div>
";

                                emailService.SendEmail(
                                    user.Email,
                                    "MindCare Reminder",
                                    body);

                                SqlCommand updateCmd =
                                    new SqlCommand(@"

UPDATE Reminders
SET IsCompleted = 1
WHERE ReminderId = @Id

", con);

                                updateCmd.Parameters
                                    .AddWithValue(
                                        "@Id",
                                        reminder.Id);

                                updateCmd.ExecuteNonQuery();
                            }
                        }
                    }
                }

                await Task.Delay(
                    TimeSpan.FromMinutes(1),
                    stoppingToken);
            }
        }
    }
}