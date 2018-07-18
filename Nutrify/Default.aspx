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
            <asp:Panel ID="pnlMain" runat="server">
                <h1 id="welcomeHeading">Welcome</h1>
                <div id="divBtnLogin">
                    <label for="btnLogin">Already have an account?</label>
                    <asp:Button ID="btnLogin" class="btn btn-primary btn-lg btn-block" runat="server" Text="Login" OnClick="btnLogin_Click"/>
                </div>
                <div id="divBtnRegister">
                    <label for="btnRegister">New?</label> 
                    <asp:Button ID="btnRegister" class="btn btn-primary btn-lg btn-block" runat="server" Text="Register" OnClick="btnRegister_Click"/>   
                </div>
            </asp:Panel>
            <asp:Panel ID="pnlLogin" runat="server" BorderColor="White" Enabled="False" Visible="False">
                <div ID="loginForm" class="form-group">
                    <h1 id="loginHeading">Login</h1>
                    <div id="loginControls">
                        <label for="txtUsername">Username</label>
                        <asp:TextBox ID="txtUsername" class="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ReqName" runat="server" ControlToValidate="txtUsername" ErrorMessage="Please enter Username" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <label for="txtPassword">Password</label>
                        <asp:TextBox ID="txtPassword" TextMode="Password" class="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ReqPass" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please enter password" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:Button ID="btnLoginBack" class="btn btn-warning" runat="server" Text="Back" OnClick="btnLoginBack_Click1" CausesValidation="False" />
                        <asp:Button ID="btnLoginSubmit" class="btn btn-primary" runat="server" Text="Login" OnClick="btnLoginSubmit_Click" />
                        </div>
                    </div>
            </asp:Panel>
            <asp:Panel ID="pnlRegister" runat="server" BorderColor="White">
                <div ID="registerForm" class="form-group">
                    <h1 id="registerHeading">Register</h1>
                    <div id="registerControls" class="container">
                        <div class="row">
                            <div id="col1" class="col">
                                <label for="txtRegUsername">Username</label>
                                <asp:TextBox ID="txtRegUsername" class="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ReqRegName" runat="server" ControlToValidate="txtRegUsername" ErrorMessage="Please enter Username" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div id="col2" class="col">
                                <label for="txtEmail">Email</label>
                                <asp:TextBox ID="txtEmail" class="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ReqEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Please enter your Email" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Not a valid Email!" Font-Bold="True" Font-Italic="True" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </div>
                       </div>
                       <div class="row">
                           <div id="col3" class="col">
                               <label for="txtFirstname">First Name</label>
                                <asp:TextBox ID="txtFirstname" class="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ReqFName" runat="server" ControlToValidate="txtFirstname" EnableTheming="True" ErrorMessage="Please enter your First Name" ForeColor="Red"></asp:RequiredFieldValidator>
                           </div>
                           <div id="col4" class="col">
                               <label for="txtLastname">Last Name</label>
                                <asp:TextBox ID="txtLastname" class="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ReqLName" runat="server" ControlToValidate="txtLastname" ErrorMessage="Please enter your Last Name" ForeColor="Red"></asp:RequiredFieldValidator>                       
                           </div>
                       </div>
                       <div class="row">
                           <div id="col5"class="col">
                               <label for="txtRegPassword">Password</label>
                                <asp:TextBox ID="txtRegPassword" class="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ReqRegPass" runat="server" ControlToValidate="txtRegPassword" ErrorMessage="Please enter a Password" ForeColor="Red"></asp:RequiredFieldValidator>
                           </div>
                           <div id="col6" class="col">
                               <label for="txtRePassword">Re-enter Password</label>
                                <asp:TextBox ID="txtRePassword" class="form-control" runat="server"></asp:TextBox>
                                <asp:CompareValidator ID="compPass" runat="server" ControlToCompare="txtRegPassword" ControlToValidate="txtRePassword" ErrorMessage="Passwords must match!" Font-Bold="True" Font-Italic="True" ForeColor="#3333FF"></asp:CompareValidator>
                           </div>
                           </div>
                        <br />
                        <asp:Button ID="btnRegisterBack" class="btn btn-warning" runat="server" Text="Back" OnClick="btnRegisterBack_Click" CausesValidation="False" />
                        <asp:Button ID="btnRegisterSubmit" class="btn btn-primary" runat="server" Text="Register" OnClick="btnRegisterSubmit_Click" />
                    </div>
    
                </div>
            </asp:Panel>

        </div>
    </form>
</body>
</html>
