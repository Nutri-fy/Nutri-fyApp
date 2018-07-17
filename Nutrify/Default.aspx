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
                    <asp:RequiredFieldValidator ID="ReqName" runat="server" ControlToValidate="txtUsername" ErrorMessage="Please enter Username" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <label for="txtPassword">Password</label>
                    <asp:TextBox ID="txtPassword" TextMode="Password" class="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ReqPass" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please enter password" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Button ID="btnLoginSubmit" class="btn btn-primary" runat="server" Text="Login" OnClick="btnLoginSubmit_Click" />
                </div>
            </asp:Panel>
            <asp:Panel ID="pnlRegister" runat="server" BorderColor="White">
                <asp:Button ID="btnRegisterBack" class="btn btn-primary" runat="server" Text="Back" OnClick="btnRegisterBack_Click" />
                <div ID="registerForm" class="form-group">
                    <label for="txtRegUsername">Username</label>
                    <asp:TextBox ID="txtRegUsername" class="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ReqRegName" runat="server" ControlToValidate="txtRegUsername" ErrorMessage="Please enter Username" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <label for="txtFirstname">First Name</label>
                    <asp:TextBox ID="txtFirstname" class="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ReqFName" runat="server" ControlToValidate="txtFirstname" EnableTheming="True" ErrorMessage="Please enter your first name" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                     <label for="txtLastname">Last Name</label>
                    <asp:TextBox ID="txtLastname" class="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ReqLName" runat="server" ControlToValidate="txtLastname" ErrorMessage="Please enter your last name" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                     <label for="txtEmail">Email</label>
                    <asp:TextBox ID="txtEmail" class="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ReqEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Please enter your Email" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Not a valid Email!" Font-Bold="True" Font-Italic="True" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    <br />
                     <label for="txtRegPassword">Password</label>
                    <asp:TextBox ID="txtRegPassword" class="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ReqRegPass" runat="server" ControlToValidate="txtRegPassword" ErrorMessage="Please enter a password" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                     <label for="txtRePassword">Re-enter Password</label>
                    <asp:TextBox ID="txtRePassword" class="form-control" runat="server"></asp:TextBox>
                    <asp:CompareValidator ID="compPass" runat="server" ControlToCompare="txtRegPassword" ControlToValidate="txtRePassword" ErrorMessage="Passwords must match!" Font-Bold="True" Font-Italic="True" ForeColor="#3333FF"></asp:CompareValidator>
                    <br />
                    <asp:Button ID="btnRegisterSubmit" class="btn btn-primary" runat="server" Text="Register" OnClick="btnRegisterSubmit_Click" />
                </div>
            </asp:Panel>

        </div>
    </form>
</body>
</html>
