<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="editUser.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

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
                        Edit Users
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
                <div class="col-md-3 col-sm-3 col-xs-6">
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

            <div id="containerGridUsers" runat="server">
            <asp:GridView ID="GridViewUsers1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="userID" DataSourceID="admin">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="userID" HeaderText="userID" InsertVisible="False" ReadOnly="True" SortExpression="userID" />
                    <asp:BoundField DataField="userName" HeaderText="userName" SortExpression="userName" />
                    <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                    <asp:BoundField DataField="firstName" HeaderText="firstName" SortExpression="firstName" />
                    <asp:BoundField DataField="lastName" HeaderText="lastName" SortExpression="lastName" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                    <asp:BoundField DataField="isAdmin" HeaderText="isAdmin" SortExpression="isAdmin" />
                    <asp:BoundField DataField="age" HeaderText="age" SortExpression="age" />
                    <asp:BoundField DataField="gender" HeaderText="gender" SortExpression="gender" />
                    <asp:BoundField DataField="height" HeaderText="height" SortExpression="height" />
                    <asp:BoundField DataField="weight" HeaderText="weight" SortExpression="weight" />
                    <asp:BoundField DataField="activity" HeaderText="activity" SortExpression="activity" />
                    <asp:BoundField DataField="calories" HeaderText="calories" SortExpression="calories" />
                    <asp:BoundField DataField="numOfMeals" HeaderText="numOfMeals" SortExpression="numOfMeals" />
                    <asp:BoundField DataField="goal" HeaderText="goal" SortExpression="goal" />
                </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />
            </asp:GridView>
            <asp:SqlDataSource ID="admin" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Nutri-fyConnectionString %>" DeleteCommand="DELETE FROM [UserInfo] WHERE [userID] = @original_userID AND [userName] = @original_userName AND [password] = @original_password AND (([firstName] = @original_firstName) OR ([firstName] IS NULL AND @original_firstName IS NULL)) AND (([lastName] = @original_lastName) OR ([lastName] IS NULL AND @original_lastName IS NULL)) AND [email] = @original_email AND (([isAdmin] = @original_isAdmin) OR ([isAdmin] IS NULL AND @original_isAdmin IS NULL)) AND (([age] = @original_age) OR ([age] IS NULL AND @original_age IS NULL)) AND (([gender] = @original_gender) OR ([gender] IS NULL AND @original_gender IS NULL)) AND (([height] = @original_height) OR ([height] IS NULL AND @original_height IS NULL)) AND (([weight] = @original_weight) OR ([weight] IS NULL AND @original_weight IS NULL)) AND (([activity] = @original_activity) OR ([activity] IS NULL AND @original_activity IS NULL)) AND (([calories] = @original_calories) OR ([calories] IS NULL AND @original_calories IS NULL)) AND (([numOfMeals] = @original_numOfMeals) OR ([numOfMeals] IS NULL AND @original_numOfMeals IS NULL)) AND (([goal] = @original_goal) OR ([goal] IS NULL AND @original_goal IS NULL))" InsertCommand="INSERT INTO [UserInfo] ([userName], [password], [firstName], [lastName], [email], [isAdmin], [age], [gender], [height], [weight], [activity], [calories], [numOfMeals], [goal]) VALUES (@userName, @password, @firstName, @lastName, @email, @isAdmin, @age, @gender, @height, @weight, @activity, @calories, @numOfMeals, @goal)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [userID], [userName], [password], [firstName], [lastName], [email], [isAdmin], [age], [gender], [height], [weight], [activity], [calories], [numOfMeals], [goal] FROM [UserInfo]" UpdateCommand="UPDATE [UserInfo] SET [userName] = @userName, [password] = @password, [firstName] = @firstName, [lastName] = @lastName, [email] = @email, [isAdmin] = @isAdmin, [age] = @age, [gender] = @gender, [height] = @height, [weight] = @weight, [activity] = @activity, [calories] = @calories, [numOfMeals] = @numOfMeals, [goal] = @goal WHERE [userID] = @original_userID AND [userName] = @original_userName AND [password] = @original_password AND (([firstName] = @original_firstName) OR ([firstName] IS NULL AND @original_firstName IS NULL)) AND (([lastName] = @original_lastName) OR ([lastName] IS NULL AND @original_lastName IS NULL)) AND [email] = @original_email AND (([isAdmin] = @original_isAdmin) OR ([isAdmin] IS NULL AND @original_isAdmin IS NULL)) AND (([age] = @original_age) OR ([age] IS NULL AND @original_age IS NULL)) AND (([gender] = @original_gender) OR ([gender] IS NULL AND @original_gender IS NULL)) AND (([height] = @original_height) OR ([height] IS NULL AND @original_height IS NULL)) AND (([weight] = @original_weight) OR ([weight] IS NULL AND @original_weight IS NULL)) AND (([activity] = @original_activity) OR ([activity] IS NULL AND @original_activity IS NULL)) AND (([calories] = @original_calories) OR ([calories] IS NULL AND @original_calories IS NULL)) AND (([numOfMeals] = @original_numOfMeals) OR ([numOfMeals] IS NULL AND @original_numOfMeals IS NULL)) AND (([goal] = @original_goal) OR ([goal] IS NULL AND @original_goal IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_userID" Type="Int32" />
                    <asp:Parameter Name="original_userName" Type="String" />
                    <asp:Parameter Name="original_password" Type="String" />
                    <asp:Parameter Name="original_firstName" Type="String" />
                    <asp:Parameter Name="original_lastName" Type="String" />
                    <asp:Parameter Name="original_email" Type="String" />
                    <asp:Parameter Name="original_isAdmin" Type="Int32" />
                    <asp:Parameter Name="original_age" Type="Int32" />
                    <asp:Parameter Name="original_gender" Type="Int32" />
                    <asp:Parameter Name="original_height" Type="Int32" />
                    <asp:Parameter Name="original_weight" Type="Decimal" />
                    <asp:Parameter Name="original_activity" Type="Decimal" />
                    <asp:Parameter Name="original_calories" Type="Decimal" />
                    <asp:Parameter Name="original_numOfMeals" Type="Int32" />
                    <asp:Parameter Name="original_goal" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="userName" Type="String" />
                    <asp:Parameter Name="password" Type="String" />
                    <asp:Parameter Name="firstName" Type="String" />
                    <asp:Parameter Name="lastName" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="isAdmin" Type="Int32" />
                    <asp:Parameter Name="age" Type="Int32" />
                    <asp:Parameter Name="gender" Type="Int32" />
                    <asp:Parameter Name="height" Type="Int32" />
                    <asp:Parameter Name="weight" Type="Decimal" />
                    <asp:Parameter Name="activity" Type="Decimal" />
                    <asp:Parameter Name="calories" Type="Decimal" />
                    <asp:Parameter Name="numOfMeals" Type="Int32" />
                    <asp:Parameter Name="goal" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="userName" Type="String" />
                    <asp:Parameter Name="password" Type="String" />
                    <asp:Parameter Name="firstName" Type="String" />
                    <asp:Parameter Name="lastName" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="isAdmin" Type="Int32" />
                    <asp:Parameter Name="age" Type="Int32" />
                    <asp:Parameter Name="gender" Type="Int32" />
                    <asp:Parameter Name="height" Type="Int32" />
                    <asp:Parameter Name="weight" Type="Decimal" />
                    <asp:Parameter Name="activity" Type="Decimal" />
                    <asp:Parameter Name="calories" Type="Decimal" />
                    <asp:Parameter Name="numOfMeals" Type="Int32" />
                    <asp:Parameter Name="goal" Type="Int32" />
                    <asp:Parameter Name="original_userID" Type="Int32" />
                    <asp:Parameter Name="original_userName" Type="String" />
                    <asp:Parameter Name="original_password" Type="String" />
                    <asp:Parameter Name="original_firstName" Type="String" />
                    <asp:Parameter Name="original_lastName" Type="String" />
                    <asp:Parameter Name="original_email" Type="String" />
                    <asp:Parameter Name="original_isAdmin" Type="Int32" />
                    <asp:Parameter Name="original_age" Type="Int32" />
                    <asp:Parameter Name="original_gender" Type="Int32" />
                    <asp:Parameter Name="original_height" Type="Int32" />
                    <asp:Parameter Name="original_weight" Type="Decimal" />
                    <asp:Parameter Name="original_activity" Type="Decimal" />
                    <asp:Parameter Name="original_calories" Type="Decimal" />
                    <asp:Parameter Name="original_numOfMeals" Type="Int32" />
                    <asp:Parameter Name="original_goal" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
                </div>

     </div>
     <br />
</asp:Content>

