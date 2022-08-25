namespace BeSpoked.Models
{
    public class Sale
    {
        public DateTime SalesDate { get; set; }
        public int SalespersonId { get; set; }
        public int CustomerId { get; set; }
        public int ProductId { get; set; }
    }
}
