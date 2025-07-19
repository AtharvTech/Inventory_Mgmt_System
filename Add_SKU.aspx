<%@ Page Title="" Language="C#" MasterPageFile="~/in_master.master" AutoEventWireup="true" CodeFile="Add_SKU.aspx.cs" Inherits="Add_SKU" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid col-lg-7 col-md-9 col-sm-11 p-2">
        <div class="col-md-12 mb-2">
        <label for="c_contact" class="form-label">SKU</label>
        <asp:TextBox ID="SKU_name" class="form-control" runat="server"></asp:TextBox>
    </div>
    <div class="col-md-12 mb-2">
        <label for="c_contact" class="form-label">Discription</label>
        <asp:TextBox ID="SKU_des" class="form-control" runat="server"></asp:TextBox>
    </div>
    <div class="col-md-6 col-lg-12 d-flex flex-column justify-content-center align-items-center">
        <div class="container-fluid d-flex justify-content-center align-items-center">
            <asp:Button class="btn btn-sm btn-primary me-2" ID="Save_SKU" runat="server" 
            Text="Save SKU" onclick="Save_SKU_Click" />
            <asp:Button class="btn btn-sm btn-secondary" ID="back" runat="server" 
                Text="Back" onclick="back_Click" />
        
        </div>
        <asp:Label class="fs-5 text-danger my-2" ID="error" runat="server" Text=""></asp:Label>
        <asp:Label class="fs-5 text-success my-2" ID="msg" runat="server" Text=""></asp:Label>
        
    </div>
    </div>
</asp:Content>

