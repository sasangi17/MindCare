namespace MindCare_Pro.Models
{
    public class Reminder
    {
        public int ReminderId { get; set; }
        public string Id { get; set; }  
        public string Title { get; set; }
        public DateTime ReminderDate { get; set; }
        public bool IsCompleted { get; set; }
       
    }
}
