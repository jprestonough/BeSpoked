namespace BeSpoked.Models
{
    public class Sales
    {
        public DateTime SalesDate { get; set; }
        public string SalespersonFullname { get; set; }
        public string CustomerFullname { get; set; }
        public string ProductName { get; set; }
        public decimal PurchasePrice { get; set; }
        public decimal FinalPrice { get; set; }
        public decimal FinalCommission { get; set; }
    }
}
