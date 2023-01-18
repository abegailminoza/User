﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="USER_DONOR_SURVEY_FORM_VIEW.aspx.cs" Inherits="User.USER_DONOR_SURVEY_FORM_VIEW" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" runat="server" href="~/assets/img/321479999_548324667206662_5830804446592810955_n.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
    <title>Donor Survey Form</title>
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
        function SetAttributesReadOnly() {
            var items = document.getElementsByTagName("input");

            for (var i = 0; i < items.length; i++) {
                if (items[i].type !== "button") {

                    items[i].setAttribute("disabled", "");
                }
            }
        }
    </script>
</head>

<body id="page-top"  onload="SetAttributesReadOnly()">
    <form runat="server" id="wrapper">
        <nav class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0" style="background: rgb(119,40,32); color: var(--bs-red);">
            <div class="container-fluid d-flex flex-column p-0">
                <img src="assets/img/321479999_548324667206662_5830804446592810955_n.png" width="92" height="92" style="margin-top: 30px;" /><a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
                    <div class="sidebar-brand-icon rotate-n-15"></div>
                    <div class="sidebar-brand-text mx-3"><span>LIFEPOINTS</span></div>
                </a>
                <hr class="sidebar-divider my-0" />
                <ul class="navbar-nav text-light" id="accordionSidebar">
                    <li class="nav-item"><a class="nav-link active" href="USER_BLOGPOST.aspx"><i class="fas fa-tachometer-alt"></i><span>Blog Post</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="USER_CHAT.aspx"><i class="fa fa-envelope-o"></i><span>Inbox</span></a></li>
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
                                    <a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="#"><span class="badge bg-danger badge-counter">3+</span><i class="fas fa-bell fa-fw"></i></a>
                                    <div class="dropdown-menu dropdown-menu-end dropdown-list animated--grow-in">
                                        <h6 class="dropdown-header" style="background: rgb(119,40,32);">NOTIFICATIONS</h6>
                                        <a class="dropdown-item d-flex align-items-center" href="#">
                                            <div class="me-3">
                                                <div class="bg-primary icon-circle" style="background: var(--bs-indigo); border-color: var(--bs-blue);"><i class="fas fa-envelope-open text-white"></i></div>
                                            </div>
                                            <div>
                                                <span class="small text-gray-500">January 12, 2013</span>
                                                <p>Your Blood Request has been approved!</p>
                                            </div>
                                        </a><a class="dropdown-item text-center small text-gray-500" href="#">Show All Notifications</a>
                                    </div>
                                </div>
                            </li>
                            <li class="nav-item dropdown no-arrow mx-1">
                                <div class="nav-item dropdown no-arrow">
                                    <a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="#"><span class="badge bg-danger badge-counter">7</span><i class="fas fa-envelope fa-fw"></i></a>
                                    <div class="dropdown-menu dropdown-menu-end dropdown-list animated--grow-in">
                                        <h6 class="dropdown-header" style="background: rgb(119,40,32);">MESSAGES</h6>
                                        <a class="dropdown-item d-flex align-items-center" href="#">
                                            <div class="dropdown-list-image me-3">
                                                <img class="rounded-circle" src="assets/img/avatars/avatar4.jpeg">
                                                <div class="bg-success status-indicator"></div>
                                            </div>
                                            <div class="fw-bold">
                                                <div class="text-truncate"><span>Hello</span></div>
                                                <p class="small text-gray-500 mb-0">Deya Vearl - 3m</p>
                                            </div>
                                        </a><a class="dropdown-item d-flex align-items-center" href="#">
                                            <div class="dropdown-list-image me-3">
                                                <img class="rounded-circle" src="assets/img/avatars/avatar2.jpeg">
                                                <div class="status-indicator"></div>
                                            </div>
                                            <div class="fw-bold">
                                                <div class="text-truncate"><span>Hi</span></div>
                                                <p class="small text-gray-500 mb-0">Abegail Minoza - 14m</p>
                                            </div>
                                        </a><a class="dropdown-item text-center small text-gray-500" href="#">Show All Messages</a>
                                        <div class="dropdown-divider"></div>
                                    </div>
                                </div>
                                <div class="shadow dropdown-list dropdown-menu dropdown-menu-end" aria-labelledby="alertsDropdown"></div>
                            </li>
                            <div class="d-none d-sm-block topbar-divider"></div>
                            <li class="nav-item dropdown no-arrow">
                                <div class="nav-item dropdown no-arrow">
                                    <a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="#"><span class="d-none d-lg-inline me-2 text-gray-600 small" runat="server" id="Username"></span><img class="border rounded-circle img-profile" src="assets/img/avatars/icons8-user-60.png" /></a>
                                    <div class="dropdown-menu shadow dropdown-menu-end animated--grow-in"><a class="dropdown-item" href="USER_PROFILE.aspx"><i class="fas fa-user fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Profile</a><a class="dropdown-item" href="recentblog.html"><i class="fas fa-pen fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Manage Blog Post</a><a class="dropdown-item" href="#"><i class="fas fa-sign-out-alt fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Logout</a></div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
                <div class="container-fluid d-flex" style="justify-content: center; align-items: center;">
                    <div class="card text-center" style="max-height: 500px; height: 500px; width: 80%;">
                        <div class="card-header">
                            <h2>BLOOD TRANSFUSION SERVICE</h2>
                            <h3>DONOR QUESTIONNAIRE</h3>
                        </div>
                        <div class="card-body">
                            <div style="max-height: 300px; overflow: auto;">
                                <p style="font-size: 25px; font-style: bold; margin-left: -30%">
                                    Please complete this form
                                </p>
                                <table style="text-align: left; width: 50%; margin: auto">
                                    <tr>
                                        <td>Panel name:</td>
                                        <td>
                                            <input type="text" id="panelname" name="panelname" required="" value=" <%=ViewState["panelname"] %>" /></td>
                                        <td>Donor name:</td>
                                        <td>
                                            <input type="text" id="donorname" name="donorname" required="" value=" <%=ViewState["donorname"] %>" /></td>
                                    </tr>
                                    <tr>
                                        <td>Family name:</td>
                                        <td>
                                            <input type="text" id="familyname" name="familyname" required="" value=" <%=ViewState["familyname"] %>" /></td>
                                        <td>First name:</td>
                                        <td>
                                            <input type="text" id="firstname" name="firstname" required="" value=" <%=ViewState["firstname"] %>" /></td>
                                    </tr>
                                    <tr>
                                        <td>Title:</td>
                                        <td>
                                            <input type="text" id="title" name="title" required="" value=" <%=ViewState["title"] %>" /></td>
                                        <td>ID No:&nbsp;</td>
                                        <td>
                                            <input type="text" id="idno" name="idno" required="" value=" <%=ViewState["idno"] %>" /></td>
                                    </tr>
                                    <tr>
                                        <td>Date of birth:</td>
                                        <td>
                                            <input type="text" id="dob" name="dob" required="" value=" <%=ViewState["dob"] %>" /></td>
                                        <td>Gender:</td>
                                        <td>
                                            <input type="text" id="gender" name="gender" required="" value=" <%=ViewState["gender"] %>" /></td>
                                    </tr>
                                    <tr>
                                        <td>Occupation:</td>
                                        <td>
                                            <input type="text" id="occupation" name="occupation" required="" value=" <%=ViewState["occupation"] %>" /></td>
                                    </tr>
                                    <tr>
                                        <td>Residential Address:</td>
                                        <td>
                                            <input type="text" id="resaddress" name="resaddress" required="" value=" <%=ViewState["resaddress"] %>" /></td>
                                    </tr>
                                    <tr>
                                        <td>Postal Address:</td>
                                        <td>
                                            <input type="text" id="posaddress" name="posaddress" required="" value=" <%=ViewState["posaddress"] %>" /></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <br />
                                            Telephone No.</td>
                                    </tr>
                                    <tr>
                                        <td>Home:</td>
                                        <td>
                                            <input type="text" id="home" name="home" required="" value=" <%= ViewState["home"] %>" /></td>
                                        <td>Work:</td>
                                        <td>
                                            <input type="text" id="work" name="work" required="" value=" <%= ViewState["work"] %>" /></td>
                                    </tr>
                                    <tr>
                                        <td>Mobile:</td>
                                        <td>
                                            <input type="text" id="mobile" name="mobile" required="" value=" <%= ViewState["mobile"] %>" /></td>
                                    </tr>
                                    <tr>
                                        <td>Email Address:</td>
                                        <td>
                                            <input type="text" id="email" name="email" required="" value=" <%=ViewState["email"] %>" /></td>
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
                                            <asp:RadioButton runat="server" type="radio" ID="rd11n" GroupName="rd11" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td>1.2</td>
                                        <td>In the last 4 hours, have you had a meal or snack?</td>
                                        <td>
                                            <asp:RadioButton runat="server" GroupName="rd12" type="radio" ID="rd12y" name="rd12" value="yes" required="" /></td>
                                        <td>
                                            <asp:RadioButton runat="server" GroupName="rd12" type="radio" ID="rd12n" name="rd12" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td>1.3</td>
                                        <td>Have you already given blood in the last 16 weeks?</td>
                                        <td>
                                            <asp:RadioButton runat="server" GroupName="rd13" type="radio" ID="rd13y" name="rd13" value="yes" required="" /></td>
                                        <td>
                                            <asp:RadioButton runat="server" GroupName="rd13" type="radio" ID="rd13n" name="rd13" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td>1.4</td>
                                        <td>Have you got a chesty cough, sore throat or active cold sore?</td>
                                        <td>
                                            <asp:RadioButton runat="server" GroupName="rd14" type="radio" ID="rd14y" name="rd14" value="yes" required="" /></td>
                                        <td>
                                            <asp:RadioButton runat="server" GroupName="rd14" type="radio" ID="rd14n" name="rd14" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td>1.5</td>
                                        <td>Are you pregnant or breastfeeding?</td>
                                        <td>
                                            <asp:RadioButton runat="server" GroupName="rd15" type="radio" ID="rd15y" name="rd15" value="yes" required="" /></td>
                                        <td>
                                            <asp:RadioButton runat="server" GroupName="rd15" type="radio" ID="rd15n" name="rd15" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td>1.6</td>
                                        <td>Do you have or have you ever had:</td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>a &nbsp;&nbsp;&nbsp;Chest pains, heart disease/surgery or stroke?</td>
                                        <td>
                                            <asp:RadioButton runat="server" GroupName="rd16a" type="radio" ID="rd16ay" name="rd16a" value="yes" required="" /></td>
                                        <td>
                                            <asp:RadioButton runat="server" GroupName="rd16a" type="radio" ID="rd16an" name="rd16a" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>b &nbsp;&nbsp;&nbsp;Lung disease, tuberculosis or asthma?</td>
                                        <td>
                                            <asp:RadioButton runat="server" GroupName="rd16b" type="radio" ID="rd16by" name="rd16b" value="yes" required="" /></td>
                                        <td>
                                            <asp:RadioButton runat="server" GroupName="rd16b" type="radio" ID="rd16bn" name="rd16b" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>c &nbsp;&nbsp;&nbsp;Cancer, a blood disease, an abnormal bleeding disorder,<br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;or a bleeding gastric ulcer or duodenal ulcer?
                                        </td>
                                        <td style="vertical-align: top">
                                            <asp:RadioButton runat="server" GroupName="rd16c" type="radio" ID="rd16cy" name="rd16c" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <asp:RadioButton runat="server" GroupName="rd16c" type="radio" ID="rd16cn" name="rd16c" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>d &nbsp;&nbsp;&nbsp;Diabetes, thyroid disease, kidney disease, epilipsy (fits)?</td>
                                        <td>
                                            <asp:RadioButton runat="server" GroupName="rd16d" type="radio" ID="rd16dy" name="rd16d" value="yes" required="" /></td>
                                        <td>
                                            <asp:RadioButton runat="server" GroupName="rd16d" type="radio" ID="rd16dn" name="rd16d" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top">1.7</td>
                                        <td>In the last 7 days, have you seen a doctor, dentist, or any other<br />
                                            healthcare professional or are you waiting to see one<br />
                                            (except for routine screening appointments)?</td>
                                        <td style="vertical-align: top">
                                            <asp:RadioButton runat="server" GroupName="rd17" type="radio" ID="rd17y" name="rd17" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <asp:RadioButton runat="server" GroupName="rd17" type="radio" ID="rd17n" name="rd17" value="no" required="" /></td>
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
                                            <asp:RadioButton runat="server" GroupName="rd18a" type="radio" ID="rd18ay" name="rd18a" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <asp:RadioButton runat="server" GroupName="rd18a" type="radio" ID="rd18an" name="rd18a" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>b &nbsp;&nbsp;&nbsp;Have you been under a doctor's care, undergone surgery,<br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;or a diagnostic procedure, suffered a major illness, or been<br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;involved in a serious accident?
                                        </td>
                                        <td style="vertical-align: top">
                                            <asp:RadioButton runat="server" GroupName="rd18b" type="radio" ID="rd18by" name="rd18b" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <asp:RadioButton runat="server" GroupName="rd18b" type="radio" ID="rd18bn" name="rd18b" value="no" required="" /></td>
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
                                            <asp:RadioButton runat="server" GroupName="rd19a" type="radio" ID="rd19ay" name="rd19a" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <asp:RadioButton runat="server" GroupName="rd19a" type="radio" ID="rd19an" name="rd19a" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>b &nbsp;&nbsp;&nbsp;Have you ever had hepatitis B or hepatitis C or think you<br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;may have hepatitis now?<br />
                                        </td>
                                        <td style="vertical-align: top">
                                            <asp:RadioButton runat="server" GroupName="rd19b" type="radio" ID="rd19by" name="rd19b" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <asp:RadioButton runat="server" GroupName="rd19b" type="radio" ID="rd19bn" name="rd19b" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>c &nbsp;&nbsp;&nbsp;In the past 12 months, have you been tattoed, had ear or body<br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;piercing, acupuncture, circumcision or scarification, cosmetic<br>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;treatment?<br>
                                        </td>
                                        <td style="vertical-align: top">
                                            <asp:RadioButton runat="server" GroupName="rd19c" type="radio" ID="rd19cy" name="rd19c" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <asp:RadioButton runat="server" GroupName="rd19c" type="radio" ID="rd19cn" name="rd19c" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top">1.10</td>
                                        <td>In the past 12 months, have you or your sexual partner<br />
                                            received blood transfusion?</td>
                                        <td style="vertical-align: top">
                                            <asp:RadioButton runat="server" GroupName="rd110" type="radio" ID="rd110y" name="rd110" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <asp:RadioButton runat="server" GroupName="rd110" type="radio" ID="rd110n" name="rd110" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top">1.11</td>
                                        <td>Have you or your sexual partner been treated with human or<br />
                                            animal blood products or clotting factors?</td>
                                        <td style="vertical-align: top">
                                            <asp:RadioButton runat="server" GroupName="rd111" type="radio" ID="rd111y" name="rd111" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <asp:RadioButton runat="server" GroupName="rd111" type="radio" ID="rd111n" name="rd111" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top">1.12</td>
                                        <td>Have you ever had injections of human pituitary growth hormone,<br />
                                            pituitary gonadotrophin (fertility medicine) or seen a neurosurgeon<br />
                                            or neurologist?</td>
                                        <td style="vertical-align: top">
                                            <asp:RadioButton runat="server" GroupName="rd112" type="radio" ID="rd112y" name="rd112" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <asp:RadioButton runat="server" GroupName="rd112" type="radio" ID="rd112n" name="rd112" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top">1.13</td>
                                        <td>Have you or your close relatives had an unexplained neurological<br />
                                            condition or been diagnosed with Creutzfeldt-Jacob Disease or<br />
                                            'mad cow disease'?</td>
                                        <td style="vertical-align: top">
                                            <asp:RadioButton runat="server" GroupName="rd113" type="radio" ID="rd113y" name="rd113" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <asp:RadioButton runat="server" GroupName="rd113" type="radio" ID="rd113n" name="rd113" value="no" required="" /></td>
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
                                            <asp:RadioButton runat="server" GroupName="rd114a" type="radio" ID="rd114ay" name="rd114a" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <asp:RadioButton runat="server" GroupName="rd114a" type="radio" ID="rd114an" name="rd114a" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>b &nbsp;&nbsp;&nbsp;Visited any malarial area in the last 12 months?<br />
                                        </td>
                                        <td style="vertical-align: top">
                                            <asp:RadioButton runat="server" GroupName="rd114b" type="radio" ID="rd114by" name="rd114b" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <asp:RadioButton runat="server" GroupName="rd114b" type="radio" ID="rd114bn" name="rd114b" value="no" required="" /></td>
                                    </tr>
                                </table>
                                <table style="text-align: left; width: 51%; margin: auto">
                                    <tr>
                                        <td style="vertical-align: top">1.15</td>
                                        <td>When did you last travel to another region or country<br />
                                            (in months/years)?</td>
                                        <td style="vertical-align: top">
                                            <input type="text" id="1.15" name="rd115" required="" value=" <%=ViewState["rd115"] %>" /></td>
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
                                            <asp:RadioButton runat="server" GroupName="rd21" type="radio" ID="rd21y" name="rd21" value="yes" required="" /></td>
                                        <td>
                                            <asp:RadioButton runat="server" GroupName="rd21" type="radio" ID="rd21n" name="rd21" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td>2.2</td>
                                        <td>Have you ever been tested for HIV?</td>
                                        <td>
                                            <asp:RadioButton runat="server" GroupName="rd22" type="radio" ID="rd22y" name="rd22" value="yes" required="" /></td>
                                        <td>
                                            <asp:RadioButton runat="server" GroupName="rd22" type="radio" ID="rd22n" name="rd22" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top;">2.3</td>
                                        <td>If "Yes" what was the reason?<br />
                                            <asp:RadioButton runat="server" GroupName="rd23" type="radio" ID="rd23VOL" name="rd23" value="voluntary" required="" onclick="CleanInputField()" />Voluntary
                                            <asp:RadioButton runat="server" GroupName="rd23" type="radio" ID="rd23EMP" name="rd23" value="employment" required="" onclick="CleanInputField()" />Employment
                                            <asp:RadioButton runat="server" GroupName="rd23" type="radio" ID="rd23INS" name="rd23" value="insurance" required="" onclick="CleanInputField()" />Insurance
                                            <asp:RadioButton runat="server" GroupName="rd23" type="radio" ID="rd23MED" name="rd23" value="medadvice" required="" onclick="CleanInputField()" />Medical Advice<br />
                                            Others
                                            <input type="text" id="2.3OTH" name="rd23" required="" onchange="UncheckRadioIfTextIsClicked()" value="<%=ViewState["rd23"] %>" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top">2.4</td>
                                        <td>Have you ever had casual, oral or anal sex with someone whose<br />
                                            background you do not know, with or without a condom?<br />
                                        </td>
                                        <td style="vertical-align: top">
                                            <asp:RadioButton runat="server" GroupName="rd24" type="radio" ID="rd24y" name="rd24" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <asp:RadioButton runat="server" GroupName="rd24" type="radio" ID="rd24n" name="rd24" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top">2.5</td>
                                        <td>Have you ever exchangeed money, drugs, goods or favours<br />
                                            in return for sex?<br />
                                        </td>
                                        <td style="vertical-align: top">
                                            <asp:RadioButton runat="server" GroupName="rd25" type="radio" ID="rd25y" name="rd25" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <asp:RadioButton runat="server" GroupName="rd25" type="radio" ID="rd25n" name="rd25" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top">2.6</td>
                                        <td>Have you suffered from a sexually transmitted disease (STD):<br />
                                            e.g.syphilis, gonorrhoea, genital herpes, genital ulcer, VD, or 'drop'?<br />
                                        </td>
                                        <td style="vertical-align: top">
                                            <asp:RadioButton runat="server" GroupName="rd26" type="radio" ID="rd26y" name="rd26" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <asp:RadioButton runat="server" GroupName="rd26" type="radio" ID="rd26n" name="rd26" value="no" required="" /></td>
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
                                            <asp:RadioButton runat="server" GroupName="rd27a" type="radio" ID="rd27ay" name="rd27a" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <asp:RadioButton runat="server" GroupName="rd27a" type="radio" ID="rd27an" name="rd27a" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>b &nbsp;&nbsp;&nbsp;If sexually active, do you think any of the above questions (2.1-2.6)<br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;may be true for your sexual partner?</td>
                                        <td style="vertical-align: top">
                                            <asp:RadioButton runat="server" GroupName="rd27b" type="radio" ID="rd27by" name="rd27b" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <asp:RadioButton runat="server" GroupName="rd27b" type="radio" ID="rd27bn" name="rd27b" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>c &nbsp;&nbsp;&nbsp;Have you been a victim of sexual abuse?<br />
                                        </td>
                                        <td style="vertical-align: top">
                                            <asp:RadioButton runat="server" GroupName="rd27c" type="radio" ID="rd27cy" name="rd27c" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <asp:RadioButton runat="server" GroupName="rd27c" type="radio" ID="rd27cn" name="rd27c" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top">2.8</td>
                                        <td>Have you or your sexual partner suffered from night sweats,<br />
                                            unintentional weight loss, diarrhea or swollen glands?<br />
                                        </td>
                                        <td style="vertical-align: top">
                                            <asp:RadioButton runat="server" GroupName="rd28" type="radio" ID="rd28y" name="rd28" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <asp:RadioButton runat="server" GroupName="rd28" type="radio" ID="rd28n" name="rd28" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top">2.9</td>
                                        <td>Have you ever injected yourself or been injected with illegal or non-prescribed<br />
                                            drugs including body-building drugs or cosmetics (even if this was<br />
                                            only once or a long time ago)?</td>
                                        <td style="vertical-align: top">
                                            <asp:RadioButton runat="server" GroupName="rd29" type="radio" ID="rd29y" name="rd29" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <asp:RadioButton runat="server" GroupName="rd29" type="radio" ID="rd29n" name="rd29" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top">2.10</td>
                                        <td>Have you been in contact with anyone with an infectious disease or in the<br />
                                            last 12 months have you had any immunizations, vaccinations or jabs?<br />
                                        </td>
                                        <td style="vertical-align: top">
                                            <asp:RadioButton runat="server" GroupName="rd210" type="radio" ID="rd210y" name="rd210" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <asp:RadioButton runat="server" GroupName="rd210" type="radio" ID="rd210n" name="rd210" value="no" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top">2.11</td>
                                        <td>Have you ever been refused as a blood donor, or told not to donate<br />
                                            blood?<br />
                                        </td>
                                        <td style="vertical-align: top">
                                            <asp:RadioButton runat="server" GroupName="rd211" type="radio" ID="rd211y" name="rd211" value="yes" required="" /></td>
                                        <td style="vertical-align: top">
                                            <asp:RadioButton runat="server" GroupName="rd211" type="radio" ID="rd211n" name="rd211" value="no" required="" /></td>
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
                            <a class="btn btn-primary  btn-signin" style="background: rgb(119,40,32);" id="BackButton" href="USER_BECOMEADONOR.aspx" >Back</a>
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
