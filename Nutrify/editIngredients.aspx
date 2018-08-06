<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="editIngredients.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="custom/font-awesome.css" rel="stylesheet" />

    <link href="custom/style.css" rel="stylesheet" />
    <body>

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
                        Edit Ingredients
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
                        <h5>Edit Users </h5>
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
                        <h5>Alerts </h5>
                    </div>
                </div>

            </div>

    
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="ingredientID" DataSourceID="admin" Width="497px">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="ingredientID" HeaderText="ingredientID" InsertVisible="False" ReadOnly="True" SortExpression="ingredientID" />
                    <asp:BoundField DataField="foodGroup" HeaderText="foodGroup" SortExpression="foodGroup" />
                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                    <asp:BoundField DataField="Protein" HeaderText="Protein" SortExpression="Protein" />
                    <asp:BoundField DataField="Fat" HeaderText="Fat" SortExpression="Fat" />
                    <asp:BoundField DataField="Carbohydrates" HeaderText="Carbohydrates" SortExpression="Carbohydrates" />
                    <asp:BoundField DataField="Calories" HeaderText="Calories" SortExpression="Calories" />
                    <asp:BoundField DataField="Sugar" HeaderText="Sugar" SortExpression="Sugar" />
                    <asp:BoundField DataField="Fiber" HeaderText="Fiber" SortExpression="Fiber" />
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
            <asp:SqlDataSource ID="admin" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:Nutri-fyConnectionString %>" DeleteCommand="DELETE FROM [Ingredients] WHERE [ingredientID] = @original_ingredientID AND (([foodGroup] = @original_foodGroup) OR ([foodGroup] IS NULL AND @original_foodGroup IS NULL)) AND (([name] = @original_name) OR ([name] IS NULL AND @original_name IS NULL)) AND (([Protein] = @original_Protein) OR ([Protein] IS NULL AND @original_Protein IS NULL)) AND (([Fat] = @original_Fat) OR ([Fat] IS NULL AND @original_Fat IS NULL)) AND (([Carbohydrates] = @original_Carbohydrates) OR ([Carbohydrates] IS NULL AND @original_Carbohydrates IS NULL)) AND (([Calories] = @original_Calories) OR ([Calories] IS NULL AND @original_Calories IS NULL)) AND (([Sugar] = @original_Sugar) OR ([Sugar] IS NULL AND @original_Sugar IS NULL)) AND (([Fiber] = @original_Fiber) OR ([Fiber] IS NULL AND @original_Fiber IS NULL))" InsertCommand="INSERT INTO [Ingredients] ([foodGroup], [name], [Protein], [Fat], [Carbohydrates], [Calories], [Sugar], [Fiber]) VALUES (@foodGroup, @name, @Protein, @Fat, @Carbohydrates, @Calories, @Sugar, @Fiber)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Ingredients]" UpdateCommand="UPDATE [Ingredients] SET [foodGroup] = @foodGroup, [name] = @name, [Protein] = @Protein, [Fat] = @Fat, [Carbohydrates] = @Carbohydrates, [Calories] = @Calories, [Sugar] = @Sugar, [Fiber] = @Fiber WHERE [ingredientID] = @original_ingredientID AND (([foodGroup] = @original_foodGroup) OR ([foodGroup] IS NULL AND @original_foodGroup IS NULL)) AND (([name] = @original_name) OR ([name] IS NULL AND @original_name IS NULL)) AND (([Protein] = @original_Protein) OR ([Protein] IS NULL AND @original_Protein IS NULL)) AND (([Fat] = @original_Fat) OR ([Fat] IS NULL AND @original_Fat IS NULL)) AND (([Carbohydrates] = @original_Carbohydrates) OR ([Carbohydrates] IS NULL AND @original_Carbohydrates IS NULL)) AND (([Calories] = @original_Calories) OR ([Calories] IS NULL AND @original_Calories IS NULL)) AND (([Sugar] = @original_Sugar) OR ([Sugar] IS NULL AND @original_Sugar IS NULL)) AND (([Fiber] = @original_Fiber) OR ([Fiber] IS NULL AND @original_Fiber IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_ingredientID" Type="Int32" />
                    <asp:Parameter Name="original_foodGroup" Type="String" />
                    <asp:Parameter Name="original_name" Type="String" />
                    <asp:Parameter Name="original_Protein" Type="Int32" />
                    <asp:Parameter Name="original_Fat" Type="Decimal" />
                    <asp:Parameter Name="original_Carbohydrates" Type="Decimal" />
                    <asp:Parameter Name="original_Calories" Type="Int32" />
                    <asp:Parameter Name="original_Sugar" Type="Decimal" />
                    <asp:Parameter Name="original_Fiber" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="foodGroup" Type="String" />
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="Protein" Type="Int32" />
                    <asp:Parameter Name="Fat" Type="Decimal" />
                    <asp:Parameter Name="Carbohydrates" Type="Decimal" />
                    <asp:Parameter Name="Calories" Type="Int32" />
                    <asp:Parameter Name="Sugar" Type="Decimal" />
                    <asp:Parameter Name="Fiber" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="foodGroup" Type="String" />
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="Protein" Type="Int32" />
                    <asp:Parameter Name="Fat" Type="Decimal" />
                    <asp:Parameter Name="Carbohydrates" Type="Decimal" />
                    <asp:Parameter Name="Calories" Type="Int32" />
                    <asp:Parameter Name="Sugar" Type="Decimal" />
                    <asp:Parameter Name="Fiber" Type="Decimal" />
                    <asp:Parameter Name="original_ingredientID" Type="Int32" />
                    <asp:Parameter Name="original_foodGroup" Type="String" />
                    <asp:Parameter Name="original_name" Type="String" />
                    <asp:Parameter Name="original_Protein" Type="Int32" />
                    <asp:Parameter Name="original_Fat" Type="Decimal" />
                    <asp:Parameter Name="original_Carbohydrates" Type="Decimal" />
                    <asp:Parameter Name="original_Calories" Type="Int32" />
                    <asp:Parameter Name="original_Sugar" Type="Decimal" />
                    <asp:Parameter Name="original_Fiber" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
            </body>

    <br />

                        <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    &copy; Nutrify 
                </div>

            </div>
        </div>
    </footer>


    
</asp:Content>

