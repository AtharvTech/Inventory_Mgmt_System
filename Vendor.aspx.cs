using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Vendor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    

    protected void btnFilter_Click(object sender, EventArgs e)
    {
        // Get the invoice number entered in the search textbox
        string invoiceNo = find_by_date.Text.Trim();

        // Define the base query
        string query = "SELECT [order_no], [date], [vendor_name], [v_gst], [Total_amt], [payment_mode] FROM [purchase_order_details]";

        // If the invoice number is not empty, add a WHERE clause to filter by invoice number
        if (!string.IsNullOrEmpty(invoiceNo))
        {
            query += " WHERE vendor_name LIKE @invoiceNo";
        }

        // Set the modified query to the SqlDataSource's SelectCommand
        SqlDataSource1.SelectCommand = query;

        // Add the parameter to avoid SQL injection
        SqlDataSource1.SelectParameters.Clear();
        SqlDataSource1.SelectParameters.Add("invoiceNo", "%" + invoiceNo + "%");

        // Rebind the DataList to apply the filter
        DataList1.DataBind();
    }
}