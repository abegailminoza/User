<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="USER_BLOGPOST.aspx.cs" Inherits="User.USER_BLOGPOST" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Dashboard - Brand</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Almarai&amp;display=swap">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/fontawesome5-overrides.min.css">
    <link rel="stylesheet" href="assets/css/Blog---Recent-Posts-styles.css">
    <link rel="stylesheet" href="assets/css/Blog---Recent-Posts.css">
    <link rel="stylesheet" href="assets/css/Bootstrap-Chat.css">
    <link rel="stylesheet" href="assets/css/Button-Outlines---Pretty.css">
    <link rel="stylesheet" href="assets/css/Chat.css">
    <link rel="stylesheet" href="assets/css/custom-buttons.css">
    <link rel="stylesheet" href="assets/css/Floating-Button.css">
    <link rel="stylesheet" href="assets/css/Ludens-basic-login.css">
    <link rel="stylesheet" href="assets/css/Ludens-Users---1-Login.css">
    <link rel="stylesheet" href="assets/css/Simple-Bootstrap-Chat.css">
</head>

<body id="page-top">
    <div id="wrapper">
        <nav class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0" style="background: rgb(119,40,32);color: var(--bs-red);">
            <div class="container-fluid d-flex flex-column p-0"><img src="assets/img/321479999_548324667206662_5830804446592810955_n.png" width="92" height="92" style="margin-top: 30px;"><a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
                    <div class="sidebar-brand-icon rotate-n-15"></div>
                    <div class="sidebar-brand-text mx-3"><span>LIFEPOINTS</span></div>
                </a>
                <hr class="sidebar-divider my-0">
                <ul class="navbar-nav text-light" id="accordionSidebar">
                    <li class="nav-item"><a class="nav-link" href="index.html"><i class="fas fa-tachometer-alt"></i><span>Blog Post</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="chat.html"><i class="fa fa-envelope-o"></i><span>Inbox</span></a><a class="nav-link" href="requestabloodtbl.html"><i class="fa fa-tint"></i><span>Request a Blood</span></a><a class="nav-link" href="becomeadonortbl.html"><i class="fa fa-heart"></i><span>Become a Blood Donor</span></a></li>
                    <li class="nav-item"></li>
                </ul>
                <div class="text-center d-none d-md-inline"></div>
            </div>
        </nav>
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
                <nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
                    <div class="container-fluid"><button class="btn btn-link d-md-none rounded-circle me-3" id="sidebarToggleTop" type="button"><i class="fas fa-plus"></i></button>
                        <ul class="navbar-nav flex-nowrap ms-auto">
                            <li class="nav-item dropdown d-sm-none no-arrow"><a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="#"><i class="fas fa-search"></i></a>
                                <div class="dropdown-menu dropdown-menu-end p-3 animated--grow-in" aria-labelledby="searchDropdown">
                                    <form class="me-auto navbar-search w-100">
                                        <div class="input-group"><input class="bg-light form-control border-0 small" type="text" placeholder="Search for ...">
                                            <div class="input-group-append"><button class="btn btn-primary py-0" type="button"><i class="fas fa-search"></i></button></div>
                                        </div>
                                    </form>
                                </div>
                            </li>
                            <li class="nav-item dropdown no-arrow mx-1">
                                <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="#"><span class="badge bg-danger badge-counter">3+</span><i class="fas fa-bell fa-fw"></i></a>
                                    <div class="dropdown-menu dropdown-menu-end dropdown-list animated--grow-in">
                                        <h6 class="dropdown-header" style="background: rgb(119,40,32);">NOTIFICATIONS</h6><a class="dropdown-item d-flex align-items-center" href="#">
                                            <div class="me-3">
                                                <div class="bg-primary icon-circle" style="background: var(--bs-indigo);border-color: var(--bs-blue);"><i class="fas fa-envelope-open text-white"></i></div>
                                            </div>
                                            <div><span class="small text-gray-500">January 12, 2013</span>
                                                <p>Your Blood Request has been approved!</p>
                                            </div>
                                        </a><a class="dropdown-item text-center small text-gray-500" href="#">Show All Notifications</a>
                                    </div>
                                </div>
                            </li>
                            <li class="nav-item dropdown no-arrow mx-1">
                                <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="#"><span class="badge bg-danger badge-counter">7</span><i class="fas fa-envelope fa-fw"></i></a>
                                    <div class="dropdown-menu dropdown-menu-end dropdown-list animated--grow-in">
                                        <h6 class="dropdown-header" style="background: rgb(119,40,32);">MESSAGES</h6><a class="dropdown-item d-flex align-items-center" href="#">
                                            <div class="dropdown-list-image me-3"><img class="rounded-circle" src="assets/img/avatars/avatar4.jpeg">
                                                <div class="bg-success status-indicator"></div>
                                            </div>
                                            <div class="fw-bold">
                                                <div class="text-truncate"><span>Hello</span></div>
                                                <p class="small text-gray-500 mb-0">Deya Vearl - 3m</p>
                                            </div>
                                        </a><a class="dropdown-item d-flex align-items-center" href="#">
                                            <div class="dropdown-list-image me-3"><img class="rounded-circle" src="assets/img/avatars/avatar2.jpeg">
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
                                <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="#"><span class="d-none d-lg-inline me-2 text-gray-600 small">User123</span><img class="border rounded-circle img-profile" src="assets/img/avatars/icons8-user-60.png"></a>
                                    <div class="dropdown-menu shadow dropdown-menu-end animated--grow-in"><a class="dropdown-item" href="profile.html"><i class="fas fa-user fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Profile</a><a class="dropdown-item" href="recentblog.html"><i class="fas fa-pen fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Manage Blog Post</a><a class="dropdown-item" href="#"><i class="fas fa-sign-out-alt fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Logout</a></div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
                <h1 style="padding-left: 50px;">Posts</h1>
                <div class="container-fluid">
                    <div class="row" style="height: 100%;">
                        <div class="col-7" style="padding-left: 40px;padding-right: 40px;overflow: auto;max-height: 500px;">
                            <div style="margin-bottom: 20px;">
                                <div class="card">
                                    <div class="card-header" style="padding-right: 30px;padding-left: 30px;">
                                        <div class="row">
                                            <div class="col-1 d-flex justify-content-xxl-center align-items-xxl-center" style="width: 72.8281px;"><img class="img-fluid" src="assets/img/user.png" style="width: 62.8281px;height: 57.5938px;margin-top: 6px;" width="45" height="74"></div>
                                            <div class="col">
                                                <div class="row d-flex flex-column">
                                                    <div class="col">
                                                        <h1 class="fs-3">User123</h1>
                                                    </div>
                                                    <div class="col">
                                                        <h3 class="text-lowercase fs-5">user123@mail.com</h3>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <p class="card-text">Nullam id dolor id nibh ultricies vehicula ut id elit. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus.</p>
                                    </div>
                                    <div class="card-footer">
                                        <div class="row" style="padding-right: 30px;padding-left: 30px;">
                                            <div class="col-1 d-flex justify-content-xxl-start align-items-xxl-center" style="width: fit-content;"><img class="img-fluid" width="20" height="20" src="assets/img/dislike.png"></div>
                                            <div class="col-2 d-flex align-items-xxl-center"><span style="font-weight: bold;color: rgb(119,40,32);">Text</span></div>
                                            <div class="col d-flex justify-content-xxl-end align-items-xxl-center"><img class="img-fluid" src="assets/img/reply.png" width="20"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col" style="padding-left: 50px;padding-right: 50px;">
                            <div>
                                <div class="card" style="height: 300px;">
                                    <div class="card-header" style="padding-right: 30px;padding-left: 30px;">
                                        <h1 style="font-size: 30px;">Compost Post</h1>
                                    </div>
                                    <div class="card-body"><textarea class="form-control-lg" name="Content" placeholder="Your Message..." spellcheck="true" required="" style="width: 100%;height: 100%;resize:none;border:none;"></textarea></div>
                                    <div class="card-footer">
                                        <div class="row" style="padding-right: 30px;padding-left: 30px;">
                                            <div class="col d-flex justify-content-xxl-end align-items-xxl-center"><button class="btn btn-primary" type="button" style="background: rgb(119,40,32);">POST</button></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="card" style="height: 300px;">
                                    <div class="card-header" style="padding-right: 30px;padding-left: 30px;">
                                        <div class="row">
                                            <div class="col-xl-8 d-flex justify-content-xxl-start align-items-xxl-center">
                                                <h6 class="fs-4" style="font-size: 30px;">Compost Private Message</h6>
                                            </div>
                                            <div class="col-1 col-xl-3 d-flex justify-content-xxl-center align-items-xxl-center" style="padding-right: 0px;padding-left: 15px;"><img src="assets/img/close.png" width="52" height="52" style="margin-left: 22px;"></div>
                                        </div>
                                    </div>
                                    <div class="card-body"><input type="hidden" id="ReceiverID"><textarea class="form-control-lg" name="Content" placeholder="Your Message..." spellcheck="true" required="" style="width: 100%;height: 100%;resize:none;border:none;"></textarea></div>
                                    <div class="card-footer">
                                        <div class="row" style="padding-right: 30px;padding-left: 30px;">
                                            <div class="col d-flex justify-content-xxl-end align-items-xxl-center"><button class="btn btn-primary" type="button" style="background: rgb(119,40,32);">Send Private Message</button></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="bg-white sticky-footer">
                <div class="container my-auto">
                    <div class="text-center my-auto copyright"><span>Copyright © TechySavor 2022</span></div>
                </div>
            </footer>
        </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
    </div>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/bs-init.js"></script>
    <script src="assets/js/theme.js"></script>
</body>

</html>
