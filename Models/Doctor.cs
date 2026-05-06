namespace MindCare_Pro.Models
{
    public class Doctor
    {
        public int DoctorId { get; set; }
        public string Name { get; set; }
        public string Specialization { get; set; }
        public string Description { get; set; }
        public decimal Fee { get; set; }
    }
}