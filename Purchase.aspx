<%@ Page Title="" Language="C#" MasterPageFile="~/Dashbo.master" AutoEventWireup="true" CodeFile="Purchase.aspx.cs" Inherits="Purchase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



    <div style= "height:;" class="C container-fluid d-flex flex-column justify-content-center align-items-center">
        <div class="p-2 row g-3">
                        <asp:Label class="fs-6 text-danger" ID="error" runat="server" Text=""></asp:Label>
                        <asp:Label class="fs-6 text-success" ID="msg" runat="server" Text=""></asp:Label>
                        <div class="d-flex flex-sm-column flex-lg-row flex-md-row justify-content-between col-lg-12 col-md-12 col-sm-12">
                            <div class="">
                                <label for="PONO" class="form-label">Order No.</label>
                                <asp:TextBox ID="PONO" class="form-control" runat="server" disabled></asp:TextBox>
                            </div>
                            <div class="">
                                <label for="Date" class="form-label">Date</label>
                                <asp:TextBox ID="Date" class="form-control" runat="server" disabled></asp:TextBox>
                            </div>
                        </div>
                        

                        <div class="col-md-4">
                            <label for="vendor_Name" class="form-label">Vendor Name</label>
                            <asp:TextBox ID="V_name" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-4">
                            <label for="V_address" class="form-label">Vendor Address</label>
                            <asp:TextBox ID="V_address" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-2">
                            <label for="V_GST" class="form-label">Vendor GSTIN</label>
                            <asp:TextBox ID="V_GST" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-2">
                            <label for="V_contact" class="form-label">Vendor Contact No.</label>
                            <asp:TextBox ID="V_contact" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <hr />   
                        
                        
                                             
                        <div class="col-lg-3 col-md-4 col-sm-12">
                            <label for="vendor_Name" class="form-label">Product Name :</label>
                            <asp:DropDownList class="form-control" ID="Product" runat="server">
                            </asp:DropDownList>
                        </div>



                        <div class="col-lg-2 col-md-4 col-sm-12">
                            <label for="vendor_Name" class="form-label">HSN/SAC :</label>
                            <asp:TextBox class="form-control" ID="HSN" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-lg-2 col-md-4 col-sm-12">
                            <label for="vendor_Name" class="form-label">Size :</label>
                            <asp:DropDownList class="form-control" ID="size" runat="server">
                            </asp:DropDownList>
                        </div>
                        <div class="col-lg-2 col-md-4 col-sm-12">
                            <label for="vendor_Name" class="form-label">Quantity :</label>
                            <asp:TextBox class="form-control" ID="Quantity" runat="server"></asp:TextBox>
                        </div>
                        
                        <div class="col-lg-3 col-md-4 col-sm-12 d-flex justify-content-center align-items-end">
                            <asp:Button class="btn btn-primary btn-sm" ID="Add_Item" runat="server" 
                                Text="Add Item" onclick="Add_Item_Click"/>
                            
                        </div>
                        <hr />
                        <div class="col-12 d-flex justify-content-center table-responsive">
                           
                            <asp:DataList ID="DataList1" runat="server"  OnItemCommand="DataList1_ItemCommand" DataSourceID="SqlDataSource1">
                                <HeaderTemplate>
                                    <table style="width:100%;" class="table table-bordered">
                                        <thead>
                                            <tr>
                                                
                                                <th>Product Name</th>
                                                <th>HSN</th>
                                                <th>Quantity</th>
                                                <th>Size</th>
                                                <th>Unit Price</th>
                                                <th>GST</th>
                                                <th>Unit Measurement (Sq.ft)</th>
                                                <th>Unit Measure Price</th>
                                                <th>Total</th>
                                                <th>Action</th>

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
                                        <td class="p-3"><asp:Button CommandArgument='<%# Eval("prod_name") + "|" + Eval("quantity") + "|" + Eval("order_id") %>' ID="btn_del" runat="server" Text="Delete" CssClass="btn btn-sm btn-danger" CommandName="DeleteRecord" /></td>
</td>
                                    </tr>

                                    

                                </ItemTemplate>
                                <FooterTemplate>
                                        </tbody>
                                    </table>
                                </FooterTemplate>
                            </asp:DataList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:conn %>" 
                                SelectCommand="SELECT order_id, prod_name, HSN, quantity, unit_price, gst_rate, unit_measure_price, unit_measurement, size, total FROM purchase_product_details WHERE (order_id LIKE '%' + @order_id + '%')">
                                <SelectParameters>
                                    <asp:Parameter Name="order_id" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                        </div>
                        <hr />
                        <div class="col-lg-4 col-md-4 col-sm-12 text-lg-center text-md-center">
                            <label>GST Amount :</label><asp:Label ID="GST_amount" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-12 text-lg-center text-md-center">
                            <label>Total Amount :</label><asp:Label ID="Total_bill" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="col-12">
                            <asp:DropDownList class="form-control" ID="pay" runat="server">
                            </asp:DropDownList>
                        </div>
                        <div class="col-12">
                            
                            <asp:Button class="btn btn-primary btn-sm" ID="Place_Order" runat="server" 
                                Text="Place Order" onclick="Place_Order_Click"/>
                            <asp:Button class="btn btn-primary btn-sm" ID="View_Order_List" runat="server" 
                                Text="View Order List" onclick="View_Order_List_Click" />
                        </div>
                    </div>
    </div>
    
</asp:Content>

