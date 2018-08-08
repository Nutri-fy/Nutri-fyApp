<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LoginHub.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div>
        
    <link href="custom/font-awesome.css" rel="stylesheet" />

    <link href="custom/style.css" rel="stylesheet" />

    <div class="content-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h4 class="page-head-line">Welcome Back<h4>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="alert alert-success">
                        Today is:
                         <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                <asp:ScriptManager ID="ScriptManager1" runat="server">

                </asp:ScriptManager>
                
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                     <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                        <asp:Timer ID="Timer1" runat="server" Interval="1000"></asp:Timer>
                    </ContentTemplate>
                </asp:UpdatePanel>
                    </div>
                </div>
            </div>
            <asp:Button  class="btn btn-primary" runat="server" Text="Go to your stats" OnClick="btnStat_Click"  />
    </div>


</asp:Content>

