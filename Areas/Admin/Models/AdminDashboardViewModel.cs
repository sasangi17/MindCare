using MindCare_Pro.Models;

namespace MindCare_Pro.Areas.Admin.Models
{
    public class AdminDashboardViewModel
    {
        public int TotalConsultations { get; set; }

        public int PaidConsultations { get; set; }

        public int PendingConsultations { get; set; }

        public decimal TotalRevenue { get; set; }

        public decimal TodayRevenue { get; set; }

        public List<Consultation> RecentConsultations { get; set; }
    }
}
