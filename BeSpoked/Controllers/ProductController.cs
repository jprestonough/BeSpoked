using BeSpoked.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;

namespace BeSpoked.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        private IConfiguration _configuration;

        public ProductController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        [HttpGet("GetProductsList")]
        public List<Product> GetProductsList()
        {
            List<Product> products = new List<Product>();

            using (MySqlConnection connection = new MySqlConnection(_configuration.GetConnectionString("Sales")))
            {
                MySqlCommand command = new MySqlCommand("GetProductsList", connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;

                connection.Open();
                using (MySqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        products.Add(new Product
                        {
                            ProductId = reader.GetInt32("ProductId"),
                            ProductName = reader.GetString("ProductName"),
                            Manufacturer = reader.GetString("Manufacturer"),
                            Style = reader.GetString("Style"),
                            SalePrice = reader.GetDecimal("SalePrice"),
                            QuantityNbr = reader.GetInt32("QuantityNbr"),
                            CommissionPct = reader.GetDecimal("CommissionPct")
                        });
                    }
                }
            }

            return products;
        }
    }
}
