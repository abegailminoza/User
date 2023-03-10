<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="USER_REQUEST_SURVEY_FORM.aspx.cs" Inherits="User.USER_REQUEST_SURVEY_FORM" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" runat="server" href="~/assets/img/321479999_548324667206662_5830804446592810955_n.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
    <title>Blood Request Form | LifePoints</title>
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
                                                    <asp:LinkButton runat="server" ID="ViewNotifBtn" CommandName="ViewNotif" CommandArgument='<%# Eval("NTF_ID") %>' CssClass="dropdown-item d-flex align-items-center">
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
                    <div class="card text-center" style="max-height: 1100px; height: 1000px; width: 70%;">
                        <div class="card-header">
                            <h2>BLOOD REQUEST FORM</h2>
                            
                        </div>
                        <div class="card-body">
                            <div style="max-height: 900px; overflow: auto;">
                                <p style="font-size: 25px; font-style: bold; margin-left: -30%">
                                    Please complete this form
                                </p>
                                <table style="text-align: left; width: 77%; margin: auto">
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
                                        <td>Gender:</td>
                                        <td>
                                            <asp:DropDownList ID="Sex" runat="server" Class="form-control">
                                                <asp:ListItem>Female</asp:ListItem>
                                                <asp:ListItem>Male</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        
                                    </tr>
                                    <tr>
                                        <td></td>
                                    </tr>
                                    <tr><td>Date of birth:</td></tr>
                                    <tr>
                                        <td>Month:</td>
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

                                        <td>Day:</td>
                                        <td>
                                            <asp:TextBox runat="server" Class="form-control" type="number" ID="day" name="dateofbirth" required="" />

                                        </td>
                                        </tr>
                                    <tr>
                                        <td>Year:</td>
                                        <td>
                                            <asp:TextBox runat="server" Class="form-control" type="year" ID="year" name="dateofbirth" required="" /></td>
                                         
                                    </tr>
                                    <tr>
                                        <td></td>
                                    </tr>
                                   
                                    
                                    <tr>
                                        <td>Blood Type Request:</td>
                                        <td>
                                            <asp:DropDownList ID="Bloodtype" runat="server" Class="form-control" >
                                                <asp:ListItem Value="Aplus">A+</asp:ListItem>
                                                <asp:ListItem Value="Anega">A-</asp:ListItem>
                                                <asp:ListItem Value="Bplus">B+</asp:ListItem>
                                                <asp:ListItem Value="Bnega">B-</asp:ListItem>
                                                <asp:ListItem Value="ABplus">AB+</asp:ListItem>
                                                <asp:ListItem Value="ABnega">AB-</asp:ListItem>
                                                <asp:ListItem Value="Oplus">O+</asp:ListItem>
                                                <asp:ListItem Value="Onega">O-</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                            
                                     </tr>
                                    <tr>
                                        <td>
                                            <br />
                                            Residential Address:.</td>
                                    </tr>
                                    <tr>
                                        

                                        <td>Street/Sector: </td>
                                        <td>
                                            <asp:TextBox runat="server" Class="form-control" type="text" ID="street" name="resaddress" required="" ></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>Barangay:</td>
                                        <td>
                                            <asp:TextBox runat="server"  Class="form-control" type="text" ID="barangay" name="posaddress" required="" ></asp:TextBox></td>
                                    </tr>
                                     <tr>
                                        <td>City:</td>
                                        <td>
                                            <asp:TextBox runat="server"  Class="form-control" type="text" ID="city" name="city" required="" ></asp:TextBox></td>
                                    </tr>
                                     <tr>
                                        <td>Province:</td>
                                        <td>
                                            <asp:TextBox runat="server"  Class="form-control" type="text" ID="province" name="posaddress" required="" /></td>
                                    </tr>
                                    <tr>
                                        <td>ZIP Code:</td>
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
                                    <tr>
                                        <td></td>
                                        <td></td>
                                             </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        </tr>
                                </table>
                            </div>
                        </div>
                        <div class="card-footer text-muted">
                            <asp:Button runat="server" CssClass="btn btn-primary  btn-signin" Style="background: rgb(119,40,32);" ID="SubmitSurvey" OnClick="SubmitSurvey_Click" Text="Submit Survey" type="submit" UseSubmitBehavior="true" AutoPostBack="true" />
                            <asp:Button runat="server" CssClass="btn btn-primary  btn-signin" Style="background: rgb(119,40,32);" Visible="false" ID="BackButton" OnClick="BackButton_Click" Text="Back" type="reset" UseSubmitBehavior="false" AutoPostBack="true" />
                            <br />
                            <p style="font-style: italic">Disclaimer: Before clicking Submit make sure the form is completely filled up.</p>
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
