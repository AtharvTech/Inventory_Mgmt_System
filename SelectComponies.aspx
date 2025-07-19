<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SelectComponies.aspx.cs" Inherits="SelectComponies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="height:80vh;" class="cover container fluid d-flex justify-content-center align-items-center">
        <div class="bo_x  shadow-lg d-flex justify-content-center align-items-center flex-column">
            <div id="Div1" class="w-75 d-sm-flex flex-sm-column justify-content-center align-items-center" runat="server">
            <div class="row w-100 container-fluid d-flex justify-content-center align-items-center flex-sm-column p-2">
                    

                <div class="col-lg-12 d-flex justify-content-center align-items-center">
                    <asp:DataList class="w-75 d-flex justify-content-center align-items-center" ID="DataList1" runat="server" DataSourceID="SqlDataSource2">
                        <ItemTemplate>
                            &nbsp;<asp:Label ID="company_nameLabel" runat="server" 
                                Text='<%# Eval("company_name") %>' />
                            &nbsp;&nbsp;
                            <asp:Button ID="Button2" class="btn btn-sm btn-primary" runat="server" 
                                Text="Select" onclick="Button2_Click" CommandArgument='<%# Eval("company_name") %>'  />
                            <br />
<br />
                            
                        </ItemTemplate>
                    </asp:DataList>
                    
                    
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:conn %>" 
                        SelectCommand="SELECT [company_name] FROM [Companies]"></asp:SqlDataSource>
                    
                    
                    
                    
                    
                </div>
                

                
                <div class="col-6 col-sm-12 d-flex justify-content-center align-items-center w-75">
                    
                    <asp:Button class="btn shadow btn-sm btn-primary" ID="Create_Com" runat="server" 
                        Text="Create a Company" onclick="Create_Com_Click" />
                        <asp:Label ID="user_logged" runat="server" class="d-none" Text=""></asp:Label>
                </div>
            </div>
            
           </div>  
        </div>
    </div>
</asp:Content>

