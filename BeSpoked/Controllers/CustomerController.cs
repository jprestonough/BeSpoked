using BeSpoked.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;

namespace BeSpoked.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CustomerController : ControllerBase
    {
        private IConfiguration _configuration;

        public CustomerController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        [HttpGet("GetCustomerList")]
        public List<Customer> GetCustomerList()
        {
            List<Customer> customerList = new List<Customer>();

            using (MySqlConnection connection = new MySqlConnection(_configuration.GetConnectionString("Sales")))
            {
                MySqlCommand command = new MySqlCommand("GetCustomerList", connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;

                connection.Open();
                using (MySqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        customerList.Add(new Customer
                        {
                            CustomerId = reader.GetInt32("CustomerId"),
                            FirstName = reader.GetString("FirstName"),
                            LastName = reader.GetString("LastName"),
                            FullName = reader.GetString("FullName"),
                            Address = reader.GetString("Address"),
                            PhoneNumber = reader.GetString("PhoneNumber"),
                            StartDate = reader.GetDateTime("StartDate")
                        });
                    }
                }
            }

            return customerList;
        }
    }
}
