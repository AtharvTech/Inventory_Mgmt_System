<%@ Page Title="" Language="C#" MasterPageFile="~/Dashbo.master" AutoEventWireup="true" CodeFile="Analytics.aspx.cs" Inherits="Analytics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style= "height:;" class="C container-fluid d-flex flex-column justify-content-center align-items-center">
        <div class="container-fluid my-3">
        <asp:Button class="btn btn-sm btn-primary me-3" ID="Payment_mode" runat="server" 
                                Text="Payment mode" onclick="Payment_mode_Click" />
        </div>
        <div class="container-fluid">
            <div class="row mb-3">
                <div class="col">
                    <asp:Label ID="Label1" runat="server" Text="Total Products : "></asp:Label> <asp:Label ID="Total_p" runat="server" Text=""></asp:Label>
                    
                </div>
                <div class="col">
                    
                    <asp:Label ID="Label6" runat="server" Text="Inventry Value : "></asp:Label> <asp:Label ID="inv_value" runat="server" Text=""></asp:Label> Rs.
                </div>
                <div class="col">
                     <asp:Label ID="Label2" runat="server" Text="Total Stock Quantity : "></asp:Label> <asp:Label ID="Total_Stock_Quantity" runat="server" Text="25"></asp:Label>
                </div>
                <div class="col">
                     
                    <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2">
                        <HeaderTemplate>
                            <table class="table table-bordered">
                                <thead>
                                    <th>Low Stock</th>
                                </thead>
                                <tbody>
                                
                        </HeaderTemplate>
                        <ItemTemplate>
                            
                            <tr>
                                <td><asp:Label ID="p_nameLabel" runat="server" Text='<%# Eval("p_name") %>' /></td>
                            </tr>
                            
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody>
                            </table>
                        </FooterTemplate>
                    </asp:DataList>
                     <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                         ConnectionString="<%$ ConnectionStrings:conn %>" 
                         
                        SelectCommand="SELECT p_name FROM products WHERE (CAST(quantity AS INT) &lt; CAST(min_stock AS INT))">
                     </asp:SqlDataSource>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    
                    <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource3">
                        <HeaderTemplate>
                            <table class="table table-bordered">
                                <thead>
                                    <th>Cost of Goods Sold (COGS)</th>
                                </thead>
                                <tbody>
                                
                        </HeaderTemplate>
                        <ItemTemplate>

                            <tr>
                                <td><asp:Label ID="prod_nameLabel" runat="server" Text='<%# Eval("prod_name") %>' /></td>
                                <td><asp:Label ID="total_sumLabel" runat="server" Text='<%# Eval("total_sum") %>' /></td>
                            </tr>
                           
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody>
                            </table>
                        </FooterTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:conn %>" 
                        SelectCommand="SELECT prod_name, SUM(CAST(total AS DECIMAL)) AS total_sum FROM sales_product_details GROUP BY prod_name">
                    </asp:SqlDataSource>
                </div>
                <div class="col d-flex justify-content-center align-items-center flex-column">
                    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Category</th>
                                        <th>Valuation</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                        </HeaderTemplate>
                        <ItemTemplate>

                            <tr>
                                <td><asp:Label ID="categoryLabel" runat="server" Text='<%# Eval("category") %>' /></td>
                                <td><asp:Label ID="total_valueLabel" runat="server" Text='<%# Eval("total_value") %>' /></td>
                            </tr>
                         </ItemTemplate>
                         <FooterTemplate>
                            </tbody>
                            </table>
                         </FooterTemplate>
                    </asp:DataList>
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                         ConnectionString="<%$ ConnectionStrings:conn %>" 
                         SelectCommand="SELECT category, SUM(CAST(valuation AS DECIMAL(10 , 2))) AS total_value FROM products GROUP BY category ORDER BY total_value DESC">
                     </asp:SqlDataSource>
                </div>
                <div class="col">
                     
                     <asp:DataList ID="DataList4" runat="server" DataSourceID="SqlDataSource4">
                         <HeaderTemplate>
                            <table class="table table-bordered">
                                <thead>
                                    <th>Total Purchase</th>
                                </thead>
                                <tbody>
                                
                        </HeaderTemplate>
                         <ItemTemplate>

                         <tr>
                            <td><asp:Label ID="prod_nameLabel" runat="server" Text='<%# Eval("prod_name") %>' /></td>
                            <td><asp:Label ID="total_sumLabel" runat="server" Text='<%# Eval("total_sum") %>' /></td>
                         </tr>

                         </ItemTemplate>
                         <FooterTemplate>
                            </tbody>
                            </table>
                        </FooterTemplate>
                     </asp:DataList>
                     <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                         ConnectionString="<%$ ConnectionStrings:conn %>" 
                         SelectCommand="SELECT prod_name, SUM(CAST(total AS DECIMAL)) AS total_sum FROM purchase_product_details GROUP BY prod_name">
                     </asp:SqlDataSource>
                    
                </div>
            </div>
        </div>
    </div>
</asp:Content>

