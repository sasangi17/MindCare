using System.ComponentModel.DataAnnotations;

namespace MindCare_Pro.Models
{
    public class Doctor
    {
        public int DoctorId { get; set; }

        [Required]
        public string? Name { get; set; }

        [Required]
        public string? Specialization { get; set; }

        [Required]
        public string? Description { get; set; }

        [Required]
        public decimal Fee { get; set; }
    }
}