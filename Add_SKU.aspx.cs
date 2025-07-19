using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Add_SKU : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SKU_name.Focus();
    }
    protected void Save_SKU_Click(object sender, EventArgs e)
    {
        try
        {
            DateTime currentDate = DateTime.Today;
            string D = currentDate.ToString("dd-MM-yyyy");

            string skuId = GenerateSKUtId();
            

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            //SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=C:\\Users\\Admin\\Documents\\Visual Studio 2010\\WebSites\\StockTrackIMS\\App_Data\\Database.mdf;Integrated Security=True;User Instance=True");
            SqlCommand cmd = new SqlCommand("insert into SKUs(SKU_id,SKU_name,SKU_des,date_of_creation) values (@SKU_id,@SKU_name,@SKU_des,@date_of_creation)", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@SKU_id", skuId);
            cmd.Parameters.AddWithValue("@SKU_name", SKU_name.Text);
            cmd.Parameters.AddWithValue("@SKU_des", SKU_des.Text);
            cmd.Parameters.AddWithValue("@date_of_creation", D);
            




            con.Open();
            //cmd.ExecuteNonQuery();

            if (SKU_name.Text == "" || SKU_des.Text == "")
            {
                error.Text = "Kindly Fill Up All Data !";
                msg.Text = "";
            }
            else
            {


                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    // Record inserted successfully
                    msg.Text = "Success";
                    error.Text = "";
                    SKU_name.Text = "";
                    SKU_des.Text = "";



                }
                else
                {
                    // Insertion failed
                    error.Text = "Insertion failed.";
                }
                con.Close();



            }
            //con.Close();

        }
        catch 
        {

        }
    }
    public static string GenerateSKUtId()
    {
        // Random number generator
        Random rand = new Random();

        // Generate 3 random digits
        string numericPart = rand.Next(001, 1000).ToString(); // 3 digits

        return numericPart;
    }
    protected void back_Click(object sender, EventArgs e)
    {
        Response.Redirect("Categories.aspx");
    }
}