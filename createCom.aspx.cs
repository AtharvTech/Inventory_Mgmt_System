using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class createCom : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        C_name.Focus();
        //if (IsPostBack) { 
        //    C_name.Text = "";
        //    com_email.Text = "";
        //    com_address.Text = "";
        //}
    }
    protected void saveCompany_Click(object sender, EventArgs e)
    {
        try
        {

            DateTime currentDate = DateTime.Today;
            string D = currentDate.ToString("dd-MM-yyyy");

            string company_id = GeneratecompanyId();

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            string query = "insert into Companies(com_id,company_name,company_email,company_address,date_of_creation) values (@com_id,@company_name,@company_email,@company_address,@date_of_creation)";
            SqlCommand cmd = new SqlCommand(query , con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@com_id", company_id);
            cmd.Parameters.AddWithValue("@company_name", C_name.Text);
            cmd.Parameters.AddWithValue("@company_email", com_email.Text);
            cmd.Parameters.AddWithValue("@company_address", com_address.Text);
            cmd.Parameters.AddWithValue("@date_of_creation", D);

            con.Open();
            //cmd.ExecuteNonQuery();

            if (company_id == "" || C_name.Text == "" || com_email.Text == "" || com_address.Text == "")
            {
                
                error.Text = "Kindly Fill Up All Data !";
            }
            else
            {
                int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected > 0){
                        Response.Redirect("SelectComponies.aspx");
                    }
                    else
                    {
                        error.Text = "error";
                    }

                con.Close();
            }
            
        }
        catch {
            throw;
        }

    }
    public static string GeneratecompanyId()
    {
        // Random number generator
        Random rand = new Random();

        // Generate 3 random digits
        string numericPart = rand.Next(001, 1000).ToString(); // 3 digits

        // Generate 3 random alphabetic characters (uppercase letters)
        //string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        string charPart = "Com";
        //for (int i = 0; i < 3; i++)
        //{
        //    charPart += chars[rand.Next(chars.Length)]; // Random letter from A to Z
        //}

        // Combine both parts
        return charPart + numericPart;
    }
}