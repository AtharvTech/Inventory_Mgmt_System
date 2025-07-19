using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class view_prod : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Get the p_id from the query string
            string p_id = Request.QueryString["p_id"];

            if (!string.IsNullOrEmpty(p_id))
            {
                // Define the query to fetch the product details based on p_id
                string query = "SELECT * FROM products WHERE p_id = @p_id";

                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@p_id", p_id);

                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        reader.Read(); // Read the data from the result set
                        // Bind the data to the labels
                        lblp_id.Text = reader["p_id"].ToString();
                        lblProductName.Text = reader["p_name"].ToString();
                        lblCategory.Text = reader["category"].ToString();
                        lblSKU.Text = reader["SKU"].ToString();
                        dimension.Text = reader["dimension"].ToString();
                        thickness.Text = reader["thickness"].ToString();
                        qty.Text = reader["quantity"].ToString();
                        lblUnitMeasure.Text = reader["unit_measure"].ToString();
                        lblGst.Text = reader["gst"].ToString();
                        date_add.Text = reader["date_added"].ToString();
                        datemodified.Text = reader["date_modified"].ToString();
                        min.Text = reader["min_stock"].ToString();
                        max.Text = reader["max_stock"].ToString();
                        long P_price = Convert.ToInt64(reader["purchase_rate"]) * Convert.ToInt64(reader["unit_measure"]);
                        long S_price_gst = ((Convert.ToInt64(reader["selling_rate"]) * Convert.ToInt64(reader["unit_measure"])) * Convert.ToInt64(reader["gst"])) / 100;
                        long S_price = (Convert.ToInt64(reader["selling_rate"]) * Convert.ToInt64(reader["unit_measure"])) + S_price_gst;

                        UPP.Text = P_price.ToString();
                        USP.Text = S_price.ToString();

                        lblPurchaseRate.Text = reader["purchase_rate"].ToString();
                        lblSellingRate.Text = reader["selling_rate"].ToString();
                        long valuation = S_price * Convert.ToInt64(reader["quantity"]);
                        value.Text = valuation.ToString();
                        long cos_t = P_price * Convert.ToInt64(reader["quantity"]);
                        cost.Text = cos_t.ToString();
                        reader.Close();

                        string que_ry = "SELECT SUM(CAST(total AS DECIMAL(18,2))) AS TotalSum FROM sales_product_details WHERE prod_name LIKE ('%' + @data + '%')";
                        SqlCommand order = new SqlCommand(que_ry, con);
                        order.Parameters.AddWithValue("@data", lblProductName.Text);
                        try
                        {
                            // Execute the SELECT query and retrieve the result
                            object data = order.ExecuteScalar();

                            if (data == DBNull.Value)//0
                            {
                                // Handle case where no result is returned (e.g., TotalSum is null)

                                sold_goods_value.Text = "No Sale Yet";

                            }
                            else //45
                            {
                                string tot_amt = data.ToString();
                                sold_goods_value.Text = tot_amt;
                                // Now you can use 'tot_amt' as needed, for example, display it or store it.

                                string query_find = "SELECT SUM(CAST(quantity AS DECIMAL(18,2))) AS TotalSum FROM sales_product_details WHERE prod_name LIKE ('%' + @data + '%')";
                                SqlCommand order_find = new SqlCommand(query_find, con);
                                order_find.Parameters.AddWithValue("@data", lblProductName.Text);
                                try
                                {
                                    // Execute the SELECT query and retrieve the result
                                    object qty_sold = order_find.ExecuteScalar();

                                    if (qty_sold == DBNull.Value)//0
                                    {
                                        // Handle case where no result is returned (e.g., TotalSum is null)

                                        profit.Text = "00";

                                    }
                                    else //45
                                    {
                                        long tot_qty_sold = Convert.ToInt64(qty_sold);
                                        long p = tot_qty_sold * P_price;
                                        int net_profit = Convert.ToInt32(data) - Convert.ToInt32(p);
                                        profit.Text = net_profit.ToString();
                                        // Now you can use 'tot_amt' as needed, for example, display it or store it.

                                    }
                                }
                                catch (Exception ex) { }

                            }
                        }
                        catch (Exception ex) { }

                        //profit calculator
                        



                    }
                    else
                    {
                        // Handle case when no product is found
                        lblProductName.Text = "Product not found";
                    }

                    con.Close();
                }
            }
            else
            {
                // Handle case when p_id is missing from the query string
                lblProductName.Text = "Invalid Product ID";
            }
        }
        
        }

    protected void Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("product_list.aspx");
    }
}

