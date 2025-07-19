<%@ Page Title="" Language="C#" MasterPageFile="~/in_master.master" AutoEventWireup="true" CodeFile="view_sales_bill.aspx.cs" Inherits="view_sales_bill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="container-fluid d-flex justify-content-center align-items-center flex-column">
    <div class="container-fluid d-flex justify-content-center align-items-center flex-column w-50 my-3">
    


    
   
    
    <div class="container-fluid d-flex flex-column border justify-content-center align-items-center">
        <div class="container-fluid d-flex justify-content-between align-items-start mb-2 my-3 row">
            <div class="col-6 d-flex justify-content-start align-items-end">
                <label>Invoice No. :</label>
                    <asp:Label ID="lblOrderNo" runat="server" Text="" />
            </div>
            <div class="col-6 d-flex justify-content-end align-items-end">
                
                <asp:Label ID="Label1" runat="server" Text="Invoice Date :"></asp:Label>
                    <asp:Label ID="lblOrderDate" runat="server" Text="" />
            </div>
        </div>
        <div class="container-fluid d-flex justify-content-between align-items-start my-3 row">
            <div class="col-6 d-flex justify-content-start align-items-end">
            <label>Vendor Name :</label>
                <asp:Label ID="lblCustomerName" runat="server" Text="" />
        </div>
            <div class="col-6 d-flex justify-content-end align-items-end">
            <label>Total Amount :</label>
                <asp:Label ID="lblTotalAmount" runat="server" Text="" />
        </div>
        </div>
    </div>
    <div class="container-fluid d-flex justify-content-center border align-items-center">
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
            <HeaderTemplate>
                <table class="table table-bordered text-center my-3">
                    <thead>
                        <tr>
                            <td>Product Name</td>
                            <td>HSN/SAC</td>
                            <td>Quantity</td>
                            <td>Unit Price</td>
                            <td>GST Rate</td>
                            <td>Size</td>
                            <td>Total</td>
                        </tr>
                    </thead>
                    <tbody>
                    
            </HeaderTemplate>
            <ItemTemplate>
                
                <tr>
                    <td><asp:Label ID="prod_nameLabel" runat="server" Text='<%# Eval("prod_name") %>' /></td>
                    <td><asp:Label ID="HSNLabel" runat="server" Text='<%# Eval("HSN") %>' /></td>
                    <td><asp:Label ID="quantityLabel" runat="server" Text='<%# Eval("quantity") %>' /></td>
                    <td><asp:Label ID="unit_priceLabel" runat="server" Text='<%# Eval("unit_price") %>' /></td>
                    <td><asp:Label ID="gst_rateLabel" runat="server" Text='<%# Eval("gst_rate") %>' /></td>
                    <td><asp:Label ID="sizeLabel" runat="server" Text='<%# Eval("size") %>' /></td>
                    <td><asp:Label ID="totalLabel" runat="server" Text='<%# Eval("total") %>' /></td>
                </tr>

            </ItemTemplate>
            <FooterTemplate>
                </tbody>
                </table>
            </FooterTemplate>
        </asp:DataList>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:conn %>" 
            SelectCommand="SELECT s_order_no, prod_name, HSN, quantity, unit_price, gst_rate, size, total, gst_price FROM sales_product_details WHERE (s_order_no LIKE '%' + @order_id + '%')">
            <SelectParameters>
                <asp:ControlParameter ControlID="pass_bill" Name="order_id" 
                    PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

        <asp:Button ID="back" class="btn btn-sm btn-secondary my-3" runat="server" 
            Text="Back" onclick="back_Click" />
        

    </div>

</div>
    <asp:Label ID="pass_bill" CssClass="d-none" runat="server" Text=""></asp:Label>

</asp:Content>

