<%@ Page Title="" Language="C#" MasterPageFile="~/Dashbo.master" AutoEventWireup="true" CodeFile="Sales.aspx.cs" Inherits="Sales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style= "height:;" class="C container-fluid d-flex flex-column justify-content-center align-items-center">
        <div class="p-2 row g-3 container-fluid">
                        <asp:Label class="text-danger fs-5" ID="error" runat="server" Text=""></asp:Label>
                        <asp:Label class="text-success fs-5" ID="msg" runat="server" Text=""></asp:Label>


                        <div class="d-flex flex-sm-column flex-lg-row flex-md-row justify-content-between col-lg-12 col-md-12 col-sm-12">
                            <div class="col-md-2">
                                <label for="GST" class="form-label">GSTIN</label>
                                <asp:TextBox ID="GSTIN" class="form-control" runat="server" disabled> 27AABCU8503R1ZU</asp:TextBox>
                            </div>
                            <div class="col-md-3">
                                <label for="INO" class="form-label">Invoice No.</label>
                                <asp:TextBox ID="INO" class="form-control" runat="server" disabled></asp:TextBox>
                            </div>
                            <div class="col-md-2">
                                <label for="Date" class="form-label">Date</label>
                                <asp:TextBox ID="SDate" class="form-control" runat="server" disabled></asp:TextBox>
                            </div>
                        </div>
                        
                        
                        
                        <div class="col-md-6">
                            <label for="cust_Name" class="form-label">Customer Name</label>
                            <asp:TextBox ID="cust_name" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        
                        <div class="col-md-6">
                            <label for="c_contact" class="form-label">Customer Contact</label>
                            <asp:TextBox ID="c_contact" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <hr />                        
                        <div class="col-lg-2 col-md-4 col-sm-12">
                            <label for="vendor_Name" class="form-label">Product Name :</label>
                            <asp:DropDownList class="form-control" ID="Product" runat="server">
                            </asp:DropDownList>
                        </div>
                        <div class="col-lg-2 col-md-4 col-sm-12">
                            <label for="vendor_Name" class="form-label">HSN/SAC :</label>
                            <asp:TextBox class="form-control" ID="HSN" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-lg-2 col-md-4 col-sm-12">
                            <label for="vendor_Name" class="form-label">Quantity :</label>
                            <asp:TextBox class="form-control" ID="Quantity" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-lg-2 col-md-4 col-sm-12">
                            <label for="vendor_Name" class="form-label">Size :</label>
                            <asp:DropDownList class="form-control" ID="size" runat="server">
                            </asp:DropDownList>
                        </div>
                        
                        <div class="col-lg-2 col-md-4 col-sm-12 d-flex justify-content-center align-items-end">
                            <asp:Button class="btn btn-sm btn-primary" ID="Add_Item" runat="server" 
                                Text="Add Item" onclick="Add_Item_Click" />                            
                        </div>
                        <hr />
                        <div class="col-12 d-flex justify-content-center table-responsive">

                            <asp:DataList ID="DataList1" OnItemCommand="DataList1_ItemCommand" runat="server" DataSourceID="SqlDataSource1">
                                <HeaderTemplate>
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <td>Product Name</td>
                                                <td>HSN</td>
                                                <td>Quantity</td>
                                                <td>Size</td>
                                                <td>Unit Price</td>
                                                <td>GST</td>
                                                <td>Unit Measurement (Sq.ft)</td>
                                                <td>Unit Measure Price</td>
                                               
                                                <td>Total</td>
                                                <td>Action</td>

                                            </tr>
                                        </thead>
                                        <tbody>
                                        
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td><asp:Label ID="prod_nameLabel" runat="server" Text='<%# Eval("prod_name") %>' /></td>
                                        <td><asp:Label ID="HSNLabel" runat="server" Text='<%# Eval("HSN") %>' /></td>
                                        <td><asp:Label ID="quantityLabel" runat="server" Text='<%# Eval("quantity") %>' /></td>
                                        <td><asp:Label ID="sizeLabel" runat="server" Text='<%# Eval("size") %>' /></td>
                                        <td><asp:Label ID="unit_priceLabel" runat="server" Text='<%# Eval("unit_price") %>' /></td>
                                        <td><asp:Label ID="gst_rateLabel" runat="server" Text='<%# Eval("gst_rate") %>' /></td>
                                        <td><asp:Label ID="unit_measurementLabel" runat="server" Text='<%# Eval("unit_measurement") %>' /></td>
                                        <td><asp:Label ID="unit_measure_priceLabel" runat="server" Text='<%# Eval("unit_measure_price") %>' /></td>
                                        
                                        <td><asp:Label ID="totalLabel" runat="server" Text='<%# Eval("total") %>' /></td>
                                        <td><asp:Button ID="del_btn" runat="server" CssClass="btn btn-sm btn-danger" Text="Delete" CommandName="DeleteRecord" CommandArgument='<%# Eval("prod_name") + "|" + Eval("quantity") + "|" + Eval("s_order_no") %>' /></td>
                                        
                                    </tr>
                                    
                                    
                                    
                                </ItemTemplate>
                                <FooterTemplate>
                                    </tbody>
                                    </table>
                                </FooterTemplate>
                            </asp:DataList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:conn %>" 
                                SelectCommand="SELECT s_order_no, prod_name, HSN, quantity, unit_price, gst_rate, unit_measure_price, unit_measurement, size, total FROM sales_product_details WHERE (s_order_no LIKE '%' + @order_id + '%')">
                                <SelectParameters>
                                    <asp:Parameter Name="order_id" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                        
                        <hr />

                        <div class="col-lg-4 col-md-4 col-sm-12 text-lg-center text-md-center">
                            <label>GST Amount : </label>
                            <asp:Label ID="GST_Amount" runat="server" Text=""></asp:Label> 
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-12 text-lg-center text-md-center">
                            <label>Total Amount : </label>                            
                            <asp:Label ID="Total_bill" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="col-12">
                            <asp:DropDownList class="form-control" ID="pay" runat="server">
                            </asp:DropDownList>
                        </div>
                        


                        <div class="col-12">
                            
                            <asp:Button class="btn btn-primary btn-sm" ID="Generate" runat="server" 
                                Text="Generate" onclick="Generate_Click" />
                            <asp:Button class="btn btn-primary btn-sm" ID="View_Sales_List" runat="server" 
                                Text="View Sales List" onclick="View_Sales_List_Click" />
                        </div>
                    </div>
    </div>
</asp:Content>

