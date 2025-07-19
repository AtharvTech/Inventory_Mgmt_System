using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Product : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        P_name.Focus();
        try
        {
            if (!IsPostBack) {
                Bind_data_cat();
                Bind_data_SKU();
            }
            
        }
        catch {}
    }
    protected void view_product_list_Click(object sender, EventArgs e)
    {
        Response.Redirect("product_list.aspx");
    }
    protected void Add_product_Click(object sender, EventArgs e)
    {
        try
        {
            string prodId = GenerateProductId();
            DateTime currentDate = DateTime.Today;
            string D = currentDate.ToString("dd-MM-yyyy");
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            con.Open();





            // Check if the product exists with the given conditions
            string chek_query = "SELECT COUNT(*) FROM products WHERE p_name = @p_name AND unit_measure = @unit_measure AND thickness = @thickness";
            SqlCommand cm_d = new SqlCommand(chek_query, con);
            cm_d.Parameters.AddWithValue("@p_name", P_name.Text.Trim());
            int Dime_n = Convert.ToInt32(Length.Text) * Convert.ToInt32(Width.Text);
            cm_d.Parameters.AddWithValue("@unit_measure", Dime_n.ToString());
            cm_d.Parameters.AddWithValue("@thickness", thickness.Text + "'"); // No single quote added

            int rowsAffected = Convert.ToInt16(cm_d.ExecuteScalar()); // Returns count of rows matching the condition

            // If the product is found, update the quantity
            if (rowsAffected > 0)
            {
                // Get the current quantity for the product
                string sentence = "SELECT quantity FROM products WHERE p_name = @p_name AND unit_measure = @unit_measure AND thickness = @thickness";
                SqlCommand comman_d = new SqlCommand(sentence, con);
                comman_d.Parameters.AddWithValue("@p_name", P_name.Text.Trim());
                int D_imen = Convert.ToInt32(Length.Text) * Convert.ToInt32(Width.Text);
                comman_d.Parameters.AddWithValue("@unit_measure", D_imen.ToString());
                comman_d.Parameters.AddWithValue("@thickness", thickness.Text + "'"); // No single quote added
                int qty = Convert.ToInt16(comman_d.ExecuteScalar()); // Get current quantity
                int up_qty = qty + Convert.ToInt16(Quantity.Text); // Calculate updated quantity

                // Prepare the update query
                SqlConnection co_n = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
                string s = "UPDATE products SET quantity = @quantity , date_modified = @date_mod, valuation = valuation* @qty, cost = cost * @qty WHERE p_name = @p_name AND unit_measure = @unit_measure AND thickness = @thickness";
                co_n.Open();

                SqlCommand command_query = new SqlCommand(s, co_n);
                command_query.CommandType = CommandType.Text;
                command_query.Parameters.AddWithValue("@p_name", P_name.Text);
                int Dimension = Convert.ToInt32(Length.Text) * Convert.ToInt32(Width.Text);
                command_query.Parameters.AddWithValue("@unit_measure", Dimension.ToString()); // Dimension value
                command_query.Parameters.AddWithValue("@thickness", thickness.Text + "'"); // No single quote added
                command_query.Parameters.AddWithValue("@quantity", up_qty.ToString()); // Updated quantity
                command_query.Parameters.AddWithValue("@date_mod", D); // No single quote added
                command_query.Parameters.AddWithValue("@qty", up_qty); // No single quote added



                // Execute the update command
                int row = command_query.ExecuteNonQuery();

                if (row > 0)
                {
                    error.Text = "Success"; // Successfully updated
                    co_n.Close();
                    //Response.Redirect("Product.aspx");
                }
                else
                {
                    error.Text = "Update failed. Check if the product data is correct or if there's a mismatch in dimensions.";
                    co_n.Close();
                }
            }
            else //record available
            {

                try{
                    string query = "insert into products(p_id,p_name,category,SKU,unit_measure,brand,dimension,thickness,gst,quantity,purchase_rate,selling_rate,date_added,valuation,cost) values(@p_id,@p_name,@category,@SKU,@unit_measure,@brand,@dimension,@thickness,@gst,@quantity,@purchase_rate,@selling_rate,@date_added,@valuation,@cost)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@p_id", prodId);
                    cmd.Parameters.AddWithValue("@p_name", P_name.Text);
                    cmd.Parameters.AddWithValue("@category", Category.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@SKU", ddlSKU.SelectedItem.Text);
                    int Dimen = Convert.ToInt32(Length.Text) * Convert.ToInt32(Width.Text);
                    cmd.Parameters.AddWithValue("@unit_measure", Dimen);
                    cmd.Parameters.AddWithValue("@brand", brand.Text);
                    cmd.Parameters.AddWithValue("@dimension", Length.Text + "*" + Width.Text);
                    cmd.Parameters.AddWithValue("@thickness", thickness.Text + "'");
                    cmd.Parameters.AddWithValue("@gst", GST.Text);
                    cmd.Parameters.AddWithValue("@quantity", Quantity.Text);
                    cmd.Parameters.AddWithValue("@purchase_rate", purchase_p.Text);
                    cmd.Parameters.AddWithValue("@selling_rate", SP.Text);
                    cmd.Parameters.AddWithValue("@date_added", D);
                    int value = int.Parse(SP.Text) * int.Parse(Quantity.Text);
                    cmd.Parameters.AddWithValue("@valuation", value);
                    int cos_t = int.Parse(purchase_p.Text) * int.Parse(Quantity.Text);
                    cmd.Parameters.AddWithValue("@cost", cos_t);
                    //cmd.Parameters.AddWithValue("@date_modified", currentDate);
                    
                    //cmd.ExecuteNonQuery();
                    if (P_name.Text == "" || Length.Text == "" || brand.Text == "" || thickness.Text == "" || GST.Text == "" || Quantity.Text == "" || purchase_p.Text == "" || SP.Text == "" || Width.Text == "")
                    {
                        if (IsPostBack)
                        {
                            error.Text = "Fill all the data ";
                            
                        }
                    }
                    else
                    {
                        int rowsaffected = cmd.ExecuteNonQuery();
                        if (rowsaffected > 0)
                        {
                            error.Text = "Success";
                            P_name.Text = "";
                            P_name.Text = "";
                            brand.Text = "";
                            thickness.Text = "";
                            GST.Text = "";
                            Quantity.Text = "";
                            purchase_p.Text = "";
                            SP.Text = "";
                        }
                    }
                    con.Close();
                }
                catch (Exception ex)
                { }
            }


        }
        catch (Exception ex) { }
    }
    private void Bind_data_cat() {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT cat_id,cat_name FROM categories", con);
        SqlDataAdapter adpt = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        Category.DataSource = dt;
        Category.DataTextField = "cat_name";
        Category.DataValueField = "cat_name";
        Category.DataBind();
    
    }
    private void Bind_data_SKU()
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT SKU_id,SKU_name FROM SKUs", con);
        SqlDataAdapter adpt = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        ddlSKU.DataSource = dt;
        ddlSKU.DataTextField = "SKU_name";
        ddlSKU.DataValueField = "SKU_name";
        ddlSKU.DataBind();

    }
    public static string GenerateProductId()
    {
        // Random number generator
        Random rand = new Random();

        // Generate 3 random digits
        string numericPart = rand.Next(001, 1000).ToString(); // 3 digits

        // Generate 3 random alphabetic characters (uppercase letters)
        string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        string charPart = "";
        for (int i = 0; i < 3; i++)
        {
            charPart += chars[rand.Next(chars.Length)]; // Random letter from A to Z
        }

        // Combine both parts
        return numericPart + charPart;
    }
}

//<asp:TextBox ID="txtProductName" runat="server" AutoPostBack="true" OnTextChanged="txtProductName_TextChanged" />
//<ul id="suggestions" runat="server" style="list-style-type:none; padding:0; margin:0;"></ul>

//protected void txtProductName_TextChanged(object sender, EventArgs e)
//{
//    string userInput = txtProductName.Text.Trim();
//    if (!string.IsNullOrEmpty(userInput))
//    {
//        // Replace with your actual database query
//        string query = "SELECT ProductName FROM Products WHERE ProductName LIKE @ProductName";
//        using (SqlConnection conn = new SqlConnection(connectionString))
//        {
//            SqlCommand cmd = new SqlCommand(query, conn);
//            cmd.Parameters.AddWithValue("@ProductName", userInput + "%");
//            conn.Open();
//            SqlDataReader reader = cmd.ExecuteReader();
//            List<string> productNames = new List<string>();
//            while (reader.Read())
//            {
//                productNames.Add(reader.GetString(0));
//            }
//            reader.Close();
//            // Bind the product names to the suggestions list
//            suggestions.DataSource = productNames;
//            suggestions.DataBind();
//        }
//    }
//    else
//    {
//        suggestions.DataSource = null;
//        suggestions.DataBind();
//    }
//}
