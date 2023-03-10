<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="USER_DONOR_SURVEY_FORM.aspx.cs" Inherits="User.USER_DONOR_SURVEY_FORM" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" runat="server" href="~/assets/img/321479999_548324667206662_5830804446592810955_n.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
    <title>Donor Request Form | LifePoints</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&amp;display=swap" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Almarai&amp;display=swap" />
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css" />
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css" />
    <link rel="stylesheet" href="assets/fonts/fontawesome5-overrides.min.css" />
    <link rel="stylesheet" href="assets/css/Blog---Recent-Posts-styles.css" />
    <link rel="stylesheet" href="assets/css/Blog---Recent-Posts.css" />
    <link rel="stylesheet" href="assets/css/Bootstrap-Chat.css" />
    <link rel="stylesheet" href="assets/css/Button-Outlines---Pretty.css" />
    <link rel="stylesheet" href="assets/css/Chat.css" />
    <link rel="stylesheet" href="assets/css/custom-buttons.css" />
    <link rel="stylesheet" href="assets/css/Floating-Button.css" />
    <link rel="stylesheet" href="assets/css/Ludens-basic-login.css" />
    <link rel="stylesheet" href="assets/css/Ludens-Users---1-Login.css" />
    <link rel="stylesheet" href="assets/css/Simple-Bootstrap-Chat.css" />
    <script>
        function UncheckRadioIfTextIsClicked() {
            var res = document.querySelector('input[name="rd23"]:checked').value;
            document.getElementById("2.3OTH").setAttribute("required", "");

            //Uncheck Radios and Unset required
            var rds = document.getElementsByName("rd23");
            for (var i = 0; i < rds.length; i++) {
                rds[i].removeAttribute("required");
                rds[i].checked = false;
            }
        }

        function CleanInputField() {
            document.getElementById("2.3OTH").value = "";

            var rds = document.getElementsByName("rd23");
            for (var i = 0; i < rds.length; i++) {
                rds[i].setAttribute("required", "");
            }

            document.getElementById("2.3OTH").removeAttribute("required");
        }

        function SetDate() {
            alert("2023-01-14");
            document.getElementById("dob").value = "14-01-2023";
        }
    </script>
</head>

<body id="page-top">
    <form runat="server" id="wrapper">
        <nav class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0" style="background: rgb(119,40,32); color: var(--bs-red);">
            <div class="container-fluid d-flex flex-column p-0">
                <img src="assets/img/321479999_548324667206662_5830804446592810955_n.png" width="92" height="92" style="margin-top: 30px;" /><a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
                    <div class="sidebar-brand-icon rotate-n-15"></div>
                    <div class="sidebar-brand-text mx-3"><span>LIFEPOINTS</span></div>
                </a>
                <hr class="sidebar-divider my-0" />
                <ul class="navbar-nav text-light" id="accordionSidebar">
                    <li class="nav-item"><a class="nav-link" href="USER_BLOGPOST.aspx"><i class="fas fa-tachometer-alt"></i><span>Blog Post</span></a></li>
                   
                    <li class="nav-item"><a class="nav-link" href="USER_REQUEST_A_BLOOD.aspx"><i class="fa fa-tint"></i><span>Request a Blood</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="USER_BECOMEADONOR.aspx"><i class="fa fa-heart"></i><span>Become a Blood Donor</span></a></li>

                </ul>
                <div class="text-center d-none d-md-inline"></div>
            </div>
        </nav>
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
                <nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
                    <div class="container-fluid">
                        <button class="btn btn-link d-md-none rounded-circle me-3" id="sidebarToggleTop" type="button"><i class="fas fa-plus"></i></button>
                        <ul class="navbar-nav flex-nowrap ms-auto">
                            <li class="nav-item dropdown d-sm-none no-arrow"><a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="#"><i class="fas fa-search"></i></a>
                                <div class="dropdown-menu dropdown-menu-end p-3 animated--grow-in" aria-labelledby="searchDropdown">
                                    <div class="me-auto navbar-search w-100">
                                        <div class="input-group">
                                            <input class="bg-light form-control border-0 small" type="text" placeholder="Search for ..." />
                                            <div class="input-group-append">
                                                <button class="btn btn-primary py-0" type="button"><i class="fas fa-search"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="nav-item dropdown no-arrow mx-1">
                                <div class="nav-item dropdown no-arrow">
                                    <a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="#"><span class="badge bg-danger badge-counter" runat="server" id="UnreadCount"></span><i class="fas fa-bell fa-fw"></i></a>
                                    <div class="dropdown-menu dropdown-menu-end dropdown-list animated--grow-in">
                                        <h6 class="dropdown-header" style="background: rgb(119,40,32);">NOTIFICATIONS</h6>
                                        <div class="d-flex" style="flex-direction: column; max-height: 250px; overflow: auto; width: 100%;">
                                            <asp:Repeater runat="server" ID="NotificationNavList" OnItemCommand="NotificationNavList_ItemCommand">
                                                <ItemTemplate>
                                                    <asp:LinkButton runat="server" ID="ViewNotifBtn" CommandName="ViewNotif" CommandArgument='<%# Eval("NTF_ID") %>'  CssClass="dropdown-item d-flex align-items-center"  >
                                                        <div class="me-3">
                                                            <div class="bg-primary icon-circle" style="background: var(--bs-indigo); border-color: var(--bs-blue);"><i class="fas fa-envelope-open text-white"></i></div>
                                                        </div>
                                                        <div>
                                                            <span class="small text-gray-500"><%# Eval("NTF_DATE") %></span>
                                                            <p><%# Eval("NTF_SUBJECT") %></p>
                                                        </div>
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                        <a class="dropdown-item text-center small text-gray-500" href="USER_Notification.aspx">Show All Notifications</a>
                                    </div>
                                </div>
                            </li>
                            
                            <div class="d-none d-sm-block topbar-divider"></div>
                            <li class="nav-item dropdown no-arrow">
                                <div class="nav-item dropdown no-arrow">
                                    <a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="#"><span class="d-none d-lg-inline me-2 text-gray-600 small" runat="server" id="Username"></span>
                                        <img class="border rounded-circle img-profile" src="assets/img/avatars/icons8-user-60.png" /></a>
                                    <div class="dropdown-menu shadow dropdown-menu-end animated--grow-in">
                                        <a class="dropdown-item" href="USER_PROFILE.aspx"><i class="fas fa-user fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Profile</a>
                                        <a class="dropdown-item" runat="server" id="BtnLogout" autopostback="true" onserverclick="BtnLogout_ServerClick"><i class="fas fa-sign-out-alt fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Logout</a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
                <div class="container-fluid d-flex" style="justify-content: center; align-items: center;">
                    <div class="card text-center" style="max-height: 800px; height: 800px; width: 80%;">
                        <div class="card-header">
                            <h2>BLOOD DONOR FORM</h2>
                            <h3>QUESTIONNAIRE</h3>
                        </div>
                        <div class="card-body">
                            <div style="max-height: 600px; overflow: auto;">
                                <p style="font-size: 25px; font-style: bold; margin-left: -30%">
                                    Please complete this form
                                </p>
                                <table style="text-align: left; width: 53%; margin: auto">
                                   <tr>
                                        <td>Family name:</td>
                                        <td>
                                            <asp:TextBox runat="server"  Class="form-control" type="text" ID="familyname" name="familyname" required="" /></td>
                                        </tr>
                                    <tr>
                                       <td>First name:</td>
                                        <td>
                                            <asp:TextBox runat="server"   Class="form-control" type="text" ID="firstname" name="firstname" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td>Middle name:</td>
                                        <td>
                                            <asp:TextBox runat="server"  Class="form-control" type="text" ID="middlename" name="midname" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                    </tr>
                                    <tr><td>Date of birth:</td></tr>
                                    <tr>
                                        <td>Month</td>
                                        <td>
                                            <asp:DropDownList ID="month" runat="server" Class="form-control">
                                                <asp:ListItem>January</asp:ListItem>
                                                <asp:ListItem>Febraury</asp:ListItem>
                                                <asp:ListItem>March</asp:ListItem>
                                                <asp:ListItem>April</asp:ListItem>
                                                <asp:ListItem>May</asp:ListItem>
                                                <asp:ListItem>June</asp:ListItem>
                                                <asp:ListItem>July</asp:ListItem>
                                                <asp:ListItem>August</asp:ListItem>
                                                <asp:ListItem>September</asp:ListItem>
                                                <asp:ListItem>October</asp:ListItem>
                                                <asp:ListItem>November</asp:ListItem>
                                                <asp:ListItem>December</asp:ListItem>
                                            </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>

                                        <td>Day</td>
                                        <td>
                                            <asp:TextBox runat="server" Class="form-control" type="number" ID="day" name="dateofbirth" required="" />

                                        </td>
                                        </tr>
                                    <tr>
                                        <td>Year</td>
                                        <td>
                                            <asp:TextBox runat="server" Class="form-control" type="year" ID="year" name="dateofbirth" required="" /></td>
                                         
                                    </tr>
                                    <tr>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>Gender:</td>
                                        <td>
                                            <asp:DropDownList ID="Sex" runat="server" Class="form-control">
                                                <asp:ListItem>Female</asp:ListItem>
                                                <asp:ListItem>Male</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        
                                    </tr>
                                    
                                   
                                    <tr>
                                        <td>
                                            <br />
                                            Residential Address:.</td>
                                    </tr>
                                    <tr>
                                        

                                        <td>Street/Sector </td>
                                        <td>
                                            <asp:TextBox runat="server" Class="form-control" type="text" ID="street" name="resaddress" required="" ></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>Barangay</td>
                                        <td>
                                            <asp:TextBox runat="server"  Class="form-control" type="text" ID="barangay" name="posaddress" required="" ></asp:TextBox></td>
                                    </tr>
                                     <tr>
                                        <td>City</td>
                                        <td>
                                            <asp:TextBox runat="server"  Class="form-control" type="text" ID="city" name="city" required=""  ></asp:TextBox></td>
                                    </tr>
                                     <tr>
                                        <td>Province</td>
                                        <td>
                                            <asp:TextBox runat="server"  Class="form-control" type="text" ID="province" name="posaddress" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td>ZIP Code</td>
                                        <td>
                                            <asp:TextBox runat="server"  Class="form-control" type="number" ID="zip" name="posaddress" required="" ></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <br />
                                            Telephone No.</td>
                                    </tr>
                                    <tr>
                                        <td>Home:</td>
                                        <td>
                                            <asp:TextBox runat="server" Class="form-control" type="number" ID="Home" name="home" required="" ></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>Mobile:</td>
                                        <td>
                                            <asp:TextBox runat="server"  Class="form-control" type="number" ID="Mobile" name="mobile" required="" ></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>Email Address:</td>
                                        <td>
                                            <asp:TextBox runat="server" Class="form-control" type="email" ID="Email" name="email"  required=""></asp:TextBox></td>
                                    </tr>
                                </table>
                                <p style="font-size: 25px; font-style: bold; margin-left: -30%">
                                    <br />
                                    1 HEALTH ASSESSMENT
                                </p>
                                <p style="font-size: 20px; font-style: bold; margin-left: -20%">
                                    Please tick the appropriate answer to each question
                                </p>
                                <table style="text-align: left; width: 51%; margin: auto">
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>YES</td>
                                        <td>NO</td>
                                    </tr>
                                    <tr>
                                        <td>1.1</td>
                                        <td>Are you feeling well and in good health today?</td>
                                        <td>
                                            <asp:RadioButton runat="server" type="radio" ID="rd11y" GroupName="rd11" value="yes" required="" /></td>
                                        <td>
                                            <asp:RadioButton OnCheckedChanged="rd11n_CheckedChanged" AutoPostBack="true" runat="server" type="radio" ID="rd11n" GroupName="rd11" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td>1.2</td>
                                        <td>In the last 4 hours, have you had a meal or snack?</td>
                                        <td>
                                            <input type="radio" id="1.2Y" name="rd12" value="yes" required="" /></td>
                                        <td>
                                            <input type="radio" id="1.2N" name="rd12" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td>1.3</td>
                                        <td>Have you already given blood in the last 16 weeks?</td>
                                        <td>
                                            <input type="radio" id="1.3Y" name="rd13" value="yes" required="" /></td>
                                        <td>
                                            <input type="radio" id="1.3N" name="rd13" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td>1.4</td>
                                        <td>Have you got a chesty cough, sore throat or active cold sore?</td>
                                        <td>
                                            <input type="radio" id="1.4Y" name="rd14" value="yes" required="" /></td>
                                        <td>
                                            <input type="radio" id="1.4N" name="rd14" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td>1.5</td>
                                        <td>Are you pregnant or breastfeeding?</td>
                                        <td>
                                            <input type="radio" id="1.5Y" name="rd15" value="yes" required="" /></td>
                                        <td>
                                            <input type="radio" id="1.5N" name="rd15" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td>1.6</td>
                                        <td>Do you have or have you ever had:</td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>a &nbsp;&nbsp;&nbsp;Chest pains, heart disease/surgery or stroke?</td>
                                        <td>
                                            <input type="radio" id="1.6aY" name="rd16a" value="yes" required="" /></td>
                                        <td>
                                            <input type="radio" id="1.6aN" name="rd16a" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>b &nbsp;&nbsp;&nbsp;Lung disease, tuberculosis or asthma?</td>
                                        <td>
                                            <input type="radio" id="1.6bY" name="rd16b" value="yes" required="" /></td>
                                        <td>
                                            <input type="radio" id="1.6bN" name="rd16b" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>c &nbsp;&nbsp;&nbsp;Cancer, a blood disease, an abnormal bleeding disorder,<br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;or a bleeding gastric ulcer or duodenal ulcer?
                                        </td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="1.6cY" name="rd16c" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="1.6cN" name="rd16c" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>d &nbsp;&nbsp;&nbsp;Diabetes, thyroid disease, kidney disease, epilipsy (fits)?</td>
                                        <td>
                                            <input type="radio" id="1.6drd17Y" name="rd16d" value="yes" required="" /></td>
                                        <td>
                                            <input type="radio" id="1.6drd17N" name="rd16d" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top">1.7</td>
                                        <td>In the last 7 days, have you seen a doctor, dentist, or any other<br />
                                            healthcare professional or are you waiting to see one<br />
                                            (except for routine screening appointments)?</td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="1.7Y" name="rd17" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="1.7N" name="rd17" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td>1.8</td>
                                        <td>In the past 12 months:</td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>a &nbsp;&nbsp;&nbsp;Have you been ill, received any treatment<br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;or taken any medication?
                                        </td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="1.8aY" name="rd18a" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="1.8aN" name="rd18a" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>b &nbsp;&nbsp;&nbsp;Have you been under a doctor's care, undergone surgery,<br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;or a diagnostic procedure, suffered a major illness, or been<br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;involved in a serious accident?
                                        </td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="1.8bY" name="rd18b" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="1.8bN" name="rd18b" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top">1.9</td>
                                        <td>Have you ever had yellow jaundice (excluding jaundice at birth),<br />
                                            hepatitis or liver disease or a positive test for hepatitis?</td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>a &nbsp;&nbsp;&nbsp;In the past 12 months, have you had close contact with<br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a person with yellow jaundice or viral hepatitis, or have<br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;you been given hepatitis B vaccination?
                                        </td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="1.9aY" name="rd19a" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="1.9aN" name="rd19a" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>b &nbsp;&nbsp;&nbsp;Have you ever had hepatitis B or hepatitis C or think you<br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;may have hepatitis now?<br />
                                        </td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="1.9bY" name="rd19b" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="1.9bN" name="rd19b" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>c &nbsp;&nbsp;&nbsp;In the past 12 months, have you been tattoed, had ear or body<br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;piercing, acupuncture, circumcision or scarification, cosmetic<br>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;treatment?<br>
                                        </td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="1.9cY" name="rd19c" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="1.9cN" name="rd19c" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top">1.10</td>
                                        <td>In the past 12 months, have you or your sexual partner<br />
                                            received blood transfusion?</td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="1.10Y" name="rd110" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="1.10N" name="rd110" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top">1.11</td>
                                        <td>Have you or your sexual partner been treated with human or<br />
                                            animal blood products or clotting factors?</td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="1.11Y" name="rd111" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="1.11N" name="rd111" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top">1.12</td>
                                        <td>Have you ever had injections of human pituitary growth hormone,<br />
                                            pituitary gonadotrophin (fertility medicine) or seen a neurosurgeon<br />
                                            or neurologist?</td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="1.12Y" name="rd112" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="1.12N" name="rd112" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top">1.13</td>
                                        <td>Have you or your close relatives had an unexplained neurological<br />
                                            condition or been diagnosed with Creutzfeldt-Jacob Disease or<br />
                                            'mad cow disease'?</td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="1.13Y" name="rd113" value="yes" required=""></td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="1.13N" name="rd113" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td>1.14</td>
                                        <td>Have you:</td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>a &nbsp;&nbsp;&nbsp;Ever had malaria or an unexplained fever associated<br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;with travel?
                                        </td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="1.14aY" name="rd114a" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="1.14aN" name="rd114a" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>b &nbsp;&nbsp;&nbsp;Visited any malarial area in the last 12 months?<br />
                                        </td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="1.14bY" name="rd114b" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="1.14bN" name="rd114b" value="no" required="" /></td>
                                    </tr>
                                </table>
                                <table style="text-align: left; width: 51%; margin: auto">
                                    <tr>
                                        <td style="vertical-align: top">1.15</td>
                                        <td>When did you last travel to another region or country<br />
                                            (in months/years)?</td>
                                        <td style="vertical-align: top">
                                            <input type="text" id="1.15" name="rd115" required="" type="number"/></td>
                                    </tr>
                                </table>
                                <p style="font-size: 25px; font-style: bold; margin-left: -32%">
                                    <br />
                                    2 RISK ASSESSMENT
                                </p>
                                <table style="text-align: left; width: 51%; margin: auto">
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>YES</td>
                                        <td>NO</td>
                                    </tr>
                                    <tr>
                                        <td>2.1</td>
                                        <td>Is your reason for donating blood to undergo an HIV test?</td>
                                        <td>
                                            <input type="radio" id="2.1Y" name="rd21" value="yes" required="" /></td>
                                        <td>
                                            <input type="radio" id="2.1N" name="rd21" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td>2.2</td>
                                        <td>Have you ever been tested for HIV?</td>
                                        <td>
                                            <input type="radio" id="2.2Y" name="rd22" value="yes" required="" /></td>
                                        <td>
                                            <input type="radio" id="2.2N" name="rd22" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top;">2.3</td>
                                        <td>If "Yes" what was the reason?<br />
                                            <input type="radio" id="2.3VOL" name="rd23" value="voluntary" required="" onclick="CleanInputField()" />
                                            Voluntary
                                            <input type="radio" id="2.3EMP" name="rd23" value="employment" required="" onclick="CleanInputField()" />
                                            Employment
                                            <input type="radio" id="2.3INS" name="rd23" value="insurance" required="" onclick="CleanInputField()" />
                                            Insurance
                                            <input type="radio" id="2.3MED" name="rd23" value="medadvice" required="" onclick="CleanInputField()" />
                                            Medical Advice<br />
                                            Others 
                                            <input type="text" id="2.3OTH" name="rd23" required="" onchange="UncheckRadioIfTextIsClicked()" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top">2.4</td>
                                        <td>Have you ever had casual, oral or anal sex with someone whose<br />
                                            background you do not know, with or without a condom?<br />
                                        </td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="2.4Y" name="rd24" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="2.4N" name="rd24" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top">2.5</td>
                                        <td>Have you ever exchangeed money, drugs, goods or favours<br />
                                            in return for sex?<br />
                                        </td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="2.5Y" name="rd25" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="2.5N" name="rd25" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top">2.6</td>
                                        <td>Have you suffered from a sexually transmitted disease (STD):<br />
                                            e.g.syphilis, gonorrhoea, genital herpes, genital ulcer, VD, or 'drop'?<br />
                                        </td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="2.6Y" name="rd26" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="2.6N" name="rd26" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td>2.7</td>
                                        <td>In the past 12 months:</td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>a &nbsp;&nbsp;&nbsp;Has there been any change in your marital status?<br />
                                        </td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="2.7aY" name="rd27a" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="2.7aN" name="rd27a" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>b &nbsp;&nbsp;&nbsp;If sexually active, do you think any of the above questions (2.1-2.6)<br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;may be true for your sexual partner?</td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="2.7bY" name="rd27b" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="2.7bN" name="rd27b" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>c &nbsp;&nbsp;&nbsp;Have you been a victim of sexual abuse?<br />
                                        </td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="2.7cY" name="rd27c" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="2.7cN" name="rd27c" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top">2.8</td>
                                        <td>Have you or your sexual partner suffered from night sweats,<br>
                                            unintentional weight loss, diarrhea or swollen glands?<br>
                                        </td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="2.8Y" name="rd28" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="2.8N" name="rd28" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top">2.9</td>
                                        <td>Have you ever injected yourself or been injected with illegal or non-prescribed<br />
                                            drugs including body-building drugs or cosmetics (even if this was<br />
                                            only once or a long time ago)?</td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="2.9Y" name="rd29" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="2.9N" name="rd29" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top">2.10</td>
                                        <td>Have you been in contact with anyone with an infectious disease or in the<br />
                                            last 12 months have you had any immunizations, vaccinations or jabs?<br />
                                        </td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="2.10Y" name="rd210" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="2.10N" name="rd210" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top">2.11</td>
                                        <td>Have you ever been refused as a blood donor, or told not to donate<br>
                                            blood?<br>
                                        </td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="2.11Y" name="rd211" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <input type="radio" id="2.11N" name="rd211" value="no" required="" /></td>
                                    </tr>
                                </table>
                                <p style="font-size: 25px; font-style: bold; margin-left: -35%">
                                    <br />
                                    3 DECLARATION
                                </p>
                                <p style="font-size: 18px; font-style: bold; margin-left: 25%; text-align: left;">
                                    Please do not sign until you have answered all the questions and read the<br />
                                    declaration below.
                                </p>
                                <table style="text-align: left; width: 51%; margin: auto">
                                    <tr>
                                        <td>a &nbsp;&nbsp;&nbsp;I confirm that, to the best of my knowledge, I have answered all the<br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;questions accurately and I consider my blood safe for<br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;transfusion to a patient.</td>
                                    </tr>
                                    <tr>
                                        <td>b &nbsp;&nbsp;&nbsp;I understand that any wilful misrepresentation of facts could endanger<br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;my health or that of patients receiving my blood and may lead to<br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;litigation. I am aware that my blood will be screened for among<br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;others, HIV, hepatitis B, hepatitis C and syphilis. I understand that<br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;these screening tests are not diagnostic and may yield false-positive<br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;results. If any tests give a reactive result, I will be contacted<br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;using the information I have provided, and offered counselling.
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>c &nbsp;&nbsp;&nbsp;I understand the blood donation process, and I have been<br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;counseled regarding the importance of safe blood donation.<br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>d &nbsp;&nbsp;&nbsp;I confirm that I am over the age of 18 years.<br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>e &nbsp;&nbsp;&nbsp;I undertake that should there be any reason for my blood to be<br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;deemed unsafe for use at any age, I will inform the Blood Transfusion<br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Service.
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="card-footer text-muted">
                            <asp:Button runat="server" CssClass="btn btn-primary  btn-signin" Style="background: rgb(119,40,32);" ID="SubmitSurvey" Text="Submit Survey" OnClick="SubmitSurvey_Click" />
                            <br />
                            <p style="font-style: italic">Disclaimer: Before clicking Submit make sure the form is completely filled up.</p>
                            <asp:Button runat="server" CssClass="btn btn-primary  btn-signin" Style="background: rgb(119,40,32);" ID="BackButton" OnClick="BackButton_Click" Text="Back" type="reset" UseSubmitBehavior="false" AutoPostBack="true" />
                        </div>
                    </div>
                </div>
            </div>
            <footer class="bg-white sticky-footer">
                <div class="container my-auto">
                    <div class="text-center my-auto copyright"><span>Copyright © TechySavor 2022</span></div>
                </div>
            </footer>
        </div>
        <a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
    </form>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/bs-init.js"></script>
    <script src="assets/js/theme.js"></script>
</body>

</html>
