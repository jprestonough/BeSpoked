using BeSpoked.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;

namespace BeSpoked.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SalesController : ControllerBase
    {
        private IConfiguration _configuration;

        public SalesController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        [HttpGet("GetSalesList")]
        public List<Sales> GetSalesList()
        {
            List<Sales> salesList = new List<Sales>();

            using (MySqlConnection connection = new MySqlConnection(_configuration.GetConnectionString("Sales")))
            {
                MySqlCommand command = new MySqlCommand("GetSalesList", connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;

                connection.Open();
                using (MySqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        salesList.Add(new Sales
                        {
                            SalesDate = reader.GetDateTime("SalesDate"),
                            SalespersonFullname = reader.GetString("SalespersonFullname"),
                            CustomerFullname = reader.GetString("CustomerFullname"),
                            ProductName = reader.GetString("ProductName"),
                            PurchasePrice = reader.GetDecimal("PurchasePrice"),
                            FinalPrice = reader.GetDecimal("FinalPrice"),
                            FinalCommission = reader.GetDecimal("FinalCommission")
                        });
                    }
                }
            }

            return salesList;
        }
    }
}
