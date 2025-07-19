using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class bill : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
    {

        

        string orderNo = Request.QueryString["s_order_no"];
        if (!string.IsNullOrEmpty(orderNo))
        {
            // Define the query to fetch the data based on the order number
            string query = "SELECT [s_order_no], [date], [customer_name], [total_amt] FROM [sales_order_details] WHERE s_order_no = @s_order_no";

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@s_order_no", orderNo);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                // Check if any data is returned
                if (dt.Rows.Count > 0)
                {
                    // Bind data to the labels
                    lblOrderNo.Text = dt.Rows[0]["s_order_no"].ToString();
                    lblOrderDate.Text = dt.Rows[0]["date"].ToString();
                    lblCustomerName.Text = dt.Rows[0]["customer_name"].ToString();
                    lblTotalAmount.Text = dt.Rows[0]["total_amt"].ToString();
                }
                else
                {
                    // Handle case where no data is found
                    lblOrderNo.Text = "No data found";
                    lblOrderDate.Text = "No data found";
                    lblCustomerName.Text = "No data found";
                    lblTotalAmount.Text = "No data found";
                }
            }
        }
    }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Customer.aspx");
    }
}