using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        fetch_info1();
        fetch_info2();
        fetch_info3();
        fetch_info4();
    }
    //customer
    private void fetch_info1() {
        // Define the connection string
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);

        // Define the SQL query to get the unique customer count
        string query = "SELECT COUNT(DISTINCT customer_name) FROM sales_order_details";

        // Create the SQL command object
        SqlCommand cmd = new SqlCommand(query, con);

        try
        {
            // Open the connection
            con.Open();

            // Execute the query and get the count of unique customers
            int uniqueCustomerCount = (int)cmd.ExecuteScalar(); // ExecuteScalar() returns the first column of the first row

            // Display the result (you can bind this to a label, for example)
            customer.Text = uniqueCustomerCount.ToString();
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
        string query = "SELECT COUNT(*) FROM products";

        // Create the SQL command object
        SqlCommand cmd = new SqlCommand(query, con);

        try
        {
            // Open the connection
            con.Open();

            // Execute the query and get the count
            int productCount = (int)cmd.ExecuteScalar(); // ExecuteScalar() returns the first column of the first row

            // Display the result (you can bind this to a label, for example)
            products.Text = productCount.ToString();
        }
        catch (Exception ex)
        {
            // Handle any errors
            Response.Write("Error: " + ex.Message);
        }
    }
    //vendors
    private void fetch_info3()
    {
        // Define the connection string
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);

        // Define the SQL query to get the unique customer count
        string query = "SELECT COUNT(DISTINCT vendor_name) FROM purchase_order_details";

        // Create the SQL command object
        SqlCommand cmd = new SqlCommand(query, con);

        try
        {
            // Open the connection
            con.Open();

            // Execute the query and get the count of unique customers
            int uniquevendorCount = (int)cmd.ExecuteScalar(); // ExecuteScalar() returns the first column of the first row

            // Display the result (you can bind this to a label, for example)
            vendor.Text = uniquevendorCount.ToString();
        }
        catch (Exception ex)
        {
            // Handle any errors
            Response.Write("Error: " + ex.Message);
        }
    }

    //sales
    private void fetch_info4()
    {
        // Define the connection string
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);

        // Define the SQL query to get the number of bills
        string query = "SELECT COUNT(*) FROM sales_order_details";

        // Create the SQL command object
        SqlCommand cmd = new SqlCommand(query, con);

        try
        {
            // Open the connection
            con.Open();

            // Execute the query and get the count
            int billCount = (int)cmd.ExecuteScalar(); // ExecuteScalar() returns the first column of the first row

            // Display the result (you can bind this to a label, for example)
           sale.Text = billCount.ToString();
        }
        catch (Exception ex)
        {
            // Handle any errors
            Response.Write("Error: " + ex.Message);
        }
    }
}