using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Customer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            search_customer.Text = "";
        }
    }
    protected void search_invoice_Click(object sender, EventArgs e)
    {
        // Get the invoice number entered in the search textbox
        string invoiceNo = search_customer.Text.Trim();

        // Define the base query
        string query = "SELECT [s_order_no], [date], [customer_name], [total_amt] FROM [sales_order_details]";

        // If the invoice number is not empty, add a WHERE clause to filter by invoice number
        if (!string.IsNullOrEmpty(invoiceNo))
        {
            query += " WHERE s_order_no LIKE @invoiceNo";
        }

        // Set the modified query to the SqlDataSource's SelectCommand
        SqlDataSource1.SelectCommand = query;

        // Add the parameter to avoid SQL injection
        SqlDataSource1.SelectParameters.Clear();
        SqlDataSource1.SelectParameters.Add("invoiceNo", "%" + invoiceNo + "%");

        // Rebind the DataList to apply the filter
        DataList1.DataBind();
    }



    protected void btnViewBill_Click(object sender, EventArgs e)
    {
        // Get the Order Number (s_order_no) from the CommandArgument
        Button btn = (Button)sender;
        string orderNo = btn.CommandArgument.ToString();

        // Redirect to the Bill page and pass the Order Number as a query string
        Response.Redirect("bill.aspx?s_order_no=" + orderNo);
    }

}