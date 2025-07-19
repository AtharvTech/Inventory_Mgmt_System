using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class product_edit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind_data();
        }
    }
    protected void Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("product_list.aspx");
    }
    private void Bind_data()
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT p_name FROM products", con);
        SqlDataAdapter adpt = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        P_name.DataSource = dt;
        P_name.DataTextField = "p_name";
        P_name.DataValueField = "p_name";
        P_name.DataBind();
        

    }
    protected void Save_Changes_Click(object sender, EventArgs e)
    {
        // Define the connection string and create the connection object
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);

        // Define the base query for updating the product details
        string query = "UPDATE products SET ";

        // List of parameters for the SQL command
        List<SqlParameter> parameters = new List<SqlParameter>();

        // First, fetch the current values if the user did not fill a particular field
        // Get current values for each field if it is left empty

        string currentGst = "", currentSellingRate = "", currentMinStock = "", currentMaxStock = "";

        // Create a command to fetch the existing values for the product
        SqlCommand getCurrentValuesCmd = new SqlCommand("SELECT gst, selling_rate, min_stock, max_stock FROM products WHERE p_name = @p_name", con);
        getCurrentValuesCmd.Parameters.AddWithValue("@p_name", P_name.SelectedItem.Text);

        try
        {
            // Open connection to fetch the current values
            con.Open();

            // Execute the query and fetch the current values
            SqlDataReader reader = getCurrentValuesCmd.ExecuteReader();

            if (reader.Read()) // If a matching product is found
            {
                currentGst = reader["gst"].ToString();
                currentSellingRate = reader["selling_rate"].ToString();
                currentMinStock = reader["min_stock"].ToString();
                currentMaxStock = reader["max_stock"].ToString();
            }

            reader.Close(); // Close the reader after fetching data

            // Append the fields to be updated if the user provided new values
            if (!string.IsNullOrEmpty(GST.Text))
            {
                query += "gst = @gst, ";
                parameters.Add(new SqlParameter("@gst", GST.Text));
            }
            else
            {
                query += "gst = @gst, ";
                parameters.Add(new SqlParameter("@gst", currentGst)); // Use current value if empty
            }

            if (!string.IsNullOrEmpty(Selling_Price.Text))
            {
                query += "selling_rate = @selling_rate, ";
                parameters.Add(new SqlParameter("@selling_rate", Selling_Price.Text));
            }
            else
            {
                query += "selling_rate = @selling_rate, ";
                parameters.Add(new SqlParameter("@selling_rate", currentSellingRate)); // Use current value if empty
            }

            if (!string.IsNullOrEmpty(Minimum_Stock_Requried.Text))
            {
                query += "min_stock = @min_stock, ";
                parameters.Add(new SqlParameter("@min_stock", Minimum_Stock_Requried.Text));
            }
            else
            {
                query += "min_stock = @min_stock, ";
                parameters.Add(new SqlParameter("@min_stock", currentMinStock)); // Use current value if empty
            }

            if (!string.IsNullOrEmpty(Maximum_Stock_Requried.Text))
            {
                query += "max_stock = @max_stock, ";
                parameters.Add(new SqlParameter("@max_stock", Maximum_Stock_Requried.Text));
            }
            else
            {
                query += "max_stock = @max_stock, ";
                parameters.Add(new SqlParameter("@max_stock", currentMaxStock)); // Use current value if empty
            }

            // Remove the last comma and space
            query = query.TrimEnd(',', ' ') + " WHERE p_name = @p_name";

            // Add the product name parameter
            parameters.Add(new SqlParameter("@p_name", P_name.SelectedItem.Text));

            // Create a new SqlCommand for the UPDATE query
            SqlCommand cmd = new SqlCommand(query, con);

            // Add all parameters to the command
            cmd.Parameters.AddRange(parameters.ToArray());

            // Execute the query
            int rowsAffected = cmd.ExecuteNonQuery();

            // Check if any rows were affected
            if (rowsAffected > 0)
            {
                error.Text = "Changes Saved";
                GST.Text = "";
                Selling_Price.Text = "";
                Minimum_Stock_Requried.Text = "";
                Maximum_Stock_Requried.Text = "";

            }
            else
            {
                error.Text = "Failed. No changes made or product not found.";
            }
        }
        catch (Exception ex)
        {
            // Handle any exceptions (e.g., connection issues)
            error.Text = "Error: " + ex.Message;
        }
        finally
        {
            // Close the connection
            con.Close();
        }
        
        


    }
}