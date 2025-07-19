<%@ Page Title="" Language="C#" MasterPageFile="~/Dashbo.master" AutoEventWireup="true" CodeFile="Stock_level.aspx.cs" Inherits="Stock_level" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="my-3 container-fluid table-responsive-lg d-flex flex-column justify-content-center align-items-center">
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
            <HeaderTemplate>
                <table class="table table-bordered text-center">
                <thead>
                        <th>Product ID</th>
                        <th>Product Name</th>
                        <th>Category</th>
                        <th>SKU</th>
                        <th>Unit Measure (Sq. ft)</th>
                        <th>Dimension</th>
                        <th>Thickness</th>
                        <th>GST</th>
                        <th>Quantity</th>
                        <th>Purchase Rate (Rs.)</th>
                        <th>Selling Rate (Rs.)</th>
                        <th>Date Added</th>
                        <th>Last Date of Inward</th>
                        <th>Minimum Stock Requried</th>
                        <th>Max Stock Required</th>
                </thead>
                <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                    <tr>
                        <td><asp:Label ID="p_idLabel" runat="server" Text='<%# Eval("p_id") %>' /></td>
                        <td><asp:Label ID="p_nameLabel" runat="server" Text='<%# Eval("p_name") %>' /></td>
                        <td><asp:Label ID="categoryLabel" runat="server" Text='<%# Eval("category") %>' /></td>
                        <td><asp:Label ID="SKULabel" runat="server" Text='<%# Eval("SKU") %>' /></td>
                        <td><asp:Label ID="unit_measureLabel" runat="server" Text='<%# Eval("unit_measure") %>' /></td>
                        <td><asp:Label ID="dimensionLabel" runat="server" Text='<%# Eval("dimension") %>' /></td>
                        <td><asp:Label ID="thicknessLabel" runat="server" Text='<%# Eval("thickness") %>' /></td>
                        <td><asp:Label ID="gstLabel" runat="server" Text='<%# Eval("gst") %>' /></td>
                        <td><asp:Label ID="quantityLabel" runat="server" Text='<%# Eval("quantity") %>' /></td>
                        <td><asp:Label ID="purchase_rateLabel" runat="server" Text='<%# Eval("purchase_rate") %>' /></td>
                        <td><asp:Label ID="selling_rateLabel" runat="server" Text='<%# Eval("selling_rate") %>' /></td>
                        <td><asp:Label ID="date_addedLabel" runat="server" Text='<%# Eval("date_added") %>' /></td>
                        <td><asp:Label ID="date_modifiedLabel" runat="server" Text='<%# Eval("date_modified") %>' /></td>
                        <td><asp:Label ID="min_stockLabel" runat="server" Text='<%# Eval("min_stock") %>' /></td>
                        <td><asp:Label ID="max_stockLabel" runat="server" Text='<%# Eval("max_stock") %>' /></td>
                    </tr>
            </ItemTemplate>
            <FooterTemplate>
                </tbody>
            </table>
            </FooterTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:conn %>" 
            SelectCommand="SELECT [p_id], [p_name], [category], [SKU], [unit_measure], [dimension], [thickness], [gst], [quantity], [purchase_rate], [selling_rate], [date_added], [date_modified], [min_stock], [max_stock] FROM [products]">
        </asp:SqlDataSource>
    </div>
</asp:Content>

