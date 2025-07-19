<%@ Page Title="" Language="C#" MasterPageFile="~/Dashbo.master" AutoEventWireup="true" CodeFile="Categories.aspx.cs" Inherits="Categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style= "height:;" class="C container-fluid d-flex flex-column justify-content-center align-items-center">
        <div class="container-fluid p-2 border">
                        <div class="nav d-flex justify-content-end">
                            <!-- Button trigger modal -->
                            <button type="button" class="btn btn-sm btn-primary me-2" data-bs-toggle="modal" data-bs-target="#exampleModal">Add New Category</button>
                            <asp:Button class="btn btn-sm btn-primary" ID="SKU_form" runat="server" 
                                Text="Add SKU" onclick="SKU_form_Click" />

                        </div>
                        <div class="container-fluid">
                            <!-- Modal -->
                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                              <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                  <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Add Category</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                  </div>
                                  <div class="modal-body">
                                    <!-- Category Form -->
                                    <div class="col-md-12 mb-2">
                                        <label for="c_contact" class="form-label">Category</label>
                                        <asp:TextBox ID="Category_name" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-12 mb-2">
                                        <label for="c_contact" class="form-label">Discription</label>
                                        <asp:TextBox ID="cat_des" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Button class="btn btn-sm btn-primary" ID="Save_Category" runat="server" 
                                            Text="Save Category" onclick="Save_Category_Click" />
                                    </div>
                                    <!-- Category Form end -->
                                  </div>
                                </div>
                              </div>
                            </div>
                            <!-- Modal END -->
                            <div class="container-fluid">
                                <asp:Label class="fs-5 text-danger" ID="error" runat="server" Text=""></asp:Label>
                                <asp:Label class="text-success fs-5" ID="msg" runat="server" Text=""></asp:Label>
                            </div>

                            <div class="row my-1">
                            <%--Categories--%>
                                <div class="col-lg-6 col-md-6 col-sm-12 container-fluid d-flex justify-content-center align-items-center table-responsive">
                                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
                                    <HeaderTemplate>
                                        <table class="table table-bordered text-center">
                                            <thead>
                                                <tr>
                                                    <th>Category ID</th>
                                                    <th>Category Name</th>
                                                    <th>Category Description</th>
                                                    <th>Category Generation Date</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                    </HeaderTemplate>
                            
                                    <ItemTemplate>
                                        <tr>
                                            <td><asp:Label ID="cat_idLabel" runat="server" Text='<%# Eval("cat_id") %>' /></td>
                                            <td><asp:Label ID="cat_nameLabel" runat="server" Text='<%# Eval("cat_name") %>' /></td>
                                            <td><asp:Label ID="cat_desLabel" runat="server" Text='<%# Eval("cat_des") %>' /></td>
                                            <td><asp:Label ID="cat_gen_dateLabel" runat="server" Text='<%# Eval("cat_gen_date") %>' /></td>
                                        </tr>
                                    </ItemTemplate>
                            
                                    <FooterTemplate>
                                            </tbody>
                                        </table>
                                    </FooterTemplate>
                                </asp:DataList>
                            
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:conn %>" 
                                    SelectCommand="SELECT [cat_id], [cat_name], [cat_des], [cat_gen_date] FROM [categories]">
                                </asp:SqlDataSource>
                            </div>
                                <%--SKUs--%>
                                <div class="col-lg-6 col-md-6 col-sm-12 d-flex justify-content-center align-items-start table-responsive">
                                
                                <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2">
                                    <HeaderTemplate>
                                        <table class="table table-bordered text-center">
                                            <thead>
                                                <tr>
                                                    <th>SKU ID</th>
                                                    <th>SKU Name</th>
                                                    <th>SKU Description</th>
                                                    <th>Creation Date</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td><asp:Label ID="SKU_idLabel" runat="server" Text='<%# Eval("SKU_id") %>' /></td>
                                            <td><asp:Label ID="SKU_nameLabel" runat="server" Text='<%# Eval("SKU_name") %>' /></td>
                                            <td><asp:Label ID="SKU_desLabel" runat="server" Text='<%# Eval("SKU_des") %>' /></td>
                                            <td><asp:Label ID="date_of_creationLabel" runat="server" Text='<%# Eval("date_of_creation") %>' /></td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                            </tbody>
                                        </table>
                                    </FooterTemplate>
                                </asp:DataList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:conn %>" 
                                    SelectCommand="SELECT * FROM [SKUs] ORDER BY [date_of_creation] DESC">
                                </asp:SqlDataSource>
                            </div>
                            </div>





                            <%--<table class="table">
                                <tr>
                                    <td>Category Name</td>
                                    <td>Description</td>
                                    <td>Products</td>
                                    <td>Date of Creation</td>
                                    <td>Actions</td>
                                </tr>
                                <tr>
                                    <td>Plywood</td>
                                    <td>MDF, BEBE</td>
                                    <td>452</td>
                                    <td>25/12/25</td>
                                    <td><asp:Button class="btn btn-sm btn-danger" ID="Button17" runat="server" Text="Delete" /></td>
                                </tr>
                            </table>--%>
                        
                        </div>
                    </div>
    </div>
</asp:Content>

