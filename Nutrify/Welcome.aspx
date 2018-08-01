<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Welcome.aspx.cs" Inherits="Welcome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Nutrify - Hub</title>
        <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="custom/masterStyle.css" rel="stylesheet" />
</head>
<body>
    <div id="loginBanner1" class="jumbotron">
        <h1 class="display-4">Nutri-fy </h1>
        <p class="lead">Nutrition planning made simple</p>
            </div>
    <form id="form1" runat="server">
      <div id="intro">
        <div id="innerIntro">
        <h2>Welcome to Nutrify</h2>
        <br />
        <br />
        <p>
            Our goal here is to make your nutrition planning as simple as possible, while taking your lifestyle (whatever it may be) into account.
            Now you've taken the first steps so let us do the rest!
            <br />
            <br />
            <asp:Button ID="btnStart" runat="server" class="btn btn-primary" Text="Let's Get Started" OnClick="btnStart_Click"  />
        </p>
          </div>
    </div>
    </form>
</body>
</html>