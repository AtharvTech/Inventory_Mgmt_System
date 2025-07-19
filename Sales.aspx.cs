using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Sales : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime currentDate = DateTime.Now;
        string D = currentDate.ToString("dd-MM-yyyy");
        SDate.Text = D;
        cust_name.Focus();

        //Read Only
        SqlConnection con_q = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        string query_string = "SELECT TOP 1 s_order_no FROM sales_order_details ORDER BY s_order_no DESC";
        SqlCommand cmd_d = new SqlCommand(query_string, con_q);
        cmd_d.CommandType = CommandType.Text;
        con_q.Open();
        string last_order_no = cmd_d.ExecuteScalar().ToString();

        int index = last_order_no.LastIndexOf("-S_");
        string result = last_order_no.Substring(index + 3);

        string invoice_no = result;
        int temp_invoice_no = Convert.ToInt32(invoice_no);
        int nxt_invoice_no = temp_invoice_no + 1;


        string i = currentDate.ToString("dd-MM-yyyy HH:mm:ss");
        string invoice = i + "-" + "S_" + nxt_invoice_no.ToString();

        INO.Text = invoice;

        con_q.Close();

        try
        {
            if (!IsPostBack)
            {

                Bind_data_pName();
                Bind_payment_data();

            }

        }
        catch { }
        
    }
    
    protected void Generate_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        string query = "insert into sales_order_details (T_id,s_order_no,date,customer_name,customer_contact,total_amt,gst_amt,payment_mode) values(@T_id,@order_no,@date,@cust_name,@c_contact,@total_amt,@gst_amt,@payment_mode)";
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.CommandType = CommandType.Text;
        string bill_no = invoiceNumber();
        string tid = t_id();

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
                GST_Amount.Text = tot_amt;

            }
            else //45
            {
                string tot_amt = data.ToString();
                GST_Amount.Text = tot_amt;




                // Now you can use 'tot_amt' as needed, for example, display it or store it.

            }
        }
        catch (Exception ex) { }

        cmd.Parameters.AddWithValue("@T_id", tid);
        cmd.Parameters.AddWithValue("@order_no", bill_no);
        cmd.Parameters.AddWithValue("@date", SDate.Text);
        cmd.Parameters.AddWithValue("@cust_name", cust_name.Text);
        cmd.Parameters.AddWithValue("@c_contact", c_contact.Text);
        cmd.Parameters.AddWithValue("@total_amt", Total_bill.Text);
        cmd.Parameters.AddWithValue("@gst_amt", GST_Amount.Text);
        cmd.Parameters.AddWithValue("@payment_mode", pay.SelectedItem.Text);


        if (SDate.Text == "" || cust_name.Text == "" || c_contact.Text == "")
        {
            error.Text = "Failed";
        }
        else {
            con.Open();
            
            int rowsAffected = cmd.ExecuteNonQuery();
            if (rowsAffected > 0)
            {
                msg.Text = "Success";
                error.Text = "";
                cust_name.Text = "";
                c_contact.Text = "";
                
                cust_name.Focus();

                int inde_x = bill_no.LastIndexOf("-S_");
                string resul_t = bill_no.Substring(inde_x + 3);
                string new_bill = "S_" + resul_t;
                

                string query_check = "SELECT prod_name, quantity FROM sales_product_details WHERE s_order_no LIKE '%' + @order_id + '%' ";
        
                // Create a list to store the products and quantities
                List<Tuple<string, int>> products = new List<Tuple<string, int>>();

                using (SqlCommand command = new SqlCommand(query_check, con))
                {
                    command.Parameters.AddWithValue("@order_id", new_bill);

                    // Execute the query and get the results
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            string productName = reader["prod_name"].ToString();
                            int quantitySold = Convert.ToInt32(reader["quantity"]);

                            // Add product and quantity to the list
                            products.Add(new Tuple<string, int>(productName, quantitySold));
                        }
                    }
                }

                // Now that we've finished reading, we can execute the update for each product
                foreach (var product in products)
                {
                    string productName = product.Item1;
                    int quantitySold = product.Item2;

                    // Create the SQL command to update the product quantity
                    string updateQuery = "UPDATE products SET quantity = quantity - @quantity_sold WHERE p_name = @product_name AND quantity >= @quantity_sold";
                    using (SqlCommand updateCmd = new SqlCommand(updateQuery, con))
                    {
                        updateCmd.Parameters.AddWithValue("@quantity_sold", quantitySold);
                        updateCmd.Parameters.AddWithValue("@product_name", productName);

                        // Execute the update command
                        int rows_Affected = updateCmd.ExecuteNonQuery();

                        if (rows_Affected == 0)
                        {
                            // Handle the case where no rows were affected (e.g., insufficient stock)
                            Console.WriteLine("Error: Not enough stock for {productName} or product does not exist.");
                        }
                    }
                }
                Response.Redirect("Sales.aspx");

            }
            con.Close();
            SqlConnection con_q = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            string query_string = "SELECT TOP 1 s_order_no FROM sales_order_details ORDER BY s_order_no DESC";
            SqlCommand cmd_d = new SqlCommand(query_string, con_q);
            cmd_d.CommandType = CommandType.Text;
            con_q.Open();
            string last_order_no = cmd_d.ExecuteScalar().ToString();
            int index = last_order_no.LastIndexOf("-S_");
            string result = last_order_no.Substring(index + 3);
            int p = Convert.ToInt16(result) + 1;

            DateTime currentDate = DateTime.Now;
            string invoice_date = currentDate.ToString("dd-MM-yyyy HH:mm:ss");
            string invoice = invoice_date + "-" + "S_" + p.ToString();
            INO.Text = last_order_no;
            //return last_order_no;
            con_q.Close();
            BindDataList(INO.Text);
        
        }
        

    }
    protected void View_Sales_List_Click(object sender, EventArgs e)
    {
        Response.Redirect("Sales_list.aspx");
    }
    //Invoice Generator
    public static string invoiceNumber()
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        string query = "SELECT TOP 1 s_order_no FROM sales_order_details ORDER BY s_order_no DESC";
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.CommandType = CommandType.Text;
        con.Open();
        string last_order_no = cmd.ExecuteScalar().ToString();
        con.Close();

        int index = last_order_no.LastIndexOf("-S_");
        string result = last_order_no.Substring(index + 3);

        string invoice_no = result;
        int temp_invoice_no = Convert.ToInt32(invoice_no);
        int nxt_invoice_no = temp_invoice_no + 1;

        DateTime currentDate = DateTime.Now;
        string invoice_date = currentDate.ToString("dd-MM-yyyy HH:mm:ss");
        string invoice = invoice_date + "-" + "S_" + nxt_invoice_no.ToString();
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
    

    protected void Add_Item_Click(object sender, EventArgs e)
    {
        // Invoice number fetcher
        SqlConnection con_q = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        string query_string = "SELECT TOP 1 s_order_no FROM sales_order_details ORDER BY s_order_no DESC";
        SqlCommand cmd_d = new SqlCommand(query_string, con_q);
        cmd_d.CommandType = CommandType.Text;
        con_q.Open();
        string last_order_no = cmd_d.ExecuteScalar().ToString();
        int index = last_order_no.LastIndexOf("-S_");
        string result = last_order_no.Substring(index + 3);
        int p = Convert.ToInt16(result) + 1;

        DateTime currentDate = DateTime.Now;
        string invoice_date = currentDate.ToString("dd-MM-yyyy HH:mm:ss");
        string invoice = invoice_date + "-" + "S_" + p.ToString();
        con_q.Close();

        // Inserting data into purchase_product_details
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        string query = "INSERT INTO sales_product_details (s_order_no, prod_name, HSN, quantity, unit_price, gst_rate, unit_measure_price, unit_measurement,size,total,gst_price) " +
                       "VALUES(@s_order_no, @prod_name, @HSN, @quantity, @unit_price, @gst_rate, @unit_measure_price, @unit_measurement,@size,@total,@gst_price)";
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.CommandType = CommandType.Text;
        con.Open();
        //info fetcher
        string unit_p = unit_price(Product.SelectedItem.Text);
        int price = Convert.ToInt16(unit_p);
        string gst = gst_price(Product.SelectedItem.Text);
        int gst_cal = Convert.ToInt16(gst);
        string unit_m_price = unit_measure_price(Product.SelectedItem.Text);
        int unit_measur_price = Convert.ToInt16(unit_m_price);

        if (Quantity.Text == "")
        {
            error.Text = "Fill the data Correctly";
            Quantity.Focus();
        }
        else {
                string check_query = "SELECT quantity FROM products WHERE p_name = @prod_name";
                SqlCommand cm_d = new SqlCommand(check_query, con);
                cm_d.Parameters.AddWithValue("@prod_name", Product.SelectedItem.Text);
                int qt_y = Convert.ToInt16(cm_d.ExecuteScalar());
                if (qt_y < Convert.ToInt16(Quantity.Text)) {
                    
                    Response.Redirect("Sales.aspx");
                    error.Text = "Low Stock !";
                }
                else{
                    cmd.Parameters.AddWithValue("@s_order_no", INO.Text);
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
                    int qty = Convert.ToInt16(Quantity.Text);
                    int g_st = Convert.ToInt16(gst);
                    int g_price = ((unit_measur_price * price) * qty) * g_st;
                    int f_gst = g_price/100;
                    cmd.Parameters.AddWithValue("@gst_price", f_gst.ToString());


                    
                    cmd.ExecuteNonQuery();
                    


                    con.Close();
                }

                string i = INO.Text;
                int inde_x = i.LastIndexOf("-S_");
                string resul_t = last_order_no.Substring(inde_x + 3);
                int pass_para = Convert.ToInt16(resul_t) + 1;
                string x = "S_" + pass_para.ToString();//S_25


                Total_bill.Text = tot_amt(x);
                string amt_gst = only_gst_amt(x);
                double all_unit_measure_price = Convert.ToDouble(sum_unit_price(x));



                string que_ry = "SELECT SUM(CAST(gst_price AS DECIMAL(18,2))) AS TotalSum FROM sales_product_details WHERE s_order_no LIKE ('%' + @data + '%')";
                SqlCommand c_md = new SqlCommand(que_ry, con);
                con.Open();
                c_md.Parameters.AddWithValue("@data", x);
                try
                {
                    // Execute the SELECT query and retrieve the result
                    object data = c_md.ExecuteScalar();

                    if (data == DBNull.Value)//0
                    {
                        // Handle case where no result is returned (e.g., TotalSum is null)
                        string tot_amtount = "0.00"; // or handle accordingly
                        GST_Amount.Text = tot_amtount;

                    }
                    else //45
                    {
                        string tot_amtount = data.ToString();
                        GST_Amount.Text = tot_amtount;
                        con.Close();
                        // Now you can use 'tot_amt' as needed, for example, display it or store it.

                    }
                }
                catch (Exception ex) { }
                BindDataList(x);
            }

        
    }
    private void Bind_data_pName()
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
    private void BindDataList(string orderNo)
    {
        SqlDataSource1.SelectParameters["order_id"].DefaultValue = orderNo;
        DataList1.DataBind();
    }
    private string unit_price(string data)
    {
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

    private string tot_amt(string bill)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        string query = "SELECT SUM(CAST(total AS DECIMAL(18,2))) AS TotalSum FROM sales_product_details WHERE s_order_no LIKE ('%' + @data + '%')";
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
        string query = "SELECT SUM(CAST(gst_rate AS DECIMAL(18,2))) AS TotalSum FROM sales_product_details WHERE s_order_no LIKE ('%' + @data + '%')";
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
        string query = "SELECT CAST(SUM(CAST(unit_measure_price AS DECIMAL(18,2))) AS INT) AS TotalSum FROM sales_product_details WHERE s_order_no LIKE ('%' + @data + '%')";
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
        string query = "DELETE FROM sales_product_details WHERE s_order_no = @s_order_no AND prod_name = @prod_name AND quantity = @quantity";

        // Create the SQL connection
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString))
        {
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                // Add the parameters to the SQL command
                cmd.Parameters.AddWithValue("@s_order_no", qty);
                cmd.Parameters.AddWithValue("@prod_name", orderId);
                cmd.Parameters.AddWithValue("@quantity", prodName);

                int inde_x = qty.LastIndexOf("-S_");
                string resul_t = qty.Substring(inde_x + 3);
                //int pass_para = Convert.ToInt16(resul_t) + 1;
                string x = "S_" + resul_t.ToString();//P_25

                // Open the connection and execute the query
                con.Open();
                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected > 0)
                {

                    //---------Total Bill----------
                    string quer_y = "SELECT SUM(CAST(total AS DECIMAL(18,2))) AS TotalSum FROM sales_product_details WHERE s_order_no LIKE ('%' + @data + '%')";
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

                        string que_ry = "SELECT SUM(CAST(gst_price AS DECIMAL(18,2))) AS TotalSum FROM sales_product_details WHERE s_order_no LIKE ('%' + @data + '%')";
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
                                GST_Amount.Text = tot_amt;

                            }
                            else //45
                            {
                                string tot_amt = data.ToString();
                                GST_Amount.Text = tot_amt;
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