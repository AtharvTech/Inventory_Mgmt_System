<%@ Page Title="" Language="C#" MasterPageFile="~/in_master.master" AutoEventWireup="true" CodeFile="view_prod.aspx.cs" Inherits="view_prod" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    



        <div class="container-fluid d-flex justify-content-center align-items-center flex-column my-3">

                    <table class="table table-bordered" style="width:60%">
                        <tr>
                            <td><label for="Product ID" class="form-label p-2">Product ID :</label></td>
                            <td><asp:Label CssClass="p-2" ID="lblp_id" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td><label for="Company_Name" class="form-label p-2">Product Name :</label></td>
                            <td><asp:Label CssClass="p-2" ID="lblProductName" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td><label for="Company_Name" class="form-label p-2">Category :</label></td>
                            <td><asp:Label CssClass="p-2" ID="lblCategory" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td><label for="Company_Name" class="form-label p-2">SKU :</label></td>
                            <td><asp:Label CssClass="p-2" ID="lblSKU" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td><label for="Company_Name" class="form-label p-2">GST :</label></td>
                            <td><asp:Label CssClass="p-2" ID="lblGst" runat="server" Text=""></asp:Label>%</td>
                        </tr>
                        <tr>
                            <td><label for="Company_Name" class="form-label p-2">Dimensions :</label></td>
                            <td><asp:Label CssClass="p-2" ID="dimension" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td><label for="Company_Name" class="form-label p-2">Thickness :</label></td>
                            <td><asp:Label CssClass="p-2" ID="thickness" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td><label for="Company_Name" class="form-label p-2">Unit Measure :</label></td>
                            <td><asp:Label CssClass="p-2" ID="lblUnitMeasure" runat="server" Text=""></asp:Label>Sq. ft</td>
                        </tr>
                        <tr>
                            <td><label for="Company_Name" class="form-label p-2">Unit Purchase Price :</label></td>
                            <td><asp:Label CssClass="p-2" ID="UPP" runat="server" Text=""></asp:Label>Sq. ft</td>
                        </tr>
                        <tr>
                            <td><label for="Company_Name" class="form-label p-2">Unit Selling Price:</label></td>
                            <td><asp:Label CssClass="p-2" ID="USP" runat="server" Text=""></asp:Label>Sq. ft</td>
                        </tr>
                        <tr>
                            <td><label for="Company_Name" class="form-label p-2">Quantity Available :</label></td>
                            <td><asp:Label CssClass="p-2" ID="qty" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td><label for="Company_Name" class="form-label p-2">Purchase Rate (per Sq. ft) :</label></td>
                            <td><asp:Label CssClass="p-2" ID="lblPurchaseRate" runat="server" Text=""></asp:Label>Rs.</td>
                        </tr>
                        <tr>
                            <td><label for="Company_Name" class="form-label p-2">Selling Rate (per Sq. ft) :</label></td>
                            <td><asp:Label CssClass="p-2" ID="lblSellingRate" runat="server" Text=""></asp:Label>Rs.</td>
                        </tr>
                        <tr>
                            <td><label for="Company_Name" class="form-label p-2">Minimum Stock Required :</label></td>
                            <td><asp:Label CssClass="p-2" ID="min" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td><label for="Company_Name" class="form-label p-2">Maximum Stock Required :</label></td>
                            <td><asp:Label CssClass="p-2" ID="max" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td><label for="Company_Name" class="form-label p-2">Date Added :</label></td>
                            <td><asp:Label CssClass="p-2" ID="date_add" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td><label for="Company_Name" class="form-label p-2">Last Date of Inward :</label></td>
                            <td><asp:Label CssClass="p-2" ID="datemodified" runat="server" Text=""></asp:Label></td>
                        </tr>
                        
                        <tr>
                            <td><label for="Company_Name" class="form-label p-2">Value of Goods Sold :</label></td>
                            <td><asp:Label CssClass="p-2" ID="sold_goods_value" runat="server" Text=""></asp:Label>Rs.</td>
                        </tr>
                        <tr>
                            <td><label for="Company_Name" class="form-label p-2">Cost :</label></td>
                            <td><asp:Label CssClass="p-2" ID="cost" runat="server" Text=""></asp:Label>Rs.</td>
                        </tr>
                        <tr>
                            <td><label for="Company_Name" class="form-label p-2">Total Stock Valuation :</label></td>
                            <td><asp:Label CssClass="p-2" ID="value" runat="server" Text=""></asp:Label>Rs.</td>
                        </tr>
                        <tr>
                            <td><label for="Company_Name" class="form-label p-2">Profit :</label></td>
                            <td><asp:Label CssClass="p-2" ID="profit" runat="server" Text=""></asp:Label>Rs.</td>
                        </tr>
                    </table>
                    <asp:Button ID="Back" runat="server" class="btn btn-sm btn-secondary my-3" 
                        Text="Back" onclick="Back_Click" />
                                
        </div>


    
</asp:Content>

