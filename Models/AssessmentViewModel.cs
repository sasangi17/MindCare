namespace MindCare_Pro.Models
{
    public class AssessmentViewModel
    {
        public List<Question> Questions { get; set; }
        public Dictionary<int, int> Answers { get; set; } = new Dictionary<int, int>();
    }
}
