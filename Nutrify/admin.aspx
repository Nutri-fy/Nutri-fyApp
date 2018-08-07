<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <link href="custom/font-awesome.css" rel="stylesheet" />

    <link href="custom/style.css" rel="stylesheet" />

    <div class="content-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h4 class="page-head-line">Dashboard</h4>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="alert alert-success">
                        Admin Page
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-sm-3 col-xs-6">
                    <div class="dashboard-div-wrapper bk-clr-one">
                        <i class="fa fa-bell-o dashboard-div-icon"></i>
                        <div class="progress progress-striped active">
                        </div>
                        <h5>Website Hits </h5>
                    </div>
                </div>
                <div  class="col-md-3 col-sm-3 col-xs-6">
                    <div class="dashboard-div-wrapper bk-clr-two">
                        <i class="fa fa-edit dashboard-div-icon"></i>
                        <div class="progress progress-striped active">
                        </div>
                       <h5> <a href="editUser.aspx">Edit Users </a></h5>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-6">
                    <div class="dashboard-div-wrapper bk-clr-three">
                        <i class="fa fa-cogs dashboard-div-icon"></i>
                        <div class="progress progress-striped active">
                        </div>
                        <h5>Settings </h5>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3 col-xs-6">
                    <div class="dashboard-div-wrapper bk-clr-four">
                        <i class="fa fa-bell-o dashboard-div-icon"></i>
                        <div class="progress progress-striped active">
                        </div>
                        <h5> <a href="editIngredients.aspx">Edit Ingredients </a></h5>
                    </div>
                </div>

            </div>

            <div class="row">
                <div class="col-md-6">
                    <div class="notice-board">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Active  Notice Panel 
                                <div class="pull-right">
                                    <div class="dropdown">
                                        <button class="btn btn-success dropdown-toggle btn-xs" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
                                            <span class="glyphicon glyphicon-cog"></span>
                                            <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Refresh</a></li>
                                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Logout</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-body">

                                <ul>

                                    <li>
                                        <a href="#">
                                            <span class="glyphicon glyphicon-align-left text-success"></span>
                                            Demo
                                                
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <span class="glyphicon glyphicon-info-sign text-danger"></span>
                                            Demo
                                         
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <span class="glyphicon glyphicon-comment  text-warning"></span>
                                            Demo
                                          
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <span class="glyphicon glyphicon-edit  text-danger"></span>
                                            Demo
                                          
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="panel-footer">
                                <a href="#" class="btn btn-default btn-block"><i class="glyphicon glyphicon-repeat"></i>Take to top</a>
                            </div>
                        </div>
                    </div>
                    <hr />


                    <hr />

                </div>
                <div class="col-md-6">
                    <div class="alert alert-danger">
                        Announcements
                    </div>
                    <hr />
                    <div class="Compose-Message">
                        <div class="panel panel-success">
                            <div class="panel-heading">
                                Send Message to Users
                            </div>
                            <div class="panel-body">

                                <label>Enter Recipient Name : </label>
                                <input type="text" class="form-control" />
                                <label>Enter Subject :  </label>
                                <input type="text" class="form-control" />
                                <label>Enter Message : </label>
                                <textarea rows="9" class="form-control"></textarea>
                                <hr />
                                <a href="#" class="btn btn-warning"><span class="glyphicon glyphicon-envelope"></span>Send Message </a>&nbsp;
                      <a href="#" class="btn btn-success"><span class="glyphicon glyphicon-tags"></span>Save To Drafts </a>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    &copy; Nutrify 
                </div>

            </div>
        </div>
    </footer>

    <script src="assets/js/jquery-1.11.1.js"></script>

    <script src="assets/js/bootstrap.js"></script>
</asp:Content>

