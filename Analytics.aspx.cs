using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Analytics : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        fetch_info1();
        fetch_info2();
        fetch_info3();
    }
    protected void Payment_mode_Click(object sender, EventArgs e)
    {
        Response.Redirect("pay_mod.aspx");
    }
    //customer
    private void fetch_info1()
    {
        // Define the connection string
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);

        // Define the SQL query to get the unique customer count
        string query = "SELECT COUNT(DISTINCT p_name) FROM products";

        // Create the SQL command object
        SqlCommand cmd = new SqlCommand(query, con);

        try
        {
            // Open the connection
            con.Open();

            // Execute the query and get the count of unique customers
            int uniqueCustomerCount = (int)cmd.ExecuteScalar(); // ExecuteScalar() returns the first column of the first row

            // Display the result (you can bind this to a label, for example)
            Total_p.Text = uniqueCustomerCount.ToString();
        }
        catch (Exception ex)
        {
            // Handle any errors
            Response.Write("Error: " + ex.Message);
        }
    }
    //products
    private void fetch_info2()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        // Define the SQL query to get the product count
        string query = "SELECT SUM(CAST(quantity AS INT)) AS total_stock_quantity FROM products;";

        // Create the SQL command object
        SqlCommand cmd = new SqlCommand(query, con);

        try
        {
            // Open the connection
            con.Open();

            // Execute the query and get the count
            int productCount = (int)cmd.ExecuteScalar(); // ExecuteScalar() returns the first column of the first row

            // Display the result (you can bind this to a label, for example)
            Total_Stock_Quantity.Text = productCount.ToString();
        }
        catch (Exception ex)
        {
            // Handle any errors
            Response.Write("Error: " + ex.Message);
        }
    }

    private void fetch_info3()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        // Define the SQL query to get the product count
        string query = "SELECT SUM(CAST(valuation AS INT)) AS inv_v FROM products;";

        // Create the SQL command object
        SqlCommand cmd = new SqlCommand(query, con);

        try
        {
            // Open the connection
            con.Open();

            // Execute the query and get the count
            int productCount = (int)cmd.ExecuteScalar(); // ExecuteScalar() returns the first column of the first row

            // Display the result (you can bind this to a label, for example)
            inv_value.Text = productCount.ToString();
        }
        catch (Exception ex)
        {
            // Handle any errors
            Response.Write("Error: " + ex.Message);
        }
    }
   
    
}