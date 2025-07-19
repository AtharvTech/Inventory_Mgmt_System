using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SelectComponies : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["Username"] != null)
        {
            user_logged.Text = Session["Username"].ToString();
            
            
        }
        else
        {
            Response.Redirect("Login.aspx");  // Redirect if session is empty
        }
        
    }

    protected void Create_Com_Click(object sender, EventArgs e)
    {
        Response.Redirect("createCom.aspx");
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {

        Button btn = (Button)sender;
        string com_name = btn.CommandArgument.ToString();

        if (Session["Username"] != null)
        {
            Session["Username"] = user_logged.Text;
            Session["com_name"] = com_name;
            Response.Redirect("dashboard.aspx"); 

        }
        else
        {
            Response.Redirect("Login.aspx");  // Redirect if session is empty
        }
    }
}