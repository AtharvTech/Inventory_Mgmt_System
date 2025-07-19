using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class product_list : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            search_p.Text = "";
        }
    }
    protected void back_Click(object sender, EventArgs e)
    {
        Response.Redirect("product.aspx");
    }
    protected void Search_Click(object sender, EventArgs e)
    {

    }
    protected void Edit_prod_Click(object sender, EventArgs e)
    {
        Response.Redirect("product_edit.aspx");
    }
    protected void Searchp_Click(object sender, EventArgs e)
    {
        // Get the search term entered in the TextBox
        string searchTerm = search_p.Text.Trim();

        // Define the base query
        string query = "SELECT [p_id], [p_name], [category], [unit_measure], [gst], [purchase_rate], [selling_rate] FROM [products]";

        // If the search term is not empty, add a WHERE clause to filter the records
        if (!string.IsNullOrEmpty(searchTerm))
        {
            query += " WHERE p_name LIKE @searchTerm";
        }

        // Set the modified query to the SqlDataSource's SelectCommand
        SqlDataSource1.SelectCommand = query;

        // Add the parameter to avoid SQL injection
        SqlDataSource1.SelectParameters.Clear();
        SqlDataSource1.SelectParameters.Add("searchTerm", "%" + searchTerm + "%");

        // Rebind the DataList to apply the filter
        DataList1.DataBind();
    }





    protected void view_Click(object sender, EventArgs e)
    {
        // Get the CommandArgument (p_id) from the button click
        Button btn = (Button)sender;
        string p_id = btn.CommandArgument;

        // Redirect to the new page with p_id as a query string
        Response.Redirect("view_prod.aspx?p_id=" + p_id);
    }
}