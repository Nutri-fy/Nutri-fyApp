<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="custom/custom.css" rel="stylesheet" />
</head>
<body>
    <div id="loginBanner" class="jumbotron">
        <h1 class="display-4">Nutri-fy</h1>
        <p class="lead">Nutrition planning made simple again</p>
    </div>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="pnlMain" runat="server">
                <h1 id="welcomeHeading">Welcome</h1>
                <div id="divBtnLogin">
                    <label for="btnLogin">Already have an account?</label>
                    <asp:Button ID="btnLogin" class="btn btn-primary btn-lg btn-block" runat="server" Text="Login" OnClick="btnLogin_Click" />
                </div>
                <div id="divBtnRegister">
                    <label for="btnRegister">New?</label>
                    <asp:Button ID="btnRegister" class="btn btn-primary btn-lg btn-block" runat="server" Text="Register" OnClick="btnRegister_Click" />
                </div>
            </asp:Panel>
            <asp:Panel ID="pnlLogin" class="form-group" runat="server" BorderColor="White" Enabled="False" Visible="False">
                    <h1 id="loginHeading">Login</h1>
                    <div id="loginControls" aria-autocomplete="none">
                        <label for="txtUsername">Username</label>
                        <asp:TextBox ID="txtUsername" class="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ReqName" runat="server" ControlToValidate="txtUsername" ErrorMessage="Please enter Username" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cmpUserName" runat="server" ErrorMessage="Incorrect Username" ControlToCompare="txtHiddenUsername" ControlToValidate="txtUsername" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>
                        <br />
                        <label for="txtPassword">Password</label>
                        <asp:TextBox ID="txtPassword" TextMode="Password" class="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ReqPass" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please enter password" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cmpPassword" runat="server" ErrorMessage="Incorrect Password" ControlToCompare="txtHiddenPassword" ControlToValidate="txtPassword" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>
                        <br />
                        <asp:Button ID="btnLoginBack" class="btn btn-warning" runat="server" Text="Back" OnClick="btnLoginBack_Click1" CausesValidation="False" />
                        <asp:Button ID="btnLoginSubmit" class="btn btn-primary" runat="server" Text="Login" OnClick="btnLoginSubmit_Click" />
                    </div>
                        <asp:TextBox ID="txtHiddenUsername" runat="server" ReadOnly="True" Visible="False"></asp:TextBox>
                        <asp:TextBox ID="txtHiddenPassword" runat="server" ReadOnly="True" Visible="False"></asp:TextBox>
            </asp:Panel>
            <asp:Panel ID="pnlRegister" class="form-group" runat="server" BorderColor="White">
                    <h1 id="registerHeading">Register</h1>
                    <div id="registerControls" class="container">
                        <div class="row">
                            <div id="col1" class="col">
                                <label for="txtRegUsername">Username</label>
                                <asp:TextBox ID="txtRegUsername" class="form-control" runat="server" AutoPostBack="True" OnTextChanged="txtRegUsername_TextChanged"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ReqRegName" runat="server" ControlToValidate="txtRegUsername" ErrorMessage="Please enter Username" Font-Bold="True" Font-Italic="True" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cmpRegUsername" runat="server" ErrorMessage="Username already Exists!" ControlToCompare="txtHiddenRegUsername" ControlToValidate="txtRegUsername" Display="Dynamic" Font-Bold="True" Font-Italic="True" ForeColor="Red"></asp:CompareValidator>
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
                                <asp:RequiredFieldValidator ID="ReqFName" runat="server" ControlToValidate="txtFirstname" Display="Dynamic" EnableTheming="True" ErrorMessage="Please enter your First Name" Font-Bold="True" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
                               <asp:RegularExpressionValidator ID="RegExpFname" runat="server" ControlToValidate="txtFirstname" Display="Dynamic" ErrorMessage="Please enter a valid first name" ForeColor="Red" ValidationExpression="/^[a-z ,.'-]+$/i"></asp:RegularExpressionValidator>
                            </div>
                            <div id="col4" class="col">
                                <label for="txtLastname">Last Name</label>
                                <asp:TextBox ID="txtLastname" class="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ReqLName" runat="server" ControlToValidate="txtLastname" Display="Dynamic" ErrorMessage="Please enter your Last Name" Font-Bold="True" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegExpLname" runat="server" ControlToValidate="txtLastname" Display="Dynamic" ErrorMessage="Please enter a valid last name" ForeColor="Red" ValidationExpression="/^[a-z ,.'-]+$/i"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="row">
                            <div id="col5" class="col">
                                <label for="txtRegPassword">Password</label>
                                <asp:TextBox ID="txtRegPassword" class="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ReqRegPass" TextMode="Password" runat="server" ControlToValidate="txtRegPassword" Display="Dynamic" ErrorMessage="Please enter a Password" Font-Bold="True" Font-Italic="True" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div id="col6" class="col">
                                <label for="txtRePassword">Re-enter Password</label>
                                <asp:TextBox ID="txtRePassword" class="form-control" runat="server"></asp:TextBox>
                                <asp:CompareValidator ID="compPass" TextMode="Password" runat="server" ControlToCompare="txtRegPassword" Display="Dynamic"  ControlToValidate="txtRePassword" ErrorMessage="Passwords must match!" Font-Bold="True" Font-Italic="True" ForeColor="#3333FF"></asp:CompareValidator>
                            </div>
                        </div>
                        <br />
                        <asp:Button ID="btnRegisterBack" class="btn btn-warning" runat="server" Text="Back" OnClick="btnRegisterBack_Click" CausesValidation="False" />

                        <asp:Button ID="btnContinue" class="btn btn-primary" runat="server" Text="Continue" OnClick="btnContinue_Click" CausesValidation="False" />

                    </div>
                <asp:TextBox ID="txtHiddenRegUsername" runat="server" ReadOnly="True" Visible="False"></asp:TextBox>
            </asp:Panel>
            <asp:Panel ID="pnlRegister2" class="form-group" CssClass="pnlRegister2" runat="server" BorderColor="White">
                    <h1 id="register2Heading">Personal Info</h1>
                    <div id="register2Controls" class="container">
                        <div class="row">
                            <div id="col10" class="col">
                                <label for="txtAge">Age</label>
                                <asp:TextBox ID="txtAge" class="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ReqAge" runat="server" ControlToValidate="txtAge" ErrorMessage="Please enter you age" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>

                            </div>
                            <div id="col11" class="col">
                                <label for="txtHeight">Height (cm)</label>
                                <asp:TextBox ID="txtHeight" class="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ReqHeight" runat="server" ControlToValidate="txtHeight" ErrorMessage="Please enter your height" ForeColor="Red" BorderStyle="NotSet" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegExpHeight" runat="server" ControlToValidate="txtHeight" Display="Dynamic" ErrorMessage="Please enter a valid height" ForeColor="Red" ValidationExpression="^[1-9]\d*$"></asp:RegularExpressionValidator>
                            </div>
                            <div id="col12" class="col">
                                <label for="txtWeight">Weight (kg)</label>
                                <asp:TextBox ID="txtWeight" class="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ReqWeight" runat="server" ControlToValidate="txtWeight" ErrorMessage="Please enter your weight" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                 <asp:RegularExpressionValidator ID="ReguExpWeight" runat="server" ControlToValidate="txtWeight" Display="Dynamic" ErrorMessage="Please enter a valid weight" ForeColor="Red" ValidationExpression="^[1-9]\d*$"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="row">
                            <div id="col13" class="col">
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                                    <asp:ListItem Value="0">Let Us Calculate Your Calories and Macros (Almost There)</asp:ListItem>
                                    <asp:ListItem Value="1">Know Your Stuff? Customize!</asp:ListItem>
                                    
                                </asp:RadioButtonList>
                                
                            </div>
                        </div>
                        <asp:Panel ID="pnlCalculateCal" runat="server">
                            <div class="row">
                                <div id="col14" class="col">
                                    <label for="ddGender">Gender</label>
                                    <br />
                                    <asp:DropDownList ID="ddGender" class="btn btn-secondary dropdown-toggle" runat="server">
                                        <asp:ListItem Value="0">Please Pick a Gender</asp:ListItem>
                                        <asp:ListItem Value="1">Male</asp:ListItem>
                                        <asp:ListItem Value="2">Female</asp:ListItem>
                                    </asp:DropDownList>
                                     <asp:RequiredFieldValidator ID="ReqGender" runat="server" ControlToValidate="ddGender"
                                     ErrorMessage="Gender Required" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
           
                                </div>
                                <div id="col15" class="col">
                                    <label for="ddGoal">Goal</label>
                                    <br />
                                    <asp:DropDownList ID="ddGoal" class="btn btn-secondary dropdown-toggle" runat="server">
                                        <asp:ListItem Value="0">Please Pick a Goal</asp:ListItem>
                                        <asp:ListItem Value="1">Maintenance</asp:ListItem>
                                        <asp:ListItem Value="2">Weight Loss</asp:ListItem>
                                        <asp:ListItem Value="3">Weight Gain</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="ReqGoal" runat="server" ControlToValidate="ddGoal"
                                     ErrorMessage="Goal Required" ForeColor="Red" InitialValue="0" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                                <div id="col26" class="col">
                                    <label for="ddMeals">Number of Meals</label>
                                    <br />
                                    <asp:DropDownList ID="ddMeals" class="btn btn-secondary dropdown-toggle" runat="server">
                                        <asp:ListItem Value="0">Please Pick Meal Frequency (including snacks)</asp:ListItem>
                                        <asp:ListItem Value="3">3 Meals/Day</asp:ListItem>
                                        <asp:ListItem Value="4">4 Meals/Day</asp:ListItem>
                                        <asp:ListItem Value="5">5 Meals/Day</asp:ListItem>
                                        <asp:ListItem Value="6">6 Meals/Day</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="ReqMeal" runat="server" ControlToValidate="ddMeals"
                                     ErrorMessage="Number of meals required" ForeColor="Red" InitialValue="0" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row">
                                <div id="col16" class="col">
                                    <label for="ddActivity">Activity Level</label>
                                    <br />
                                    <asp:DropDownList ID="ddActivity" class="btn btn-secondary dropdown-toggle" runat="server">
                                        <asp:ListItem Value="0">Please Pick an Activity Level</asp:ListItem>
                                        <asp:ListItem Value="1.2">Sedentary - little or no exericse</asp:ListItem>
                                        <asp:ListItem Value="1.3">Lightly Active - exercise/sports 1-3 times/week</asp:ListItem>
                                        <asp:ListItem Value="1.4">Moderately Active - exercise/sports 3-5 times/week</asp:ListItem>
                                        <asp:ListItem Value="1.5">Very Active - hard exercise/sports 6-7 times/week)</asp:ListItem>
                                        <asp:ListItem Value="1.6">Extra Active - very hard sports/exercise/physical job</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="ReqActivity" runat="server" ControlToValidate="ddActivity"
                                     ErrorMessage="Please pick activity level" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <asp:Panel ID="pnlCalculateValues" runat="server">
                                <div class="row">
                                    <div id="col21" class="col">
                                        <asp:Button ID="btnCalculateCaloriesMacros" class="btn btn-primary" runat="server" Text="Calculate" CausesValidation="True" OnClick="btnCalculateCaloriesMacros_Click"/>
                                    </div>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="pnlCalculateResults" runat="server">
                                <div class="row">
                                    <div id="col22" class="col">
                                        <label for="txtCaloriesResults">Calories (kJ)</label>
                                        <asp:TextBox ID="txtCaloriesResults" class="form-control" runat="server" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">

                                    <div id="col23" class="col">
                                        <label for="txtPrProResults">Percent Proteins (%)</label>
                                        <asp:TextBox ID="txtPrProResults" class="form-control" runat="server" ReadOnly="True"></asp:TextBox>
                                    </div>
                                    <div id="col24" class="col">
                                        <label for="txtPrCarbResults">Percent Carbohydrates (%)</label>
                                        <asp:TextBox ID="txtPrCarbResults" class="form-control" runat="server" ReadOnly="True"></asp:TextBox>
                                    </div>
                                    <div id="col25" class="col">
                                        <label for="txtPrFatResults">Percent Fats (%)</label>
                                        <asp:TextBox ID="txtPrFatResults" class="form-control" runat="server" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>

                            </asp:Panel>
                        </asp:Panel>
                        <asp:Panel ID="pnlEnterCal" runat="server">
                            <div class="row">
                                <div id="col17" class="col">
                                    <label for="txtEnterCalories">Please Enter Your Calories (kJ)</label>
                                    <asp:TextBox ID="txtEnterCalories" class="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ReqCal" runat="server" ControlToValidate="txtEnterCalories"
                                     ErrorMessage="Please enter your calories" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                     <asp:RegularExpressionValidator ID="RegExpCal" runat="server" ControlToValidate="txtEnterCalories" Display="Dynamic" ErrorMessage="Please enter a valid calories" ForeColor="Red" ValidationExpression="^[1-9]\d*$"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="row">
                                <div id="col27" class="col">
                                    <label for="ddMeals2">Number of Meals</label>
                                    <br />
                                    <asp:DropDownList ID="ddMeals2" class="btn btn-secondary dropdown-toggle" runat="server">
                                        <asp:ListItem Value="0">Please Pick Meal Frequency (including snacks)</asp:ListItem>
                                        <asp:ListItem Value="3">3 Meals/Day</asp:ListItem>
                                        <asp:ListItem Value="4">4 Meals/Day</asp:ListItem>
                                        <asp:ListItem Value="5">5 Meals/Day</asp:ListItem>
                                        <asp:ListItem Value="6">6 Meals/Day</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="ReqddMeals2" runat="server" ControlToValidate="ddMeals2"
                                     ErrorMessage="Number of meals required" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>

                                </div>
                            </div>
                            <div class="row">
                                <div id="col18" class="col">
                                    <label for="txtPrPro">Percent Proteins (%)</label>
                                    <asp:TextBox ID="txtPrPro" class="form-control" runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="ReqPro" runat="server" ControlToValidate="txtPrPro"
                                     ErrorMessage="Please enter protein percentage" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegExprProtien" runat="server" ControlToValidate="txtPrPro" Display="Dynamic" ErrorMessage="Please enter a valid protein percentage" 
                                        ForeColor="Red" ValidationExpression="^[1-9]\d*$"></asp:RegularExpressionValidator>

                                </div>
                                <div id="col19" class="col">
                                    <label for="txtPrCarb">Percent Carbohydrates (%)</label>
                                    <asp:TextBox ID="txtPrCarb" class="form-control" runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="ReqPrCarb" runat="server" ControlToValidate="txtPrCarb"
                                     ErrorMessage="Please enter your carbohydrates percentage" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegExpCarb" runat="server" ControlToValidate="txtPrCarb" Display="Dynamic" ErrorMessage="Please enter a valid carb percentage" 
                                        ForeColor="Red" ValidationExpression="^[1-9]\d*$"></asp:RegularExpressionValidator>

                                </div>
                                <div id="col20" class="col">
                                    <label for="txtPrFat">Percent Fats (%)</label>
                                    <asp:TextBox ID="txtPrFat" class="form-control" runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="ReqPrFat" runat="server" ControlToValidate="txtPrFat"
                                     ErrorMessage="Please enter your fat percentage" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegExpFat" runat="server" ControlToValidate="txtPrFat" Display="Dynamic" ErrorMessage="Please enter a valid fat percentage" 
                                        ForeColor="Red" ValidationExpression="^[1-9]\d*$"></asp:RegularExpressionValidator>
                                    
                                </div>
                            </div>
                        </asp:Panel>
                        <asp:Panel ID="pnlRegister2FormControl" runat="server">
                            <asp:Button ID="btnCancel" class="btn btn-warning" runat="server" Text="Cancel" CausesValidation="False" />
                            <asp:Button ID="btnRegisterSubmit" class="btn btn-primary" runat="server" Text="Register" OnClick="btnRegisterSubmit_Click" />
                        </asp:Panel>
                    </div>
            </asp:Panel>

        </div>
    </form>
</body>
</html>
