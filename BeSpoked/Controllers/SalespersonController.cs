using BeSpoked.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;

namespace BeSpoked.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SalespersonController : ControllerBase
    {
        private IConfiguration _configuration;

        public SalespersonController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        [HttpGet("GetSalespersonList")]
        public List<Salesperson> GetSalespersonList()
        {
            List<Salesperson> salespersonList = new List<Salesperson>();

            using (MySqlConnection connection = new MySqlConnection(_configuration.GetConnectionString("Sales")))
            {
                MySqlCommand command = new MySqlCommand("GetSalespersonList", connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;

                connection.Open();
                using (MySqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        salespersonList.Add(new Salesperson
                        {
                            SalespersonId = reader.GetInt32("SalespersonId"),
                            FirstName = reader.GetString("FirstName"),
                            LastName = reader.GetString("LastName"),
                            FullName = reader.GetString("FullName"),
                            Address = reader.GetString("Address"),
                            PhoneNumber = reader.GetString("PhoneNumber"),
                            StartDate = reader.GetDateTime("StartDate"),
                            TerminationDate = !reader.IsDBNull(reader.GetOrdinal("TerminationDate")) ? reader.GetDateTime("TerminationDate") : null,
                            ManagerName = reader.GetString("ManagerName")
                        });
                    }
                }
            }

            return salespersonList;
        }
    }
}
