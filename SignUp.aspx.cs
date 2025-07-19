using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class SignUp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void signupbtn_Click(object sender, EventArgs e)
    {
        try
        {

            string userId = GenerateusertId();
            DateTime currentDate = DateTime.Today;
            //string D = currentDate.ToString("dd-MM-yyyy");

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            //SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=C:\\Users\\Admin\\Documents\\Visual Studio 2010\\WebSites\\StockTrackIMS\\App_Data\\Database.mdf;Integrated Security=True;User Instance=True");
            SqlCommand cmd = new SqlCommand("insert into user_registration(u_id,f_name,l_name,p_no,email,password,DOJ)values (@u_id,@f_name,@l_name,@p_no,@email,@password,@doj)", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@u_id", f_name.Text + userId);
            cmd.Parameters.AddWithValue("@f_name", f_name.Text);
            cmd.Parameters.AddWithValue("@l_name", l_name.Text);
            cmd.Parameters.AddWithValue("@p_no", p_no.Text);
            cmd.Parameters.AddWithValue("@email", email.Text);
            cmd.Parameters.AddWithValue("@password", password.Text);
            cmd.Parameters.AddWithValue("@doj", currentDate);




            con.Open();
            //cmd.ExecuteNonQuery();

            if (f_name.Text == "" || l_name.Text == "" || p_no.Text == "" || email.Text == "" || password.Text == "" || c_password.Text == "")
            {
                Error.Text = "Kindly Fill Up All Data !";
            }
            else{

                int len = p_no.Text.Length;
                if (len < 10 || len > 10) { 
                    Error.Text = "Enter Correct Mobile Number";
                }
                else{
                    if (password.Text == c_password.Text)
                    {
                        int rowsAffected = cmd.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            // Record inserted successfully
                            string username = f_name.Text + userId;
                            Session["Username"] = username;  // Store in session
                            Response.Redirect("SelectComponies.aspx");
                            // Redirect to another page

                        }
                        else
                        {
                            // Insertion failed
                            Error.Text = "Insertion failed.";
                        }
                        con.Close();
                    }

                    else
                    {
                        Error.Text = "Password And Confirm Password Must Be Same !";
                    }
                }
            }
        }

        catch(Exception ex)
        {
            
        }




        //Response.Redirect("dashboard.aspx");
      }

    

    public static string GenerateusertId()
    {
        // Random number generator
        Random rand = new Random();

        // Generate 3 random digits
        string numericPart = rand.Next(001, 1000).ToString(); // 3 digits

        return numericPart;
    }
}