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
            List<Product> productList = new List<Product>();

            using (MySqlConnection connection = new MySqlConnection(_configuration.GetConnectionString("Sales")))
            {
                MySqlCommand command = new MySqlCommand("GetProductsList", connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;

                connection.Open();
                using (MySqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        productList.Add(new Product
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

            return productList;
        }

        [HttpGet("GetProductFilter")]
        public List<ProductFilter> GetProductFilter()
        {
            List<ProductFilter> productList = new List<ProductFilter>();

            using (MySqlConnection connection = new MySqlConnection(_configuration.GetConnectionString("Sales")))
            {
                MySqlCommand command = new MySqlCommand("GetProductFilter", connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;

                connection.Open();
                using (MySqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        productList.Add(new ProductFilter
                        {
                            ProductId = reader.GetInt32("ProductId"),
                            FilterText = reader.GetString("FilterText")
                        });
                    }
                }
            }

            return productList;
        }
    }
}
