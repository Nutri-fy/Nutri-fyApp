<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Account.aspx.cs" Inherits="Account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="gridViewContainer">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="userID">
        <Columns>
            <asp:BoundField DataField="userName" HeaderText="Username" ReadOnly="True" SortExpression="userName" />
            <asp:BoundField DataField="password" HeaderText="Password" SortExpression="password" />
            <asp:BoundField DataField="firstName" HeaderText="Firstname" SortExpression="firstName" />
            <asp:BoundField DataField="lastName" HeaderText="Lastname" SortExpression="lastName" />
            <asp:BoundField DataField="email" HeaderText="E-mail" SortExpression="email" />
            <asp:BoundField DataField="age" HeaderText="Age" SortExpression="age" />
            <asp:BoundField DataField="height" HeaderText="Height (cm)" SortExpression="height" />
            <asp:BoundField DataField="weight" HeaderText="Weight (kg)" SortExpression="weight" />
            <asp:BoundField DataField="calories" HeaderText="Calories" SortExpression="calories" />
            <asp:BoundField DataField="numOfMeals" HeaderText="Meals/Day" SortExpression="numOfMeals" />
            <asp:BoundField DataField="userID" HeaderText="userID" InsertVisible="False" ReadOnly="True" SortExpression="userID" Visible="False" />
            <asp:CommandField ShowEditButton="True" />
        </Columns>
    </asp:GridView>
        </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Nutri-fyConnectionString %>" SelectCommand="SELECT [userName], [password], [firstName], [lastName], [email], [age], [height], [weight], [calories], [numOfMeals], [userID] FROM [UserInfo] WHERE ([userID] = @userID)" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [UserInfo] WHERE [userID] = @original_userID AND [userName] = @original_userName AND [password] = @original_password AND (([firstName] = @original_firstName) OR ([firstName] IS NULL AND @original_firstName IS NULL)) AND (([lastName] = @original_lastName) OR ([lastName] IS NULL AND @original_lastName IS NULL)) AND [email] = @original_email AND (([age] = @original_age) OR ([age] IS NULL AND @original_age IS NULL)) AND (([height] = @original_height) OR ([height] IS NULL AND @original_height IS NULL)) AND (([weight] = @original_weight) OR ([weight] IS NULL AND @original_weight IS NULL)) AND (([calories] = @original_calories) OR ([calories] IS NULL AND @original_calories IS NULL)) AND (([numOfMeals] = @original_numOfMeals) OR ([numOfMeals] IS NULL AND @original_numOfMeals IS NULL))" InsertCommand="INSERT INTO [UserInfo] ([userName], [password], [firstName], [lastName], [email], [age], [height], [weight], [calories], [numOfMeals]) VALUES (@userName, @password, @firstName, @lastName, @email, @age, @height, @weight, @calories, @numOfMeals)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [UserInfo] SET [userName] = @userName, [password] = @password, [firstName] = @firstName, [lastName] = @lastName, [email] = @email, [age] = @age, [height] = @height, [weight] = @weight, [calories] = @calories, [numOfMeals] = @numOfMeals WHERE [userID] = @original_userID AND [userName] = @original_userName AND [password] = @original_password AND (([firstName] = @original_firstName) OR ([firstName] IS NULL AND @original_firstName IS NULL)) AND (([lastName] = @original_lastName) OR ([lastName] IS NULL AND @original_lastName IS NULL)) AND [email] = @original_email AND (([age] = @original_age) OR ([age] IS NULL AND @original_age IS NULL)) AND (([height] = @original_height) OR ([height] IS NULL AND @original_height IS NULL)) AND (([weight] = @original_weight) OR ([weight] IS NULL AND @original_weight IS NULL)) AND (([calories] = @original_calories) OR ([calories] IS NULL AND @original_calories IS NULL)) AND (([numOfMeals] = @original_numOfMeals) OR ([numOfMeals] IS NULL AND @original_numOfMeals IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_userID" Type="Int32" />
            <asp:Parameter Name="original_userName" Type="String" />
            <asp:Parameter Name="original_password" Type="String" />
            <asp:Parameter Name="original_firstName" Type="String" />
            <asp:Parameter Name="original_lastName" Type="String" />
            <asp:Parameter Name="original_email" Type="String" />
            <asp:Parameter Name="original_age" Type="Int32" />
            <asp:Parameter Name="original_height" Type="Int32" />
            <asp:Parameter Name="original_weight" Type="Decimal" />
            <asp:Parameter Name="original_calories" Type="Decimal" />
            <asp:Parameter Name="original_numOfMeals" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="userName" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="firstName" Type="String" />
            <asp:Parameter Name="lastName" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="age" Type="Int32" />
            <asp:Parameter Name="height" Type="Int32" />
            <asp:Parameter Name="weight" Type="Decimal" />
            <asp:Parameter Name="calories" Type="Decimal" />
            <asp:Parameter Name="numOfMeals" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="userID" SessionField="sUserId" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="userName" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="firstName" Type="String" />
            <asp:Parameter Name="lastName" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="age" Type="Int32" />
            <asp:Parameter Name="height" Type="Int32" />
            <asp:Parameter Name="weight" Type="Decimal" />
            <asp:Parameter Name="calories" Type="Decimal" />
            <asp:Parameter Name="numOfMeals" Type="Int32" />
            <asp:Parameter Name="original_userID" Type="Int32" />
            <asp:Parameter Name="original_userName" Type="String" />
            <asp:Parameter Name="original_password" Type="String" />
            <asp:Parameter Name="original_firstName" Type="String" />
            <asp:Parameter Name="original_lastName" Type="String" />
            <asp:Parameter Name="original_email" Type="String" />
            <asp:Parameter Name="original_age" Type="Int32" />
            <asp:Parameter Name="original_height" Type="Int32" />
            <asp:Parameter Name="original_weight" Type="Decimal" />
            <asp:Parameter Name="original_calories" Type="Decimal" />
            <asp:Parameter Name="original_numOfMeals" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

