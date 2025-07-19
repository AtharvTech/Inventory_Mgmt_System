using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class log_in : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        uid.Focus();
        if (!IsPostBack){
            uid.Text = "";
            pass.Text = "";
        }
    }

    
    protected void logIn_Click(object sender, EventArgs e)
    {
        // Establish a connection to the database using the connection string from the configuration file
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString))
        {
            // Define the SQL query to check if a user with the provided credentials exists
            string query = "SELECT COUNT(1) FROM user_registration WHERE u_id = @u_id AND password = @password";

            // Create a SqlCommand object with the query and connection
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                // Define the parameters and their values to prevent SQL injection
                cmd.Parameters.AddWithValue("@u_id", uid.Text.Trim());
                cmd.Parameters.AddWithValue("@password", pass.Text.Trim());


                try
                {
                    // Open the connection
                    con.Open();

                    // Execute the query and retrieve the count
                    int userCount = Convert.ToInt32(cmd.ExecuteScalar());

                    // Check if a user with the provided credentials exists
                    if (userCount == 1)
                    {
                        // For now, redirect to SelectCompanies.aspx

                        string username = uid.Text;
                        Session["Username"] = username;  // Store in session
                        // Redirect to another page
                        Response.Redirect("SelectComponies.aspx");
                    }
                    else
                    {
                        // Display an error message if credentials are incorrect

                       
                       error.Text = "Incorrect Credentials";
                       
                    }
                }
                catch (Exception ex)
                {
                    // Log the exception (implement logging as needed)
                    // Display a generic error message
                    error.Text = "An error occurred. Please try again later.";
                }
            }
        }
    }

    protected void signUp_Click(object sender, EventArgs e)
    {
        Response.Redirect("SignUp.aspx");
    }
}