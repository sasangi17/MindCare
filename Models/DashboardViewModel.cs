namespace MindCare_Pro.Models
{
    public class DashboardViewModel
    {
        public int TotalAssessments { get; set; }
        public double AverageScore { get; set; }
        public int TotalReminders { get; set; }
        public int CompletedReminders { get; set; }
        public int TotalConsultations { get; set; }

        
        public int DepressionScore { get; set; }
        public int AnxietyScore { get; set; }
        public int StressScore { get; set; }

        public string DepressionLevel { get; set; }
        public string AnxietyLevel { get; set; }
        public string StressLevel { get; set; }

        public DateTime LastAssessmentDate { get; set; }

        public List<int> WeeklyScores { get; set; } = new List<int>();
        public List<string> WeeklyLabels { get; set; } = new List<string>();
        public List<Reminder> TodayReminders { get; set; } = new List<Reminder>();
    }
}