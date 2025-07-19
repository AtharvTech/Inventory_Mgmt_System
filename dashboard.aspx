    <%@ Page Title="" Language="C#" MasterPageFile="~/Dashbo.master" AutoEventWireup="true" CodeFile="dashboard.aspx.cs" Inherits="dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style= "height:;" class="C container-fluid d-flex flex-column justify-content-center align-items-center">
        <div class="d-flex container-fluid row mb-2">
                            <div class="mb-sm-1 mb-md-1 mb-lg-0 col-lg-3 col-sm-12 col-md-6 d-flex align-items-center flex-row border border-dark rounded">
                                <div class="col-5">
                                    <img src="imgs/rating.png" class="img-fluid h-50 w-50" alt="img"/>
                                </div>
                                <div class="col-7">
                                    <h3>Customer</h3>
                                    <h1><asp:Label ID="customer" runat="server" Text=""></asp:Label></h1>
                                </div>
                            </div>
                            <div class="mb-sm-1 mb-md-1 mb-lg-0 col-lg-3 col-sm-12 col-md-6 d-flex align-items-center flex-row border border-dark rounded">
                                <div class="col-5">
                                    <img src="imgs/research.png" class="img-fluid h-50 w-50" alt="img"/>
                                </div>
                                <div class="col-7">
                                    <h3>Products</h3>
                                    <h1><asp:Label ID="products" runat="server" Text=""></asp:Label></h1>
                                </div>
                            </div>
                            <div class="mb-sm-1 mb-md-1 mb-lg-0 col-lg-3 col-sm-12 col-md-6 d-flex align-items-center flex-row border border-dark rounded">
                                <div class="col-5">
                                    <img src="imgs/sale.png" class="img-fluid h-50 w-50" alt="img"/>
                                </div>
                                <div class="col-7">
                                    <h3>Sales</h3>
                                    <h1><asp:Label ID="sale" runat="server" Text=""></asp:Label></h1>
                                </div>
                            </div>
                            <div class="mb-sm-1 mb-md-1 mb-lg-0 col-lg-3 col-sm-12 col-md-6 d-flex align-items-center flex-row border border-dark rounded">
                                <div class="col-5">
                                    <img src="imgs/vendor.png" class="img-fluid h-50 w-50" alt="img"/>
                                </div>
                                <div class="col-7">
                                    <h3>Vendors</h3>
                                    <h1><asp:Label ID="vendor" runat="server" Text=""></asp:Label></h1>
                                </div>
                            </div>
                        </div>
        <div class="row container-fluid d-flex justify-content-center align-items-start flex-row h-75">
                            <div class="col-lg-6 col-sm-12 col-md-12 container-fluid">
                                <h3>Low Stock</h3>
                                <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2">
                                    <HeaderTemplate>
                                        <table class="table text-center table-bordered">
                                            <thead>
                                                <tr>
                                                    <td>Product Name</td>
                                                    <td>Quantity Left</td>
                                                </tr>
                                            </thead>
                                            <tbody>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td><asp:Label ID="p_nameLabel" runat="server" Text='<%# Eval("p_name") %>' /></td>
                                            <td><asp:Label ID="quantityLabel" runat="server" Text='<%# Eval("quantity") %>' /></td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                            </tbody>
                                        </table>
                                    </FooterTemplate>
                                </asp:DataList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:conn %>" 
                                    SelectCommand="SELECT p_name, quantity FROM products WHERE (quantity &lt; min_stock)">
                                </asp:SqlDataSource>
                                
                            </div>
                            <div class="col-lg-6 col-sm-12 col-md-12 container-fluid">
                                <h3>Recently Added</h3>
                                <%--display product--%>
                                <div class="container-fluid table-responsive">
                                    
                                    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
                                        <HeaderTemplate>
                                            <table class="table text-center table-bordered">
                                                <thead>
                                                    <tr>
                                                        <td>Product Name</td>
                                                        <td>Valuation (Rs.)</td>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td><asp:Label ID="p_nameLabel" runat="server" Text='<%# Eval("p_name") %>' /></td>
                                                <td><asp:Label ID="valuationLabel" runat="server" Text='<%# Eval("valuation") %>' /></td>
                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                                </tbody>
                                            </table>
                                        </FooterTemplate>
                                    </asp:DataList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:conn %>" 
                                        SelectCommand="SELECT [p_name], [valuation] FROM [products]">
                                    </asp:SqlDataSource>
                                </div>

                                
                            </div>
                        </div>
    </div>
</asp:Content>

