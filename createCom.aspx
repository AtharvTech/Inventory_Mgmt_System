<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="createCom.aspx.cs" Inherits="createCom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="height:80vh;" class="cover container fluid d-flex justify-content-center align-items-center">
        <div class="rc_box shadow-lg bo_x d-flex justify-content-center align-items-center flex-column">
            <h2 class="mb-5 text-center">Register Your Company</h2>
            <div id="Div1"  class="rc_form_box container-fluid d-sm-flex flex-sm-column justify-content-center align-items-center" runat="server">
                <div class="rc_form p-2 d-flex justify-content-center align-items-center row g-3">

                        <div class="col-12">
                            <label for="Company_Name" class="form-label">Company Name</label>
                            <asp:TextBox ID="C_name" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-12">
                            <label for="com_Email" class="form-label">Email</label>
                            <asp:TextBox ID="com_email" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-12">
                            <label for="com_address" class="form-label">Address</label>
                            <asp:TextBox ID="com_address" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-12 d-flex flex-column justify-content-center align-items-center">
                            <asp:Button ID="saveCompany" class="w-100 btn shadow btn-sm btn-primary" 
                                    runat="server" Text="Create" onclick="saveCompany_Click"/>
                                    <asp:Label CssClass="text-danger my-2" ID="error" runat="server" Text=""></asp:Label>
                        </div>
                        
                        
                </div>
            </div>
          
        </div>
    </div>
</asp:Content>

