namespace MindCare_Pro.Models
{
    public class ProgressViewModel
    {
        public List<string> Dates { get; set; } = new List<string>();
        public List<int> Scores { get; set; } = new List<int>();

        public List<int> DepressionScores { get; set; } = new List<int>();
        public List<int> AnxietyScores { get; set; } = new List<int>();
        public List<int> StressScores { get; set; } = new List<int>();
    }
}