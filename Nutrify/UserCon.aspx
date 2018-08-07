<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserCon.aspx.cs" Inherits="UserCon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:Label ID="lblUserName" runat="server" Text="Label"></asp:Label>
    <br />
    <div>
        <asp:Label ID="Label1" runat="server" Text="First Name"></asp:Label>
&nbsp;</div>
    <asp:TextBox ID="tbFirstName" runat="server"></asp:TextBox>

&nbsp;<br />
      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbFirstName" ErrorMessage="Please enter your First Name" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>

    <br />
    <asp:Label ID="Label2" runat="server" Text="Last Name"></asp:Label>
    <br />
    <asp:TextBox ID="tbLastName" runat="server"></asp:TextBox>

    &nbsp;<br />
    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbLastName" ErrorMessage="Please enter your Last Name" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>

    <br />
   
    <div>
        <asp:Label ID="Label3" runat="server" Text="Password"></asp:Label>
&nbsp;&nbsp; 
    &nbsp;
    </div>
    <asp:TextBox ID="tbPassword1" runat="server"></asp:TextBox>
&nbsp;<br />
      <asp:RequiredFieldValidator ID="ReqPass" runat="server" ControlToValidate="tbPassword1" ErrorMessage="Please enter password" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
      <br />
    <asp:Label ID="Label4" runat="server" Text="Re-enter Password"></asp:Label>
    <br />
    <asp:TextBox ID="tbPassword2" runat="server"></asp:TextBox>
    &nbsp;<br />
      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbPassword2" ErrorMessage="Please enter password" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
      <asp:CompareValidator ID="ComparePass" runat="server" ControlToValidate="tbPassword2" ControlToCompare="tbPassword1" ErrorMessage="Passwords do not match" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>
    <br />
    <div>
        <asp:Label ID="Label5" runat="server" Text="Email"></asp:Label>
&nbsp;&nbsp;&nbsp; 
    &nbsp;
    </div>
    <asp:TextBox ID="tbEmail" runat="server"></asp:TextBox>
    <br />
    <asp:RequiredFieldValidator ID="ReqEmail" runat="server" ControlToValidate="tbEmail" Display="Dynamic" ErrorMessage="Please enter your Email" ForeColor="Red"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="regEmail" runat="server" ControlToValidate="tbEmail" Display="Dynamic" ErrorMessage="Not a valid Email!" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"  ></asp:RegularExpressionValidator>
    <br />
    <asp:Label ID="Label6" runat="server" Text="Age"></asp:Label>
    <br />
&nbsp;<asp:TextBox ID="tbAge" runat="server"></asp:TextBox>
    &nbsp;<br />
&nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbAge" Display="Dynamic" ErrorMessage="Please enter your Age" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Button ID="btnSave" runat="server" class="btn btn-primary" OnClick="btnSave_Click" Text="Save Update" />
    <br />
    <asp:Button ID="btnCancel" runat="server" class="btn btn-primary" OnClick="btnCancel_Click" Text="Cancel" />
    
</asp:Content>

