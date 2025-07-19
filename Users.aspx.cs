using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Users : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        



        if (Session["Username"] != null && Session["Username"].ToString() == "Atharv885")
        {
            DataList1.DataBind(); // Bind data if the username matches
        }
        else
        {
            DataList1.DataSource = null;
            DataList1.DataBind();
            DataList1.Visible = false;
            Wrong_log_in.Text = "YOU DON'T HAVE AUTHORITY";
        }
    }
}