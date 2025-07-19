<%@ Page Title="" Language="C#" MasterPageFile="~/in_master.master" AutoEventWireup="true" CodeFile="bill.aspx.cs" Inherits="bill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid d-flex justify-content-center align-items-center flex-column w-50 my-3">
    

   
    <table class="table table-bordered text-center">
        
        <tbody>
            <tr>
                <td>Invoice No.</td>
                <td><asp:Label ID="lblOrderNo" runat="server" Text="" /></td>
            </tr>
            <tr>
                <td>Invoice Date</td>
                <td><asp:Label ID="lblOrderDate" runat="server" Text="" /></td>
            </tr>
            <tr>
                <td>Customer Name</td>
                <td><asp:Label ID="lblCustomerName" runat="server" Text="" /></td>
            </tr>
            <tr>
                <td>Total Amount</td>
                <td><asp:Label ID="lblTotalAmount" runat="server" Text="" /></td>
            </tr>
        </tbody>
    </table>

        <asp:Button ID="Button1" CssClass="btn btn-sm btn-secondary" runat="server" Text="Back" onclick="Button1_Click" />


    </div>

   

    

</asp:Content>

