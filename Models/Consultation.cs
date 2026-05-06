namespace MindCare_Pro.Models
{
    public class Consultation
    {
        public int ConsultationId { get; set; }
        public string DoctorName { get; set; }

        public DateTime AppointmentDate { get; set; }
        public string TimeSlot { get; set; }
        public string Type { get; set; }

        public decimal Fee { get; set; }
        public string Status { get; set; }
        public DateTime CreatedAt { get; set; }

    }
}