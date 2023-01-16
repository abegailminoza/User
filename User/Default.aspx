<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="User._Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" runat="server" href="~/assets/img/321479999_548324667206662_5830804446592810955_n.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
    <title>Login</title>
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

<body class="d-flex justify-content-xxl-center align-items-xxl-center" style="background: rgb(119,40,32); height: 100vh;">
    <form runat="server" class="container" style="width: 848px;">
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col d-flex justify-content-xxl-center align-items-xxl-center">
                        <img src="assets/img/321479999_548324667206662_5830804446592810955_n.png" style="height: 352px;" /></div>
                    <div class="col d-flex justify-content-xxl-center align-items-xxl-center">
                        <div>
                            <div class="text-center">
                                <h4 class="text-dark mb-4">Welcome back to LifePoints!</h4>
                            </div>
                            <div class="d-flex flex-column user" style="padding-bottom: 0px; margin-bottom: 40px;">
                                <div class="mb-3">
                                    <asp:TextBox runat="server" Class="form-control" type="email" ID="EmailAddress" placeholder="Email Address" name="email" style="border-radius: 5.6px !important;" required="" /></div>
                                <div class="mb-3">
                                    <asp:TextBox runat="server" Class="form-control" type="password" ID="Password" placeholder="Password" name="password" required="" /></div>
                                <div class="mb-3">
                                    <div class="custom-control custom-checkbox small"></div>
                                </div>
                                <hr style="margin-top: -12px;" />
                                <asp:Button runat="server" Text="Login" ID="LoginBtn" OnClick="LoginBtn_Click" UseSubmitBehavior="true" AutoPostBack="true" Class="btn btn-primary d-block btn-user w-100" type="submit" style="background: rgb(119,40,32); width: 319.609px;" />
                                <hr style="margin-top: 16px;" />
                                <a href="USER_REGISTER.aspx" style="font-size: 10px; text-align: center;">Don't Have an Account? Register.</a>
                                <a href="#" style="font-size: 10px; text-align: center; margin-top: 10px;">Login as Admin</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/bs-init.js"></script>
    <script src="assets/js/theme.js"></script>
</body>

</html>
