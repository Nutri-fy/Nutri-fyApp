<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BFCalculator.aspx.cs" Inherits="BFCalculator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="intro" runat="server">
        <div id="innerIntro">
            <h2>Body Fat Calculator</h2>
            <br />
            <br />
            <asp:Panel ID="pnlMale" runat="server">
                <div id="dMBF">
                    <p><i>Please enter the following information to get an *estimate* of your current body fat percentage</i></p>
                    <div class="row">
                        <div class="col">
                            <label for="txtMWeight">Weight (in kg):</label>
                            <asp:TextBox ID="txtMWeight" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter a weight!" ControlToValidate="txtMWeight"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Numbers Only!" ControlToValidate="txtMWeight" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                        </div>
                        <div class="col">
                            <label for="txtMWaist">Waist (in inches):</label>
                            <asp:TextBox ID="txtMWaist" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter a measurement!" ControlToValidate="txtMWaist"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Numbers Only!" ControlToValidate="txtMWaist" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                        </div>
                        <div class="col">
                             <asp:label ID="lblMBF" for="txtMBF" runat="server">Body Fat (%):</asp:label>
                            <asp:TextBox ID="txtMBF" runat="server" ReadOnly="True"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <asp:Button ID="btnCalculateMF" runat="server" class="btn btn-primary" Text="Calculate" OnClick="calculateMWeight_Click" />
            </asp:Panel>

            <asp:Panel ID="pnlFemale" runat="server">

                <div id="dFBF">
                    <p><i>Please enter the following information to get an *estimate* of your current body fat percentage</i></p>

                    <div class="row">
                        <div class="col">
                            <label for="txtFWeight">Weight (in kg):</label>
                            <asp:TextBox ID="txtFWeight" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter a weight!" ControlToValidate="txtFWeight"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Numbers Only!" ControlToValidate="txtFWeight" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                        </div>
                        <div class="col">
                            <label for="txtFWrist">Wrist (in inches):</label>
                            <asp:TextBox ID="txtFWrist" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please enter a measurement!" ControlToValidate="txtFWrist"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Numbers Only!" ControlToValidate="txtFWrist" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                        </div>
                        <div class="col">
                            <label for="txtFWaist">Waist (in inches):</label>
                            <asp:TextBox ID="txtFWaist" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter a measurement!" ControlToValidate="txtFWaist"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Numbers Only!" ControlToValidate="txtFWaist" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="txtFHip">Hip (in inches):</label>
                            <asp:TextBox ID="txtFHip" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please enter a measurement!" ControlToValidate="txtFHip"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Numbers Only!" ControlToValidate="txtFHip" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                        </div>
                        <div class="col">
                            <label for="txtFForearm">Forearm (in inches):</label>
                            <asp:TextBox ID="txtFForearm" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Please enter a measurement!" ControlToValidate="txtFForearm"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="Numbers Only!" ControlToValidate="txtFForearm" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                        </div>
                        <div class="col">
                            <asp:label ID="lblFBF" for="txtFBF" runat="server">Body Fat (%):</asp:label>
                            <asp:TextBox ID="txtFBF" runat="server" ReadOnly="True"></asp:TextBox>
                        </div>
                    </div>

                </div>
                <asp:Button ID="btnCalculateFF" runat="server" class="btn btn-primary" Text="Calculate" OnClick="btnFCalculate_Click" />
            </asp:Panel>
        </div>
    </div>

</asp:Content>

