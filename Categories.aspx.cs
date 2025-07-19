using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Categories : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Save_Category_Click(object sender, EventArgs e)
    {
        try
        {

            string catId = GeneratecatId();
            DateTime currentDate = DateTime.Today;
            string D = currentDate.ToString("dd-MM-yyyy");

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            //SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=C:\\Users\\Admin\\Documents\\Visual Studio 2010\\WebSites\\StockTrackIMS\\App_Data\\Database.mdf;Integrated Security=True;User Instance=True");
            SqlCommand cmd = new SqlCommand("insert into categories(cat_id,cat_name,cat_des,cat_gen_date)values (@cat_id,@cat_name,@cat_des,@cat_gen_date)", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@cat_id", catId);
            cmd.Parameters.AddWithValue("@cat_name", Category_name.Text);
            cmd.Parameters.AddWithValue("@cat_des", cat_des.Text);
            
            cmd.Parameters.AddWithValue("@cat_gen_date", D);




            if (catId == "" || Category_name.Text == "" || cat_des.Text == "")
            {
                error.Text = "Fill All Data";
                msg.Text = "";
            }
            else {
                con.Open();

                int rowsaffected = cmd.ExecuteNonQuery();
                if (rowsaffected > 0)
                {
                    //Response.Redirect("Categories.aspx");
                    msg.Text = "Success";
                    error.Text = "";
                    Category_name.Text = "";
                    cat_des.Text = "";
                    DataList1.DataBind();
                    
                }
                else
                {
                    error.Text = "Something went wrong !";
                }
            }
            
            
            con.Close();


        }
        catch (Exception ex)
        {
            
        }
    }
    public static string GeneratecatId()
    {
        // Random number generator
        Random rand = new Random();

        // Generate 3 random digits
        string numericPart = "C_" + rand.Next(001, 1000).ToString(); // 3 digits

        return numericPart;
    }
    protected void SKU_form_Click(object sender, EventArgs e)
    {
        Response.Redirect("Add_SKU.aspx");
;    }
}