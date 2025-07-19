<%@ Page Title="" Language="C#" MasterPageFile="~/Dashbo.master" AutoEventWireup="true" CodeFile="Product.aspx.cs" Inherits="Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style= "height:;" class="C container-fluid d-flex flex-column justify-content-center align-items-center">
        <div class="p-2 row g-3">
        
                <div class="col-md-5">
                            <label for="Product_Name" class="form-label">Product Name</label>
                            <asp:TextBox ID="P_name" class="form-control" runat="server"></asp:TextBox>
                        </div>
                <div class="col-md-4">
                            <label for="Category" class="form-label">Category</label>

                            <asp:DropDownList runat="server" ID ="Category" CssClass="form-select me-2 border" ></asp:DropDownList>
                        </div>
                <div class="col-md-3">
                            <label for="SKU" class="form-label">SKU</label>
                            
                            <asp:DropDownList runat="server" ID ="ddlSKU" CssClass="form-select me-2 border" ></asp:DropDownList>

                        </div>
                <div class="col-md-5">
                            <label for="brand" class="form-label">Manufracturer/Brand</label>
                            <asp:TextBox ID="brand" class="form-control" runat="server"></asp:TextBox>
                        </div>
                <div class="col-md-2">
                            <label for="MPU" class="form-label">Length</label>
                            <asp:TextBox ID="Length" class="form-control" runat="server"></asp:TextBox>
                        </div>
                <div class="col-md-2">
                            <label for="MPU" class="form-label">Width</label>
                            <asp:TextBox ID="Width" class="form-control" runat="server"></asp:TextBox>
                        </div>
                <div class="col-md-3">
                            <label for="MPU" class="form-label">Thickness</label>
                            <asp:TextBox ID="thickness" class="form-control" runat="server"></asp:TextBox>
                        </div>
                <div class="col-md-2">
                            <label for="GST" class="form-label">GST Rate</label>
                            <asp:TextBox ID="GST" class="form-control" runat="server"></asp:TextBox>
                        </div>
                <div class="col-md-2">
                            <label for="Quantity" class="form-label">Quantity</label>
                            <asp:TextBox ID="Quantity" class="form-control" runat="server"></asp:TextBox>
                        </div>
                <div class="col-md-4">
                            <label for="purchase_p" class="form-label">Purchase Price (per Sq. ft)</label>
                            <asp:TextBox ID="purchase_p" class="form-control" runat="server"></asp:TextBox>
                        </div>
                <div class="col-md-4">
                            <label for="Selling_p" class="form-label">Selling Price (per Sq. ft)</label>
                            <asp:TextBox ID="SP" class="form-control" runat="server"></asp:TextBox>
                        </div>
                <div class="col-12">
                    <asp:Button class="btn btn-primary btn-sm" ID="Add_product" runat="server" 
                                Text="Add Product" onclick="Add_product_Click" />
                    <asp:Button class="btn btn-primary btn-sm" ID="view_product_list" 
                                runat="server" Text="View Product List" onclick="view_product_list_Click" />
                            
                   
                </div>
                <div class="col-md-4">
                    <asp:Label CssClass="text-danger" ID="error" runat="server" Text=""></asp:Label>
                </div>
        </div>
    </div>
</asp:Content>

