<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="C container-fluid d-flex flex-column justify-content-center align-items-center">
        <div class="J shadow-lg container-fluid border m-2 d-flex flex-column justify-content-center align-items-center ">
           <div class="mb-3">
                <h1>Sign Up</h1>
           </div>
           <div class="car_d border d-flex flex-column justify-content-center align-items-center p-2 bg-opacity-10 bg-black">
               
                
                    <div class="row">
                        <div class="col-sm-12 col-lg-6 col-md-12 mb-sm-2 mb-md-2 mb-lg-2">
                            <label for="f_name" class="form-label">First Name</label>
                            <asp:TextBox ID="f_name" runat="server" class="form-control"></asp:TextBox>
                            
                        </div>
                        <div class="col-sm-12 col-lg-6 col-md-12 mb-sm-2 mb-md-2 mb-lg-2">
                            <label for="l_name" class="form-label">Last Name</label>
                            <asp:TextBox ID="l_name" runat="server" class="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-12 col-lg-6 col-md-12 mb-sm-2 mb-md-2 mb-lg-2">
                            <label for="email" class="form-label">Email</label>
                            <asp:TextBox ID="email" runat="server" class="form-control"></asp:TextBox>

                        </div>
                        <div class="col-sm-12 col-lg-6 col-md-12 mb-sm-2 mb-md-2 mb-lg-2">
                            <label for="p_no" class="form-label">Mobile Number</label>
                            <asp:TextBox ID="p_no" runat="server" class="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-12 col-lg-6 col-md-12 mb-sm-2 mb-md-2 mb-lg-2">
                            <label for="password" class="form-label">Password</label>
                            <asp:TextBox ID="password" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
                           
                        </div>
                        <div class="col mb-sm-3 mb-md-3 mb-lg-4">
                            <label for="c_password" class="form-label">Confirm Password</label>
                            <asp:TextBox ID="c_password" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col d-flex flex-column justify-content-center align-items-center">
                            <asp:Button class="btn btn-primary form-control" ID="signupbtn" runat="server" 
                                Text="Sign Up" onclick="signupbtn_Click"/>
                            
                        </div>
                    </div>
               


            </div>
            <asp:Label CssClass="text-danger" ID="Error" runat="server" Text=""></asp:Label>
        </div> 
    </div>
</asp:Content>

