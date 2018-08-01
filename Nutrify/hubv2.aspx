<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="hubv2.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
         <br /><br /><br />
    <div class ="pnlDays">
        <h1 id="dayTitle">Weekly Meals</h1>
  <main class="hoc container clear"> 
   
    <ul class="nospace clear services">

        <li class="one_quarter"><a href="#">
        <figure><img src="images/mon.png" alt="">
          <figcaption>Monday</figcaption>
        </figure>
        </a></li>

      <li class="one_quarter"><a href="#">
        <figure><img src="images/tues.png" alt="">
          <figcaption>Tuesday</figcaption>
        </figure>
        </a></li>
      <li class="one_quarter"><a href="#">
        <figure><img src="images/wed.png" alt="">
          <figcaption>Wednesday</figcaption>
        </figure>
        </a></li>
      <li class="one_quarter first"><a href="#">
        <figure><img src="images/thurs.png" alt="">
          <figcaption>Thursday</figcaption>
        </figure>
        </a></li>
      <li class="one_quarter"><a href="#">
        <figure><img src="images/fri.png" alt="">
          <figcaption>Friday</figcaption>
        </figure>
        </a></li>
      <li class="one_quarter"><a href="#">
        <figure><img src="images/sat.png" alt="">
          <figcaption>Saturday</figcaption>
        </figure>
        </a></li>
      <li class="one_quarter"><a href="#">
        <figure><img src="images/sun.png" alt="">
          <figcaption>Sunday</figcaption>
        </figure>
        </a></li>
      
    </ul>
      <br />
      </main>
     </div>
        <div class="pnlDays">
            <h1>Your weekly progress</h1>
            <p>Training Program</p>
            <ul>
                <li>Excercise 1</li>
                <li>Excercise 2</li>
                <li>Excercise 3</li>
            </ul>
        </div>
</asp:Content>

