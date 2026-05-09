using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using MindCare_Pro.Areas.Identity.Data;
using MindCare_Pro.Models;
using Microsoft.Data.SqlClient;
using MindCare_Pro.Services;

[Authorize]
public class ConsultationController : Controller
{
    private readonly string _conn;
    private readonly UserManager<ApplicationUser> _userManager;
    private readonly EmailService _emailService;

    public ConsultationController(
        IConfiguration config,
        UserManager<ApplicationUser> userManager,
        EmailService emailService)
    {
        _conn = config.GetConnectionString("MindCareDbContextConnection");
        _userManager = userManager;
        _emailService = emailService;
    }

    // Doctor List
    public IActionResult Index()
    {
        var list = new List<Doctor>();

        using (SqlConnection con = new SqlConnection(_conn))
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT * FROM Doctors", con);

            con.Open();

            var reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                list.Add(new Doctor
                {
                    DoctorId = (int)reader["DoctorId"],
                    Name = reader["Name"].ToString(),
                    Specialization = reader["Specialization"].ToString(),
                    Description = reader["Description"].ToString(),
                    Fee = Convert.ToDecimal(reader["Fee"])
                });
            }
        }

        return View(list);
    }

    // Book Consultation
    public IActionResult Book(int id)
    {
        var model = new BookingViewModel();

        using (SqlConnection con = new SqlConnection(_conn))
        {
            con.Open();

            SqlCommand cmd = new SqlCommand(
                "SELECT Name, Fee FROM Doctors WHERE DoctorId=@id", con);

            cmd.Parameters.AddWithValue("@id", id);

            var reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                model.DoctorId = id;
                model.DoctorName = reader["Name"].ToString();
                model.Fee = Convert.ToDecimal(reader["Fee"]);
            }
        }

        model.TimeSlots = new List<string>
        {
            "09:00 AM",
            "10:00 AM",
            "11:00 AM",
            "02:00 PM",
            "03:00 PM",
            "04:00 PM"
        };

        return View(model);
    }

    // Send data to payment
    [HttpPost]
    public IActionResult Book(BookingViewModel model)
    {
        TempData["DoctorId"] = model.DoctorId;
        TempData["DoctorName"] = model.DoctorName;
        TempData["Date"] = model.SelectedDate.ToString();
        TempData["Time"] = model.SelectedTime;
        TempData["Fee"] = model.Fee.ToString();

        TempData.Keep();

        return RedirectToAction("Index", "Payment");
    }

    // Save after payment
    public async Task<IActionResult> SaveAfterPayment()
    {
        var userId = _userManager.GetUserId(User);

        int doctorId = int.Parse(TempData["DoctorId"].ToString());

        string doctorName = TempData["DoctorName"].ToString();

        DateTime date =
            DateTime.Parse(TempData["Date"].ToString());

        string time =
            TempData["Time"].ToString();

        decimal fee =
            decimal.Parse(TempData["Fee"].ToString());

        TempData.Keep();

        // Zoom Link
        string zoomLink =
            "https://plymouth.zoom.us/j/4934069922";

        // Save consultations
        using (SqlConnection con = new SqlConnection(_conn))
        {
            con.Open();

            SqlCommand cmd = new SqlCommand(@"

INSERT INTO Consultations
(
    DoctorId,
    UserId,
    DoctorName,
    AppointmentDate,
    TimeSlot,
    Type,
    Fee,
    Status,
    PaymentStatus,
    Symptoms,
    IsCompleted,
    IsCancelled,
    CreatedAt
)
VALUES
(
    @DoctorId,
    @UserId,
    @DoctorName,
    @AppointmentDate,
    @TimeSlot,
    @Type,
    @Fee,
    @Status,
    @PaymentStatus,
    @Symptoms,
    @IsCompleted,
    @IsCancelled,
    GETDATE()
)

", con);

            cmd.Parameters.AddWithValue("@DoctorId", doctorId);

            cmd.Parameters.AddWithValue("@UserId", userId);

            cmd.Parameters.AddWithValue("@DoctorName", doctorName);

            cmd.Parameters.AddWithValue("@AppointmentDate", date);

            cmd.Parameters.AddWithValue("@TimeSlot", time);

            cmd.Parameters.AddWithValue("@Type", "Video");

            cmd.Parameters.AddWithValue("@Fee", fee);

            cmd.Parameters.AddWithValue("@Status", "Pending");

            cmd.Parameters.AddWithValue("@PaymentStatus", "Paid");

            cmd.Parameters.AddWithValue("@Symptoms", "");

            cmd.Parameters.AddWithValue("@IsCompleted", false);

            cmd.Parameters.AddWithValue("@IsCancelled", false);

            cmd.ExecuteNonQuery();
        }

        // USER EMAIL
        var user = await _userManager.GetUserAsync(User);

        string email = user.Email;

        // EMAIL BODY
        string body = $@"
<html>
<head>
<style>
    body {{
        font-family: Arial;
        background-color: #f4f6f8;
        padding: 20px;
    }}
    .container {{
        max-width: 600px;
        margin: auto;
        background: #fff;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    }}
    .header {{
        background: #2c3e50;
        color: white;
        padding: 20px;
        text-align: center;
        font-size: 22px;
    }}
    .content {{
        padding: 20px;
        color: #333;
    }}
    .box {{
        background: #f8f9fa;
        padding: 15px;
        border-radius: 8px;
        margin-top: 10px;
    }}
    .btn {{
        display: inline-block;
        margin-top: 20px;
        background: #28a745;
        color: white;
        padding: 12px 18px;
        text-decoration: none;
        border-radius: 6px;
        font-weight: bold;
    }}
    .footer {{
        text-align: center;
        font-size: 12px;
        color: #777;
        padding: 15px;
        background: #f1f1f1;
    }}
</style>
</head>

<body>

<div class='container'>

    <div class='header'>
        MindCare Appointment Confirmed
    </div>

    <div class='content'>

        <p>Hello <strong>{email}</strong>,</p>

        <p>Your consultation has been successfully booked.</p>

        <div class='box'>
            <p><strong>Doctor:</strong> {doctorName}</p>
            <p><strong>Date:</strong> {date.ToShortDateString()}</p>
            <p><strong>Time:</strong> {time}</p>
            <p><strong>Fee:</strong> Rs. {fee}</p>
        </div>

        <p>Please join your session using the button below:</p>

        <a href='{zoomLink}' class='btn'>Join Zoom Meeting</a>

        <p style='margin-top:15px;'>If button doesn't work:</p>
        <p>{zoomLink}</p>

        <p style='margin-top:15px;'>Please join 5 minutes early.</p>

    </div>

    <div class='footer'>
        © 2026 MindCare | Mental Health Support System
    </div>

</div>

</body>
</html>
";

        // Send email
        _emailService.SendEmail(
            email,
            "MindCare Appointment Confirmation",
            body);

        return RedirectToAction("MyAppointments");
    }

    // User Appointments
    public IActionResult MyAppointments()
    {
        var list = new List<Consultation>();

        var userId = _userManager.GetUserId(User);

        using (SqlConnection con = new SqlConnection(_conn))
        {
            SqlCommand cmd = new SqlCommand(@"

SELECT *
FROM Consultations
WHERE UserId=@Id
ORDER BY AppointmentDate DESC

", con);

            cmd.Parameters.AddWithValue("@Id", userId);

            con.Open();

            var reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                list.Add(new Consultation
                {
                    ConsultationId =
                        (int)reader["ConsultationId"],

                    DoctorId =
                        (int)reader["DoctorId"],

                    UserId =
                        reader["UserId"].ToString(),

                    DoctorName =
                        reader["DoctorName"].ToString(),

                    AppointmentDate =
                        Convert.ToDateTime(reader["AppointmentDate"]),

                    TimeSlot =
                        reader["TimeSlot"].ToString(),

                    Type =
                        reader["Type"].ToString(),

                    Fee =
                        Convert.ToDecimal(reader["Fee"]),

                    Status =
                        reader["Status"].ToString(),

                    PaymentStatus =
                        reader["PaymentStatus"].ToString(),

                    Symptoms =
                        reader["Symptoms"].ToString(),

                    IsCompleted =
                        Convert.ToBoolean(reader["IsCompleted"]),

                    IsCancelled =
                        Convert.ToBoolean(reader["IsCancelled"]),

                    CreatedAt =
                        Convert.ToDateTime(reader["CreatedAt"])
                });
            }
        }

        return View(list);
    }
}