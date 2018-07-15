<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <div class="jumbotron">
        <h1 class="display-4">Nutri-fy</h1>
         <p class="lead">Nutrition planning made simple again</p>
    </div>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="pnlMain" runat="server" BorderColor="White">
                <label for="btnLogin">Already have an account?</label>
                <asp:Button ID="btnLogin" class="btn btn-primary btn-lg btn-block" runat="server" Text="Login" OnClick="btnLogin_Click"/>
                <br />
                <label for="btnRegister">New? How about registering?</label> 
                <asp:Button ID="btnRegister" class="btn btn-primary btn-lg btn-block" runat="server" Text="Register"/>      
            </asp:Panel>
            <asp:Panel ID="pnlLogin" runat="server" BorderColor="White" Enabled="False" Visible="False">
                <div class="form-group">
                    <label for="txtUsername">Username</label>
                    <asp:TextBox ID="txtUsername" class="form-control" runat="server"></asp:TextBox>
                    <br />
                    <label for="txtPassword">Password</label>
                    <asp:TextBox ID="txtPassword" class="form-control" runat="server"></asp:TextBox>
                    <asp:Button ID="btnLoginSubmit" class="btn btn-primary" runat="server" Text="Submit" />
                </div>
            </asp:Panel>
            <asp:Panel ID="pnlRegister" runat="server" BorderColor="White">
                
            </asp:Panel>

        </div>
    </form>
</body>
</html>
