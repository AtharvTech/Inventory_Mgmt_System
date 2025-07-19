<%@ Page Title="" Language="C#" MasterPageFile="~/Dashbo.master" AutoEventWireup="true" CodeFile="Customer.aspx.cs" Inherits="Customer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style= "height:;" class="C container-fluid d-flex flex-column justify-content-center align-items-center">
        <div class="container-fluid col-10 d-flex justify-content-between align-items-center flex-row my-2">
                        
                         <asp:TextBox ID="search_customer" CssClass="form-control me-3" placeholder="Search Invoice (dd-MM-yyyy HH:mm:ss-S_ )" runat="server"></asp:TextBox>
                        
                        <asp:Button class="btn btn-outline-success btn-sm me-3" ID="search_invoice" 
                             runat="server" Text="Search" onclick="search_invoice_Click"></asp:Button>
                        
                    </div>
                   
                    <div class="container-fluid table-responsive d-flex justify-content-center align-items-center">
                        
                        
                       
                       
                       <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
                           <HeaderTemplate>
                               <table class="table table-bordered text-center">
                                   <thead>
                                       <tr>
                                           <th>Order No.</th>
                                           <th>Order Date</th>
                                           <th>Customer Name</th>
                                           <th>Total Amount (Rs.)</th>
                                       </tr>
                                   </thead>
                                   <tbody>
                           </HeaderTemplate>
                           <ItemTemplate>
                               <tr>
                                   <td><asp:Label ID="s_order_noLabel" runat="server" Text='<%# Eval("s_order_no") %>' /></td>
                                   <td><asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' /></td>
                                   <td><asp:Label ID="customer_nameLabel" runat="server" Text='<%# Eval("customer_name") %>' /></td>
                                   <td><asp:Label ID="total_amtLabel" runat="server" Text='<%# Eval("total_amt") %>' /></td>
                                   <td><asp:Button CssClass="btn btn-sm btn-primary" 
                                                  CommandArgument='<%# Eval("s_order_no") %>'
                                                  OnClick="btnViewBill_Click" 
                                                  ID="view_bill" runat="server" Text="View" />
                                   </td>
                               </tr>
                           </ItemTemplate>
                           <FooterTemplate>
                                   </tbody>
                               </table>
                           </FooterTemplate>
                       </asp:DataList>

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:conn %>" 
                            SelectCommand="SELECT [s_order_no], [date], [customer_name], [total_amt] FROM [sales_order_details]">
                        </asp:SqlDataSource>

                        
                  
                        
                       
                    </div>
    </div>
</asp:Content>

