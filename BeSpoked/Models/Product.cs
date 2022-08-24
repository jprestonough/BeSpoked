namespace BeSpoked.Models
{
    public class Product
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public string Manufacturer { get; set; }
        public string Style { get; set; }
        public decimal SalePrice { get; set; }
        public int QuantityNbr { get; set; }
        public decimal CommissionPct { get; set; }
    }
}
