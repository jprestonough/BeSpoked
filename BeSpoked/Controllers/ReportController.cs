using BeSpoked.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;

namespace BeSpoked.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ReportController : ControllerBase
    {
        private IConfiguration _configuration;

        public ReportController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        [HttpGet("GetQuarterlySalesReport")]
        public List<QuarterlySales> GetQuarterlySalesReport()
        {
            List<QuarterlySales> reportList = new List<QuarterlySales>();

            using (MySqlConnection connection = new MySqlConnection(_configuration.GetConnectionString("Sales")))
            {
                MySqlCommand command = new MySqlCommand("GetQuarterlySalesReport", connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;

                connection.Open();
                using (MySqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        reportList.Add(new QuarterlySales
                        {
                            SalespersonFullname = reader.GetString("SalespersonFullname"),
                            SalesQuarterYear = reader.GetString("SalesQuarterYear"),
                            TotalSalesCount = reader.GetInt32("TotalSalesCount"),
                            TotalSalesPrice = reader.GetDecimal("TotalSalesPrice"),
                            TotalSalesCommission = reader.GetDecimal("TotalSalesCommission")
                        });
                    }
                }
            }

            return reportList;
        }
    }
}
