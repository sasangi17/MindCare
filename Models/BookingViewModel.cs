namespace MindCare_Pro.Models
{
    public class BookingViewModel
    {
        public int DoctorId { get; set; }
        public string DoctorName { get; set; }
        public string Specialization { get; set; }
        public string Description { get; set; }

        public DateTime SelectedDate { get; set; }
        public string SelectedTime { get; set; }
        public string ConsultationType { get; set; }

        public decimal Fee { get; set; }

        public List<string> TimeSlots { get; set; } = new List<string>();
    }
}