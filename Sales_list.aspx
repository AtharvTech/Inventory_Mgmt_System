<%@ Page Title="" Language="C#" MasterPageFile="~/in_master.master" AutoEventWireup="true" CodeFile="Sales_list.aspx.cs" Inherits="Sales_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style= "height:;" class="C container-fluid d-flex flex-column justify-content-center align-items-center">
    <div id="Div1" class="scrollable-div h-100 w-100 border" runat="server">
  
        <div class="container-fluid col-10 d-flex justify-content-between align-items-center flex-row my-2">
                <asp:TextBox ID="search_sales_bill" class="form-control me-3" placeholder="Search Invoice No" runat="server"></asp:TextBox>
                
                <asp:Button class="btn btn-outline-success btn-sm me-3" ID="Search" 
                    runat="server" Text="Search" onclick="Search_Click"></asp:Button>
                <asp:Button class="btn btn-secondary btn-sm" ID="back" runat="server" 
                    Text="Back" onclick="back_Click" ></asp:Button>
        </div>
    
        <div class="container-fluid table-responsive d-flex justify-content-center align-items-center my-2">
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
                <HeaderTemplate>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>T_id</th>
                                <th>Order No</th>
                                <th>Date</th>
                                <th>Customer Name</th>
                                <th>Total Amt</th>
                                <th>Payment Mode</th>
                                <th>Actions</th>
        
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
        
                <ItemTemplate>
                    <tr>
                        <td><asp:Label ID="T_idLabel" runat="server" Text='<%# Eval("T_id") %>' /></td>
                        <td><asp:Label ID="s_order_noLabel" runat="server" Text='<%# Eval("s_order_no") %>' /></td>
                        <td><asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' /></td>
                        <td><asp:Label ID="customer_nameLabel" runat="server" Text='<%# Eval("customer_name") %>' /></td>
                        <td><asp:Label ID="total_amtLabel" runat="server" Text='<%# Eval("total_amt") %>' /></td>
                        <td><asp:Label ID="payment_modeLabel" runat="server" Text='<%# Eval("payment_mode") %>' /></td>
                        <td><asp:Button ID="view_S_bill" class="btn btn-sm btn-primary" runat="server" Text="View" 
                                onclick="view_S_bill_Click" CommandArgument='<%# Eval("s_order_no") %>' /></td>
                    </tr>
                    
                </ItemTemplate>
        
                <FooterTemplate>
                        </tbody>
                    </table>
                </FooterTemplate>
            </asp:DataList>
        
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:conn %>" 
                SelectCommand="SELECT [T_id], [s_order_no], [date], [customer_name], [total_amt], [payment_mode] FROM [sales_order_details]">
            </asp:SqlDataSource>
        </div>

                    

        






        </div>
</div>
</asp:Content>

