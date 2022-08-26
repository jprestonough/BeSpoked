using BeSpoked.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using System.Dynamic;

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

        [HttpPost("UpsertCustomer")]
        public object UpsertCustomer(Customer customer)
        {
            dynamic ret = new ExpandoObject();

            using (MySqlConnection connection = new MySqlConnection(_configuration.GetConnectionString("Sales")))
            {
                MySqlCommand command = new MySqlCommand("UpsertCustomer", connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;

                command.Parameters.AddWithValue("inCustomerId", customer.CustomerId ?? 0);
                command.Parameters.AddWithValue("inFirstName", customer.FirstName.Trim());
                command.Parameters.AddWithValue("inLastName", customer.LastName.Trim());
                command.Parameters.AddWithValue("inAddress", customer.Address.Trim());
                command.Parameters.AddWithValue("inPhoneNumber", customer.PhoneNumber.Trim());
                command.Parameters.AddWithValue("inStartDate", customer.StartDate);

                connection.Open();
                using (MySqlDataReader reader = command.ExecuteReader())
                {
                    reader.Read();

                    ret.ResultStatus = reader.GetBoolean("ResultStatus");
                    ret.ResultMessage = reader.GetString("ResultMessage");
                }
            }

            return ret;
        }
    }
}
