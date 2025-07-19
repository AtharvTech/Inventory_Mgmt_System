<%@ Page Title="" Language="C#" MasterPageFile="~/in_master.master" AutoEventWireup="true" CodeFile="pay_mod.aspx.cs" Inherits="pay_mod" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style= "height:;" class="C container-fluid my-3 d-flex flex-column justify-content-center align-items-center">
        <asp:Label ID="error" CssClass="fs-5 text-success" runat="server" Text=""></asp:Label>

                        
                        
                        
                        
                        <div class="col-lg-6 col-md-12 col-sm-12 mb-2">
                            <label for="Pay Mode" class="form-label">Payment Mode</label>
                            <asp:TextBox ID="payment" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-lg-6 col-md-12 col-sm-12 mb-2">
                            <label for="Pay des" class="form-label">Description</label>
                            <asp:TextBox ID="des" class="form-control" runat="server"></asp:TextBox>
                        </div>

                        <div class="col-lg-6 col-md-12 col-sm-12 d-flex justify-content-center g-2 my-4">
                            <asp:Button class="me-3 btn btn-sm btn-primary" ID="Save_Changes" runat="server" 
                                Text="Save Changes" onclick="Save_Changes_Click"/>
                            <asp:Button class="btn btn-sm btn-secondary" ID="Back" runat="server" 
                                Text="Back" onclick="Back_Click"/>
                        </div>
            
        
    </div>
</asp:Content>

