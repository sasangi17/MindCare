namespace MindCare_Pro.Models
{
    public class AdminUserMentalHealthViewModel
    {
        public string UserId { get; set; }

        public string UserName { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public int TotalScore { get; set; }

        public int DepressionScore { get; set; }

        public int AnxietyScore { get; set; }

        public int StressScore { get; set; }

        public DateTime AssessmentDate { get; set; }

        public string CurrentCondition { get; set; }

        public List<AssessmentHistoryItem> History { get; set; }
    }

    public class AssessmentHistoryItem
    {
        public int TotalScore { get; set; }

        public int DepressionScore { get; set; }

        public int AnxietyScore { get; set; }

        public int StressScore { get; set; }

        public DateTime AssessmentDate { get; set; }

        public string Condition { get; set; }
    }
}