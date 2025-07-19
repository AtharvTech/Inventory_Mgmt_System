<%@ Page Title="" Language="C#" MasterPageFile="~/in_master.master" AutoEventWireup="true" CodeFile="product_list.aspx.cs" Inherits="product_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style= "height:;" class="C container-fluid d-flex flex-column justify-content-center align-items-center">
        <div id="Div1" class="container-fluid border" runat="server">
  
            <div class="container-fluid col-10 d-flex justify-content-between align-items-center flex-row my-2">
                <asp:TextBox ID="search_p" CssClass="form-control me-3" placeholder="Search product" runat="server"></asp:TextBox>

                
                <asp:Button class="btn btn-outline-success btn-sm me-3" ID="Searchp" 
                    runat="server" Text="Search" onclick="Searchp_Click"></asp:Button>
                <asp:Button class="btn btn-sm btn-primary me-3" ID="Edit_prod" runat="server" 
                        Text="Edit" onclick="Edit_prod_Click"/>
                <asp:Button class="btn btn-secondary btn-sm" ID="back" runat="server" 
                    Text="Back" onclick="back_Click" ></asp:Button>
            </div>
    
            

        <div class="container-fluid d-flex justify-content-center align-items-center table-responsive">
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
                <HeaderTemplate>
                    <table class="table table-bordered text-center">
                        <thead>
                            <tr>
                                <td>Product ID</td>
                                <td>Product Name</td>
                                <td>Category</td>
                                <td>Measure of a Unit</td>
                                <td>GST Rate</td>
                                <td>Purchase Rate</td>
                                <td>Selling Rate</td>
                                <td>Action</td>
                                
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><asp:Label ID="p_idLabel" runat="server" Text='<%# Eval("p_id") %>' /></td>
                        <td><asp:Label ID="p_nameLabel" runat="server" Text='<%# Eval("p_name") %>' /></td>
                        <td><asp:Label ID="categoryLabel" runat="server" Text='<%# Eval("category") %>' /></td>
                        <td><asp:Label ID="unit_measureLabel" runat="server" Text='<%# Eval("unit_measure") %>' /></td>
                        <td><asp:Label ID="gstLabel" runat="server" Text='<%# Eval("gst") %>' /></td>
                        <td><asp:Label ID="purchase_rateLabel" runat="server" Text='<%# Eval("purchase_rate") %>' /></td>
                        <td><asp:Label ID="selling_rateLabel" runat="server" Text='<%# Eval("selling_rate") %>' /></td>
                        <td><asp:Button ID="view" runat="server" CommandArgument='<%# Eval("p_id") %>' 
                                CssClass="btn btn-sm btn-primary" Text="View" onclick="view_Click" /></td>
                    </tr>  
                    
                </ItemTemplate>
                <FooterTemplate>
                    </tbody>
                    </table>
                </FooterTemplate>
            </asp:DataList>
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:conn %>" 
                SelectCommand="SELECT [p_id], [p_name], [category], [unit_measure], [gst], [purchase_rate], [selling_rate] FROM [products]">
            </asp:SqlDataSource>
            
        </div>


            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-xl">
            <div class="modal-content">
              <div class="modal-header">
                <%--<h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>--%>
                  <asp:Label ID="P_name" runat="server" Text="@Product Name"></asp:Label>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <div class="p-2 d-flex flex-column row g-3">
                    <div class="col-12 d-flex justify-content-center align-items-start flex-sm-column flex-lg-row">
                        <label for="Company_Name" class="form-label p-2">Product ID :</label>
                        <asp:Label CssClass="p-2" ID="Label1" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="col-12 d-flex justify-content-center align-items-start flex-sm-column flex-lg-row">
                        <label for="Company_Name" class="form-label p-2">Product Name :</label>
                        <asp:Label CssClass="p-2" ID="Label2" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="col-12 d-flex justify-content-center align-items-start flex-sm-column flex-lg-row">
                        <label for="Company_Name" class="form-label p-2">Category :</label>
                        <asp:Label CssClass="p-2" ID="Label3" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="col-12 d-flex justify-content-center align-items-start flex-sm-column flex-lg-row">
                        <label for="Company_Name" class="form-label p-2">SKU :</label>
                        <asp:Label CssClass="p-2" ID="Label4" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="col-12 d-flex justify-content-center align-items-start flex-sm-column flex-lg-row">
                        <label for="Company_Name" class="form-label p-2">Dimensions :</label>
                        <asp:Label CssClass="p-2" ID="Label5" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="col-12 d-flex justify-content-center align-items-start flex-sm-column flex-lg-row">
                        <label for="Company_Name" class="form-label p-2">Thickness :</label>
                        <asp:Label CssClass="p-2" ID="Label6" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="col-12 d-flex justify-content-center align-items-start flex-sm-column flex-lg-row">
                        <label for="Company_Name" class="form-label p-2">Unit Measure :</label>
                        <asp:Label CssClass="p-2" ID="Label7" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="col-12 d-flex justify-content-center align-items-start flex-sm-column flex-lg-row">
                        <label for="Company_Name" class="form-label p-2">Quantity Available :</label>
                        <asp:Label CssClass="p-2" ID="Label8" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="col-12 d-flex justify-content-center align-items-start flex-sm-column flex-lg-row">
                        <label for="Company_Name" class="form-label p-2">Minimum Stock Required :</label>
                        <asp:Label CssClass="p-2" ID="Label9" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="col-12 d-flex justify-content-center align-items-start flex-sm-column flex-lg-row">
                        <label for="Company_Name" class="form-label p-2">Maximum Stock Required :</label>
                        <asp:Label CssClass="p-2" ID="Label10" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="col-12 d-flex justify-content-center align-items-start flex-sm-column flex-lg-row">
                        <label for="Company_Name" class="form-label p-2">Last Date of Inward :</label>
                        <asp:Label CssClass="p-2" ID="Label11" runat="server" Text="Label"></asp:Label>
                    </div>
                     <div class="col-12 d-flex justify-content-center align-items-start flex-sm-column flex-lg-row">
                        <label for="Company_Name" class="form-label p-2">Last Date of Sale :</label>
                         <asp:Label CssClass="p-2" ID="Label12" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="col-12 d-flex justify-content-center align-items-start flex-sm-column flex-lg-row">
                        <label for="Company_Name" class="form-label p-2">Cost of Goods Sold :</label>
                        <asp:Label CssClass="p-2" ID="Label13" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="col-12 d-flex justify-content-center align-items-start flex-sm-column flex-lg-row">
                        <label for="Company_Name" class="form-label p-2">Total Stock Valuation :</label>
                        <asp:Label CssClass="p-2" ID="Label14" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="col-12 d-flex justify-content-center align-items-start flex-sm-column flex-lg-row">
                        <label for="Company_Name" class="form-label p-2">Profit :</label>
                        <asp:Label CssClass="p-2" ID="Label15" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              </div>
            </div>
          </div>
        </div>
        </div>
    </div>
</asp:Content>

