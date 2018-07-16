<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="custom/custom.css" rel="stylesheet" />
</head>
<body>
    <div ID="loginBanner" class="jumbotron">
        <h1 class="display-4">Nutri-fy</h1>
         <p class="lead">Nutrition planning made simple again</p>
    </div>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="pnlMain" runat="server" BorderColor="White">
                <label for="btnLogin">Already have an account?</label>
                <asp:Button ID="btnLogin" class="btn btn-primary btn-lg btn-block" runat="server" Text="Login" OnClick="btnLogin_Click"/>
                <br />
                <label for="btnRegister">New?</label> 
                <asp:Button ID="btnRegister" class="btn btn-primary btn-lg btn-block" runat="server" Text="Register" OnClick="btnRegister_Click"/>      
            </asp:Panel>
            <asp:Panel ID="pnlLogin" runat="server" BorderColor="White" Enabled="False" Visible="False">
                <asp:Button ID="btnLoginBack" class="btn btn-primary" runat="server" Text="Back" OnClick="btnLoginBack_Click1" />
                <div ID="loginForm" class="form-group">
                    <label for="txtUsername">Username</label>
                    <asp:TextBox ID="txtUsername" class="form-control" runat="server"></asp:TextBox>
                    <br />
                    <label for="txtPassword">Password</label>
                    <asp:TextBox ID="txtPassword" TextMode="Password" class="form-control" runat="server"></asp:TextBox>
                    <br />
                    <asp:Button ID="btnLoginSubmit" class="btn btn-primary" runat="server" Text="Login" OnClick="btnLoginSubmit_Click" />
                </div>
            </asp:Panel>
            <asp:Panel ID="pnlRegister" runat="server" BorderColor="White">
                <asp:Button ID="btnRegisterBack" class="btn btn-primary" runat="server" Text="Back" OnClick="btnRegisterBack_Click" />
                <div ID="registerForm" class="form-group">
                    <label for="txtRegUsername">Username</label>
                    <asp:TextBox ID="txtRegUsername" class="form-control" runat="server"></asp:TextBox>
                    <br />
                    <label for="txtFirstname">First Name</label>
                    <asp:TextBox ID="txtFirstname" class="form-control" runat="server"></asp:TextBox>
                    <br />
                     <label for="txtLastname">Last Name</label>
                    <asp:TextBox ID="txtLastname" class="form-control" runat="server"></asp:TextBox>
                    <br />
                     <label for="txtEmail">Email</label>
                    <asp:TextBox ID="txtEmail" class="form-control" runat="server"></asp:TextBox>
                    <br />
                     <label for="txtRegPassword">Password</label>
                    <asp:TextBox ID="txtRegPassword" class="form-control" runat="server"></asp:TextBox>
                    <br />
                     <label for="txtRePassword">Re-enter Password</label>
                    <asp:TextBox ID="txtRePassword" class="form-control" runat="server"></asp:TextBox>
                    <br />
                    <asp:Button ID="btnRegisterSubmit" class="btn btn-primary" runat="server" Text="Register" OnClick="btnRegisterSubmit_Click" />
                </div>
            </asp:Panel>

        </div>
    </form>
</body>
</html>
