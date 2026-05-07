using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using MindCare_Pro.Areas.Admin.Models;
using MindCare_Pro.Models;

namespace MindCare_Pro.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = "Admin")]
    public class DashboardController : Controller
    {
        private readonly string _conn;

        public DashboardController(IConfiguration config)
        {
            _conn = config.GetConnectionString("MindCareDbContextConnection");
        }

        public IActionResult Index()
        {
            var model = new AdminDashboardViewModel();

            using (SqlConnection con = new SqlConnection(_conn))
            {
                con.Open();

                // Total consultations
                SqlCommand totalCmd = new SqlCommand(
                    "SELECT COUNT(*) FROM Consultations", con);

                model.TotalConsultations =
                    (int)totalCmd.ExecuteScalar();

                // Paid consultation
                SqlCommand paidCmd = new SqlCommand(
                    "SELECT COUNT(*) FROM Consultations WHERE Status='Paid'", con);

                model.PaidConsultations =
                    (int)paidCmd.ExecuteScalar();

                // Pending consultation
                SqlCommand pendingCmd = new SqlCommand(
                    "SELECT COUNT(*) FROM Consultations WHERE Status='Pending'", con);

                model.PendingConsultations =
                    (int)pendingCmd.ExecuteScalar();

                // Total revenune
                SqlCommand revenueCmd = new SqlCommand(
                    "SELECT ISNULL(SUM(Fee),0) FROM Consultations WHERE Status='Paid'", con);

                model.TotalRevenue =
                    Convert.ToDecimal(revenueCmd.ExecuteScalar());

                // Today revenue
                SqlCommand todayCmd = new SqlCommand(@"
                    SELECT ISNULL(SUM(Fee),0)
                    FROM Consultations
                    WHERE Status='Paid'
                    AND CAST(CreatedAt AS DATE)=CAST(GETDATE() AS DATE)", con);

                model.TodayRevenue =
                    Convert.ToDecimal(todayCmd.ExecuteScalar());

                // Recent consultations
                model.RecentConsultations = new List<Consultation>();

                SqlCommand recentCmd = new SqlCommand(@"
                    SELECT c.*, d.Name
                    FROM Consultations c
                    JOIN Doctors d
                    ON c.DoctorId = d.DoctorId
                    ORDER BY c.CreatedAt DESC", con);

                SqlDataReader reader = recentCmd.ExecuteReader();

                while (reader.Read())
                {
                    model.RecentConsultations.Add(new Consultation
                    {
                        ConsultationId =
                            Convert.ToInt32(reader["ConsultationId"]),

                        DoctorName =
                            reader["Name"].ToString(),

                        AppointmentDate =
                            Convert.ToDateTime(reader["AppointmentDate"]),

                        TimeSlot =
                            reader["TimeSlot"].ToString(),

                        Fee =
                            Convert.ToDecimal(reader["Fee"]),

                        Status =
                            reader["Status"].ToString(),

                        CreatedAt =
                            Convert.ToDateTime(reader["CreatedAt"])
                    });
                }

                reader.Close();
            }

            return View(model);
        }
    }
}