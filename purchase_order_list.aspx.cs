using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class purchase_order_list : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime currentDate = DateTime.Today;
        string D = currentDate.ToString("dd-MM-yyyy");
        date.Text = D;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Purchase.aspx");
    }
    protected void search_Click(object sender, EventArgs e)
    {
        // Get the search term entered in the TextBox
        string searchTerm = find_P_invoice.Text.Trim();

        // Define the base query
        string query = "SELECT [order_no], [date], [vendor_name], [Total_amt], [payment_mode] FROM [purchase_order_details]";

        // If the search term is not empty, add a WHERE clause to filter the records
        if (!string.IsNullOrEmpty(searchTerm))
        {
            query += " WHERE order_no LIKE @searchTerm";
        }

        // Set the modified query to the SqlDataSource's SelectCommand
        SqlDataSource1.SelectCommand = query;

        // Add the parameter to avoid SQL injection
        SqlDataSource1.SelectParameters.Clear();
        SqlDataSource1.SelectParameters.Add("searchTerm", "%" + searchTerm + "%");

        // Rebind the DataList to apply the filter
        DataList1.DataBind();

    }
    
    protected void view_purchase_bill_Click(object sender, EventArgs e)
    {
        // Get the Order Number (s_order_no) from the CommandArgument
        Button btn = (Button)sender;
        string orderNo = btn.CommandArgument.ToString();

        // Redirect to the Bill page and pass the Order Number as a query string
        Response.Redirect("view_purchase_bill.aspx?order_no=" + orderNo);
    }
}