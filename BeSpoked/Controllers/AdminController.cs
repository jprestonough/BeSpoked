using BeSpoked.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;

namespace BeSpoked.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AdminController : ControllerBase
    {
        private IConfiguration _configuration;

        public AdminController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        [HttpPost("ResetSampleData")]
        public void ResetSampleData()
        {
            using (MySqlConnection connection = new MySqlConnection(_configuration.GetConnectionString("Sales")))
            {
                MySqlCommand command = new MySqlCommand("ResetSampleData", connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;

                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }
}
