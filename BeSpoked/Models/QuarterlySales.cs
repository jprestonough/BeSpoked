namespace BeSpoked.Models
{
    public class QuarterlySales
    {
        public string SalespersonFullname { get; set; }
        public string SalesQuarterYear { get; set; }
        public int TotalSalesCount { get; set; }
        public decimal TotalSalesPrice { get; set; }
        public decimal TotalSalesCommission { get; set; }
    }
}
