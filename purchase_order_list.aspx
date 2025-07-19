<%@ Page Title="" Language="C#" MasterPageFile="~/in_master.master" AutoEventWireup="true" CodeFile="purchase_order_list.aspx.cs" Inherits="purchase_order_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style= "height:;" class="C container-fluid d-flex flex-column justify-content-center align-items-center">
        <div id="Form1" class="scrollable-div h-100 w-100 border" runat="server">
  
            <div class="container-fluid col-10 d-flex flex-column justify-content-between align-items-center my-2">
                <div class="container-fluid d-flex flex-row justify-content-between align-items-center mb-2">
                    <asp:TextBox ID="find_P_invoice" placeholder="Search Invoice No" runat="server" class="form-control me-3"></asp:TextBox>
                
                <asp:Button class="btn btn-outline-success btn-sm me-3" ID="search" 
                    runat="server" Text="Search" onclick="search_Click" ></asp:Button>
                <asp:Button class="btn btn-secondary btn-sm" ID="Button1" runat="server" 
                    Text="Back" onclick="Button1_Click"></asp:Button>
                </div>        

               


        <div class="container-fluid d-flex justify-content-center align-items-center">
    <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource1">
        <HeaderTemplate>
            <table class="table text-center table-bordered">
                <thead>
                    <tr>
                        <th>Order No</th>
                        <th>Date</th>
                        <th>Vendor Name</th>
                        <th>Total Amt</th>
                        <th>Payment Mode</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
        </HeaderTemplate>

        <ItemTemplate>
            <tr>
                <td><asp:Label ID="order_noLabel" runat="server" Text='<%# Eval("order_no") %>' /></td>
                <td><asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' /></td>
                <td><asp:Label ID="vendor_nameLabel" runat="server" Text='<%# Eval("vendor_name") %>' /></td>
                <td><asp:Label ID="Total_amtLabel" runat="server" Text='<%# Eval("Total_amt") %>' /></td>
                <td><asp:Label ID="payment_modeLabel" runat="server" Text='<%# Eval("payment_mode") %>' /></td>
                <td><asp:Button ID="view_purchase_bill" class="btn btn-sm btn-primary" 
                        runat="server" Text="View" onclick="view_purchase_bill_Click" CommandArgument='<%# Eval("order_no") %>' /></td>
            </tr>
            
        </ItemTemplate>

        <FooterTemplate>
                </tbody>
            </table>
        </FooterTemplate>
    </asp:DataList>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:conn %>" 
        SelectCommand="SELECT [order_no], [date], [vendor_name], [Total_amt], [payment_mode] FROM [purchase_order_details]">
    </asp:SqlDataSource>
</div>


        <div class="container-fluid">
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
                <%--<ItemTemplate>
                    Order No:
                    <asp:Label ID="order_noLabel" runat="server" Text='<%# Eval("order_no") %>' />
                    <br />
                    Date:
                    <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
                    <br />
                    Vendor Name:
                    <asp:Label ID="vendor_nameLabel" runat="server" 
                        Text='<%# Eval("vendor_name") %>' />
                    <br />
                    Total Amt:
                    <asp:Label ID="Total_amtLabel" runat="server" Text='<%# Eval("Total_amt") %>' />
                    <br />
                    Payment Mode:
                    <asp:Label ID="payment_modeLabel" runat="server" 
                        Text='<%# Eval("payment_mode") %>' />
                    <br />
<br />
                </ItemTemplate>--%>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:conn %>" 
                SelectCommand="SELECT [order_no], [date], [vendor_name], [Total_amt], [payment_mode] FROM [purchase_order_details]">
            </asp:SqlDataSource>
        </div>


        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-xl">
            <div class="modal-content">
              <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">KP-2501-001</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <div class="p-2 d-flex flex-column row g-3">
                    <div class="container-fluid d-flex justify-content-between">
                        <div class="col-5">
                            <label class="fs-3 mb-2">From</label>
                            <h4>Kartik Plys</h4>
                            <p class="d-inline">KP@gmail.com</p>
                            <p class="d-inline">1234567890</p>
                            <p>Madhavnagar, Sangli</p>
                            <p class="fs-6">Requsted By : <lable class="fs-6">Atharv Raut</lable> </p>
                        </div>
                        <div class="col-5 text-end">
                            <label class="fs-3 mb-2">To</label>
                            <h4>Vision Tec Pvt Ltd.</h4>
                            <p class="d-inline">VT@gmail.com</p>
                            <p class="d-inline">1234567890</p>
                            <p>Kupwad, Sangli</p>
                            <p class="fs-6">Date : 
                                <asp:Label ID="date" class="fs-6" runat="server" Text="Label"></asp:Label>
                             </p>

                        </div>
                    </div>
                    <hr />
                    <div class="container-fluid">
                        <table class="table border-dark">
                            <tr>
                                <td class="border border-dark text-center col-1"><p>Sr. No</p></td>
                                <td class="border border-dark text-center col-1"><p>Item</p></td>
                                <td class="border border-dark text-center col-1"><p>HSN/SAC</p></td>
                                <td class="border border-dark text-center col-1"><p>Quantity</p></td>
                                <td class="border border-dark text-center col-1"><p>Unit Price</p></td>
                                <td class="border border-dark text-center col-1"><p>GST Rate</p></td>
                                <td class="border border-dark text-center col-1"><p>Total</p></td>
                            </tr>
                            <tr>
                                <td class="border border-dark text-center col-1">1.</td>
                                <td class="border border-dark text-center col-1"><p>Mouse</p></td>
                                <td class="border border-dark text-center col-1"><p></p></td>
                                <td class="border border-dark text-center col-1"><p>50</p></td>
                                <td class="border border-dark text-center col-1"><p>230</p></td>
                                <td class="border border-dark text-center col-1"><p>18%</p></td>
                                <td class="border border-dark text-center col-1"><p>11500</p></td>
                            </tr>
                             <tr>
                                <td class="border border-dark text-center col-1">1.</td>
                                <td class="border border-dark text-center col-1"><p>Mouse Pad</p></td>
                                <td class="border border-dark text-center col-1"><p></p></td>
                                <td class="border border-dark text-center col-1"><p>50</p></td>
                                <td class="border border-dark text-center col-1"><p>230</p></td>
                                <td class="border border-dark text-center col-1"><p>18%</p></td>
                                <td class="border border-dark text-center col-1"><p>11500</p></td>
                            </tr>   
                             <tr>   
                                <td class="border border-dark text-center col-1">1.</td>
                                <td class="border border-dark text-center col-1"><p>Ant ESport Keyboard</p></td>
                                <td class="border border-dark text-center col-1"><p></p></td>
                                <td class="border border-dark text-center col-1"><p>5000</p></td>
                                <td class="border border-dark text-center col-1"><p>1230</p></td>
                                <td class="border border-dark text-center col-1"><p>18%</p></td>
                                <td class="border border-dark text-center col-1"><p>1981500</p></td>
                            </tr>   
                             <tr>   
                                <td class="border border-dark text-center col-1">1.</td>
                                <td class="border border-dark text-center col-1"><p>Samsung Monitor 24" Samsung Monitor 24"</p></td>
                                <td class="border border-dark text-center col-1"><p></p></td>
                                <td class="border border-dark text-center col-1"><p>50</p></td>
                                <td class="border border-dark text-center col-1"><p>230</p></td>
                                <td class="border border-dark text-center col-1"><p>18%</p></td>
                                <td class="border border-dark text-center col-1"><p>11500</p></td>
                            </tr>   
                            <tr>   
                                <td class="border border-dark text-center col-1">1.</td>
                                <td class="border border-dark text-center col-1"><p>Mouse</p></td>
                                <td class="border border-dark text-center col-1"><p></p></td>
                                <td class="border border-dark text-center col-1"><p>50</p></td>
                                <td class="border border-dark text-center col-1"><p>230</p></td>
                                <td class="border border-dark text-center col-1"><p>18%</p></td>
                                <td class="border border-dark text-center col-1"><p>11500</p></td>
                            </tr>
                            <tr>   
                                <td class="border border-dark text-center col-1">1.</td>
                                <td class="border border-dark text-center col-1"><p>Mouse</p></td>
                                <td class="border border-dark text-center col-1"><p></p></td>
                                <td class="border border-dark text-center col-1"><p>50</p></td>
                                <td class="border border-dark text-center col-1"><p>230</p></td>
                                <td class="border border-dark text-center col-1"><p>18%</p></td>
                                <td class="border border-dark text-center col-1"><p>11500</p></td>
                            </tr>
                            <tr>
                                <td class="border border-dark text-center col-1" colspan="5"></td>
                                <td class="border border-dark text-center col-1"><p>Total</p></td>
                                <td class="border border-dark text-center col-1"><p>Rs. <label>656464</label></p></td>
                            </tr>
                            <tr>
                                <td class="border border-dark text-center col-1" colspan="5"></td>
                                <td class="border border-dark text-center col-1"><p>GST Total</p></td>
                                <td class="border border-dark text-center col-1"><p>Rs. <label>656464</label></p></td>
                            </tr>
                        </table>
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

