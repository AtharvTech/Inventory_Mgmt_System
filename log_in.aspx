<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="log_in.aspx.cs" Inherits="log_in" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style= "height:80vh;" class="C container-fluid d-flex flex-column justify-content-center align-items-center">
            <div class="J shadow-lg container-fluid border m-5 d-flex flex-column justify-content-center align-items-center">
                <div class="mb-2">
                    <h1>Welcome Back!</h1>
                </div>
                <div class="card-fluid d-flex flex-column justify-content-center align-items-center p-2 bg-opacity-10 bg-black" style="width: ;">
                       <%-- <h3>User Log In</h3>--%>
                    <div id="Div1" runat="server" class="p-3 justify-content-evenly align-items-center d-flex flex-column align-items-center">
                        <div class="row mb-2">
                            <lable class="form-label">Username</label>
                            <asp:TextBox class="form-control form-control-md" ID="uid" runat="server"></asp:TextBox>
                        </div>
                        <div class="row mb-2">
                            <lable class="form-label">Password</label>
                            <asp:TextBox class="form-control form-control-md" ID="pass" runat="server" TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="row d-flex justify-content-between align-items-center flex-column mb-2 w-100">
                            <asp:Button ID="logIn" class="btn btn-primary text-center mb-2" runat="server" 
                                Text="Log In" onclick="logIn_Click"/>
                            <asp:Button ID="signUp" class="btn btn-primary" runat="server" 
                            Text="Sign Up" onclick="signUp_Click" />
                        </div>
                        <asp:Label CssClass="text-danger" ID="error" runat="server" Text=""></asp:Label>   
                        
                    </div>
                </div>
            </div> 
    </div>
</asp:Content>

