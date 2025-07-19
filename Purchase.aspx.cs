using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Purchase : System.Web.UI.Page
{
    private string bill_no;
    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime currentDate = DateTime.Now;
        string D = currentDate.ToString("dd-MM-yyyy");
        Date.Text = D;

        if (IsPostBack) {
            V_name.Focus();            
        }

        
            SqlConnection con_q = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            string query_string = "SELECT TOP 1 order_no FROM purchase_order_details ORDER BY order_no DESC";
            SqlCommand cmd_d = new SqlCommand(query_string, con_q);
            cmd_d.CommandType = CommandType.Text;
            con_q.Open();
            string last_order_no = cmd_d.ExecuteScalar().ToString();

            int index = last_order_no.LastIndexOf("-P_");
            string result = last_order_no.Substring(index + 3);

            string invoice_no = result;
            int temp_invoice_no = Convert.ToInt32(invoice_no);
            int nxt_invoice_no = temp_invoice_no + 1;


            string i = currentDate.ToString("dd-MM-yyyy HH:mm:ss");
            string invoice = i + "-" + "P_" + nxt_invoice_no.ToString();

            PONO.Text = invoice;

            con_q.Close();
        

        try
        {
            if (!IsPostBack)
            {
                
                Bind_data();
                Bind_payment_data();
                
            }

        }
        catch { }
        
       

    }
    protected void View_Order_List_Click(object sender, EventArgs e)
    {
        Response.Redirect("purchase_order_list.aspx");
    }
    //Invoice Generator
    public static string invoiceNumber()
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        string query = "SELECT TOP 1 order_no FROM purchase_order_details ORDER BY order_no DESC";
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.CommandType = CommandType.Text;
        con.Open();
        string last_order_no = cmd.ExecuteScalar().ToString();
        con.Close();

        int index = last_order_no.LastIndexOf("-P_");
        string result = last_order_no.Substring(index + 3);

        string invoice_no = result;
        int temp_invoice_no = Convert.ToInt32(invoice_no);
        int nxt_invoice_no = temp_invoice_no + 1;
        
        DateTime currentDate = DateTime.Now;
        string invoice_date = currentDate.ToString("dd-MM-yyyy HH:mm:ss");
        string invoice = invoice_date + "-" + "P_" + nxt_invoice_no.ToString();
        return invoice;

    }

    //T_id generator
    public static string t_id()
    {
        // Random number generator
        Random rand = new Random();

        // Generate 3 random digits
        string numericPart = rand.Next(001, 1000).ToString(); // 3 digits

        return numericPart;
    }



    //Button Click
    protected void Place_Order_Click(object sender, EventArgs e)
    {
        string tid = t_id();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        string query = "insert into purchase_order_details (T_id,order_no,date,vendor_name,v_add,v_gst,v_contact,Total_amt,GST_amt,payment_mode) values(@T_id,@order_no,@date,@vendor_name,@v_add,@v_gst,@v_contact,@Total_amt,@GST_amt,@payment_mode)";
        SqlCommand cmd = new SqlCommand(query, con);
        string bill_no = invoiceNumber();
        con.Open();
        
        


        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@T_id", tid);
        cmd.Parameters.AddWithValue("@order_no", bill_no);
        cmd.Parameters.AddWithValue("@date", Date.Text);
        cmd.Parameters.AddWithValue("@vendor_name", V_name.Text);
        cmd.Parameters.AddWithValue("@v_add", V_address.Text);
        cmd.Parameters.AddWithValue("@v_gst", V_GST.Text);
        cmd.Parameters.AddWithValue("@v_contact", V_contact.Text);
        cmd.Parameters.AddWithValue("@Total_amt", Total_bill.Text);
        cmd.Parameters.AddWithValue("@amt_beforeGST", "p");
        cmd.Parameters.AddWithValue("@GST_amt", GST_amount.Text);
        cmd.Parameters.AddWithValue("@payment_mode", pay.SelectedItem.Text);


        string que_ry = "SELECT SUM(CAST(gst_price AS DECIMAL(18,2))) AS TotalSum FROM purchase_product_details WHERE order_id LIKE ('%' + @data + '%')";
        SqlCommand c_md = new SqlCommand(que_ry, con);
        c_md.Parameters.AddWithValue("@data", bill_no);
        try
        {
            // Execute the SELECT query and retrieve the result
            object data = c_md.ExecuteScalar();

            if (data == DBNull.Value)//0
            {
                // Handle case where no result is returned (e.g., TotalSum is null)
                string tot_amt = "0.00"; // or handle accordingly
                GST_amount.Text = tot_amt;

            }
            else //45
            {
                string tot_amt = data.ToString();
                GST_amount.Text = tot_amt;

              

                
                // Now you can use 'tot_amt' as needed, for example, display it or store it.

            }
        }
        catch (Exception ex) { }
        

        

        if (V_name.Text == "" || V_address.Text == "" || V_GST.Text == "" || V_contact.Text == "")
        {
            error.Text = "Fill All Data Correctly";
        }
        else { 
            int rowsAffected = cmd.ExecuteNonQuery();
            if (rowsAffected > 0) {
                msg.Text = "Success";
                V_name.Text = "";
                V_address.Text = "";
                V_GST.Text = "";
                V_contact.Text = "";
                error.Text = "";
                Response.Redirect("purchase.aspx");
                V_name.Focus();
                
                
            }

        }
        
        
        con.Close();
        SqlConnection con_q = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        string query_string = "SELECT TOP 1 order_no FROM purchase_order_details ORDER BY order_no DESC";
        SqlCommand cmd_d = new SqlCommand(query_string, con_q);
        cmd_d.CommandType = CommandType.Text;
        con_q.Open();
        string last_order_no = cmd_d.ExecuteScalar().ToString();
        int index = last_order_no.LastIndexOf("-P_");
        string result = last_order_no.Substring(index + 3);
        int p = Convert.ToInt16(result) + 1;

        DateTime currentDate = DateTime.Now;
        string invoice_date = currentDate.ToString("dd-MM-yyyy HH:mm:ss");
        string invoice = invoice_date + "-" + "P_" + p.ToString();
        PONO.Text = last_order_no;
        //return last_order_no;
        con_q.Close();
        BindDataList(PONO.Text);

    }
    private void Bind_data()
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT DISTINCT  p_name, dimension FROM products", con);
        SqlDataAdapter adpt = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        Product.DataSource = dt;
        Product.DataTextField = "p_name";
        Product.DataValueField = "p_name";
        Product.DataBind();
        size.DataSource = dt;
        size.DataTextField = "dimension";
        size.DataValueField = "dimension";
        size.DataBind();
        
    }
    
    private void Bind_payment_data()
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT payment_mode FROM payment_mode", con);
        SqlDataAdapter adpt = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        pay.DataSource = dt;
        pay.DataTextField = "payment_mode";
        pay.DataValueField = "payment_mode";
        pay.DataBind();
        


    }
    protected void Add_Item_Click(object sender, EventArgs e)
    {
        // Invoice number fetcher
        SqlConnection con_q = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        string query_string = "SELECT TOP 1 order_no FROM purchase_order_details ORDER BY order_no DESC";
        SqlCommand cmd_d = new SqlCommand(query_string, con_q);
        cmd_d.CommandType = CommandType.Text;
        con_q.Open();
        string last_order_no = cmd_d.ExecuteScalar().ToString();
        int index = last_order_no.LastIndexOf("-P_");
        string result = last_order_no.Substring(index + 3);
        int p = Convert.ToInt16(result) + 1;

        DateTime currentDate = DateTime.Now;
        string invoice_date = currentDate.ToString("dd-MM-yyyy HH:mm:ss");
        string invoice = invoice_date + "-" + "P_" + p.ToString();
        con_q.Close();

        // Inserting data into purchase_product_details
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        string query = "INSERT INTO purchase_product_details (order_id, prod_name, HSN, quantity, unit_price, gst_rate, unit_measure_price, unit_measurement,size,total,gst_price) " +
                       "VALUES(@order_id, @prod_name, @HSN, @quantity, @unit_price, @gst_rate, @unit_measure_price, @unit_measurement,@size,@total,@gst_price)";
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.CommandType = CommandType.Text;

        //info fetcher
        string unit_p = unit_price(Product.SelectedItem.Text);
        int price = Convert.ToInt16(unit_p);
        string gst = gst_price(Product.SelectedItem.Text);
        int gst_cal = Convert.ToInt16(gst);
        string unit_m_price = unit_measure_price(Product.SelectedItem.Text);
        int unit_measur_price = Convert.ToInt16(unit_m_price);
        

        cmd.Parameters.AddWithValue("@order_id", PONO.Text);
        cmd.Parameters.AddWithValue("@prod_name", Product.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@HSN", HSN.Text);
        cmd.Parameters.AddWithValue("@quantity", Quantity.Text);
        cmd.Parameters.AddWithValue("@unit_price", unit_p);
        cmd.Parameters.AddWithValue("@gst_rate", gst);
        cmd.Parameters.AddWithValue("@unit_measure_price", (unit_measur_price * price).ToString());
        cmd.Parameters.AddWithValue("@unit_measurement", unit_m_price);
        cmd.Parameters.AddWithValue("@size", size.SelectedItem.Text);
        int gst_amt = (((unit_measur_price * price) * Convert.ToInt16(Quantity.Text)) * gst_cal) / 100;
        int total_with_gst = gst_amt + (unit_measur_price * price) * Convert.ToInt16(Quantity.Text);
        cmd.Parameters.AddWithValue("@total", total_with_gst.ToString());
        cmd.Parameters.AddWithValue("@gst_price", ((((unit_measur_price * price) * Convert.ToInt64(Quantity.Text)) * Convert.ToInt64(gst)) / 100).ToString());

                                                    ;


        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        string i = PONO.Text;
        int inde_x = i.LastIndexOf("-P_");
        string resul_t = last_order_no.Substring(inde_x + 3);
        int pass_para = Convert.ToInt16(resul_t) + 1;
        string x = "P_" + pass_para.ToString();//P_25


        Total_bill.Text = tot_amt(x);
        string amt_gst = only_gst_amt(x);
        double all_unit_measure_price = Convert.ToDouble(sum_unit_price(x));
        


        GST_amount.Text = ((Convert.ToDouble(amt_gst) * all_unit_measure_price) / 100).ToString(); ;
        BindDataList(x);
       
    }
    private void BindDataList(string orderNo)
    {
        SqlDataSource1.SelectParameters["order_id"].DefaultValue = orderNo;
        DataList1.DataBind();
    }
    private string unit_price( string data) {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        string query = "SELECT selling_rate FROM products WHERE p_name = @data";
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.CommandType = CommandType.Text; 
        cmd.Parameters.AddWithValue("@data", data);
        con.Open();
        string u_p = cmd.ExecuteScalar().ToString();
        con.Close();


        return u_p;
    }
    private string gst_price(string data)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        string query = "SELECT gst FROM products WHERE p_name = @data";
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@data", data);
        con.Open();
        string gst = cmd.ExecuteScalar().ToString();
        con.Close();


        return gst;
    }
    private string unit_measure_price(string data)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        string query = "SELECT unit_measure FROM products WHERE p_name = @data";
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@data", data);
        con.Open();
        string u_measure = cmd.ExecuteScalar().ToString();
        con.Close();


        return u_measure;
    }

    private string tot_amt(string bill) {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        string query = "SELECT SUM(CAST(total AS DECIMAL(18,2))) AS TotalSum FROM purchase_product_details WHERE order_id LIKE ('%' + @data + '%')";
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@data", bill);
        con.Open();
        string tot_bill = cmd.ExecuteScalar().ToString();
        con.Close();
        return tot_bill;
    }
    private string only_gst_amt(string bill)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        string query = "SELECT SUM(CAST(gst_rate AS DECIMAL(18,2))) AS TotalSum FROM purchase_product_details WHERE order_id LIKE ('%' + @data + '%')";
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@data", bill);
        con.Open();
        string gst_amt = cmd.ExecuteScalar().ToString();
        con.Close();
        return gst_amt;
    }
    private string sum_unit_price(string bill)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        string query = "SELECT CAST(SUM(CAST(unit_measure_price AS DECIMAL(18,2))) AS INT) AS TotalSum FROM purchase_product_details WHERE order_id LIKE ('%' + @data + '%')";
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@data", bill);
        con.Open();
        string unit_m_price = cmd.ExecuteScalar().ToString();
        con.Close();
        return unit_m_price;
    }





    protected void DataList1_ItemCommand(object sender, DataListCommandEventArgs e)
    {
        if (e.CommandName == "DeleteRecord")
        {
            // Get the CommandArgument, which contains the concatenated string
            string commandArgument = e.CommandArgument.ToString();

            // Split the CommandArgument to extract individual values
            string[] args = commandArgument.Split('|');
            string prodName = args[0];     // Prod_name
            string qty = args[1];          // Quantity
            string orderId = args[2];      // Order ID

            // Call the function to delete the record
            DeleteRecord(prodName, qty,orderId);
        }
    }

    private void DeleteRecord(string orderId, string prodName, string qty)
    {
        // Define the DELETE SQL query
        string query = "DELETE FROM purchase_product_details WHERE order_id = @s_order_no AND prod_name = @prod_name AND quantity = @quantity";

        // Create the SQL connection
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString))
        {
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                // Add the parameters to the SQL command
                cmd.Parameters.AddWithValue("@s_order_no", qty);
                cmd.Parameters.AddWithValue("@prod_name", orderId);
                cmd.Parameters.AddWithValue("@quantity", prodName);

                int inde_x = qty.LastIndexOf("-P_");
                string resul_t = qty.Substring(inde_x + 3);
                //int pass_para = Convert.ToInt16(resul_t) + 1;
                string x = "P_" + resul_t.ToString();//P_25

                // Open the connection and execute the query
                con.Open();
                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected > 0)
                {

                    //---------Total Bill----------
                    string quer_y = "SELECT SUM(CAST(total AS DECIMAL(18,2))) AS TotalSum FROM purchase_product_details WHERE order_id LIKE ('%' + @data + '%')";
                    SqlCommand cm_d = new SqlCommand(quer_y, con);
                    cm_d.Parameters.AddWithValue("@data", x);
                    try
                    {
                        // Execute the SELECT query and retrieve the result
                        object result = cm_d.ExecuteScalar();

                        if (result == DBNull.Value)//0
                        {
                            // Handle case where no result is returned (e.g., TotalSum is null)
                            string tot_amt = "0.00"; // or handle accordingly
                            Total_bill.Text = tot_amt;

                        }
                        else //45
                        {
                            string tot_amt = result.ToString();
                            Total_bill.Text = tot_amt;
                            // Now you can use 'tot_amt' as needed, for example, display it or store it.

                        }

                        //---------GST----------

                        string que_ry = "SELECT SUM(CAST(gst_price AS DECIMAL(18,2))) AS TotalSum FROM purchase_product_details WHERE order_id LIKE ('%' + @data + '%')";
                        SqlCommand c_md = new SqlCommand(que_ry, con);
                        c_md.Parameters.AddWithValue("@data", x);
                        try
                        {
                            // Execute the SELECT query and retrieve the result
                            object data = c_md.ExecuteScalar();

                            if (data == DBNull.Value)//0
                            {
                                // Handle case where no result is returned (e.g., TotalSum is null)
                                string tot_amt = "0.00"; // or handle accordingly
                                GST_amount.Text = tot_amt;

                            }
                            else //45
                            {
                                string tot_amt = data.ToString();
                                GST_amount.Text = tot_amt;

                                
                                // Now you can use 'tot_amt' as needed, for example, display it or store it.

                            }
                        }
                        catch (Exception ex) { }

                    }
                    catch (Exception ex) { }


                    con.Close();





                    DataList1.DataBind();
                }
            }
        }
    }
}