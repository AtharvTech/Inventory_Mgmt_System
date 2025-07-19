<%@ Page Title="" Language="C#" MasterPageFile="~/Dashbo.master" AutoEventWireup="true" CodeFile="Users.aspx.cs" Inherits="Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style= "height:;" class="C container-fluid d-flex flex-column justify-content-center align-items-center">
       
       <asp:Label ID="Wrong_log_in" Class="text-danger fs-4" runat="server" Text=""/>

        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
            <HeaderTemplate>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>User ID</th>
                            <th>Name</th>
                            <th>Phone No.</th>
                            <th>Email</th>
                            <th>DOJ</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                    
            </HeaderTemplate>
            <ItemTemplate>
                
                <tr>
                    <td><asp:Label ID="u_idLabel" runat="server" Text='<%# Eval("u_id") %>' /></td>
                    <td><asp:Label ID="f_nameLabel" runat="server" Text='<%# Eval("f_name") %>'/><asp:Label ID="Label1" runat="server" Text= '<%# Eval("l_name") %>' /></td>
                    <td><asp:Label ID="p_noLabel" runat="server" Text='<%# Eval("p_no") %>' /></td>
                    <td><asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' /></td>
                    <td><asp:Label ID="dojLabel" runat="server" Text='<%# Eval("doj") %>' /></td>
                </tr>
                
                
            </ItemTemplate>
            <FooterTemplate>
            </tbody>
                </table>
            </FooterTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:conn %>" 
            SelectCommand="SELECT [u_id], [f_name], [l_name], [p_no], [email], [doj] FROM [user_registration]">
        </asp:SqlDataSource>
       
    </div>
</asp:Content>

