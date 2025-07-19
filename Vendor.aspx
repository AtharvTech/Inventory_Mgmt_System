<%@ Page Title="" Language="C#" MasterPageFile="~/Dashbo.master" AutoEventWireup="true" CodeFile="Vendor.aspx.cs" Inherits="Vendor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style= "height:;" class="C container-fluid d-flex flex-column justify-content-center align-items-center">
         <div class="container col-5 d-flex justify-content-between align-items-center flex-row my-2">
             
             <asp:TextBox class="form-control me-3" placeholder="Vendor Name" ID="find_by_date"  runat="server"></asp:TextBox>
             
                <asp:Button ID="btnFilter" runat="server" Text="Search" OnClick="btnFilter_Click" CssClass="btn-sm btn btn-primary" />

           
         </div>
         <div class="container-fluid table-responsive d-flex justify-content-center align-items-center">
             <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
                 <HeaderTemplate>
                    <table class="table table-bordered text-center">
                        <thead>
                            <tr>
                                <th>Order No.</th>
                                <th>Date</th>
                                <th>Vendor Name</th>
                                <th>Vendor GSTIN</th>
                                <th>Total Amount</th>
                                <th>Payment Mode</th>
                            </tr>
                        </thead>
                        <tbody>
                        
                 </HeaderTemplate>
                 <ItemTemplate>


                    <tr>
                        <td><asp:Label ID="order_noLabel" runat="server" Text='<%# Eval("order_no") %>' /></td>
                        <td><asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' /></td>
                        <td><asp:Label ID="vendor_nameLabel" runat="server" Text='<%# Eval("vendor_name") %>' /></td>
                        <td><asp:Label ID="v_gstLabel" runat="server" Text='<%# Eval("v_gst") %>' /></td>
                        <td><asp:Label ID="Total_amtLabel" runat="server" Text='<%# Eval("Total_amt") %>' /></td>
                        <td><asp:Label ID="payment_modeLabel" runat="server" Text='<%# Eval("payment_mode") %>' /></td>
                    </tr>

                    
                 </ItemTemplate>
                 <FooterTemplate>
                    </tbody>
                    </table>
                 </FooterTemplate>
             </asp:DataList>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:conn %>" 
                 
                 SelectCommand="SELECT [order_no], [date], [vendor_name], [v_gst], [Total_amt], [payment_mode] FROM [purchase_order_details]">
             </asp:SqlDataSource>
         </div>
    </div>
</asp:Content>

