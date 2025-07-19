using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashbo : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] != null)
        {
            username.Text = Session["Username"].ToString();
            com_name.Text = Session["com_name"].ToString();
            username_off.Text = Session["Username"].ToString();
            com_name_off.Text = Session["com_name"].ToString();

        }
        else
        {
            Response.Redirect("log_in.aspx");  // Redirect if session is empty
        }

    }
    protected void log_out_Click(object sender, EventArgs e)
    {
        Session.Clear();  // Clears all session data
        Session.Abandon();  // Ends the session
        Response.Redirect("log_in.aspx");
    }
    protected void log_out_off_Click(object sender, EventArgs e)
    {
        Session.Clear();  // Clears all session data
        Session.Abandon();  // Ends the session
        Response.Redirect("log_in.aspx");

    }
}
