using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class pay_mod : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Save_Changes_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        string query = "insert into payment_mode(payment_mode,des) values(@payment_mode,@des)";
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@payment_mode", payment.Text);
        cmd.Parameters.AddWithValue("@des", des.Text);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

    }
    protected void Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("Analytics.aspx");
    }
}