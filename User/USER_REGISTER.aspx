<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="USER_REGISTER.aspx.cs" Inherits="User.USER_REGISTER" %>

<!DOCTYPE html>

<html style="background: #772820;">

<head runat="server">
    <link rel="icon" runat="server" href="~/assets/img/321479999_548324667206662_5830804446592810955_n.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
    <title>Register | LifePoints</title>
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


        <script type = "text/javascript" >
                let email = document.getElementById("email")
        let password = document.getElementById("password")
        let verifyPassword = document.getElementById("verifyPassword")
        let submitBtn = document.getElementById("submitBtn")
        let emailErrorMsg = document.getElementById('emailErrorMsg')
        let passwordErrorMsg = document.getElementById('passwordErrorMsg')

        function displayErrorMsg(type, msg) {
            if (type == "email") {
                emailErrorMsg.style.display = "block"
                emailErrorMsg.innerHTML = msg
                submitBtn.disabled = true
            }
            else {
                passwordErrorMsg.style.display = "block"
                passwordErrorMsg.innerHTML = msg
                submitBtn.disabled = true
            }
        }

        function hideErrorMsg(type) {
            if (type == "email") {
                emailErrorMsg.style.display = "none"
                emailErrorMsg.innerHTML = ""
                submitBtn.disabled = true
                if (passwordErrorMsg.innerHTML == "")
                    submitBtn.disabled = false
            }
            else {
                passwordErrorMsg.style.display = "none"
                passwordErrorMsg.innerHTML = ""
                if (emailErrorMsg.innerHTML == "")
                    submitBtn.disabled = false
            }
        }
            function showHidePassword() {
                var x = document.getElementById("Password");
                var eye = document.getElementsByClassName("fa-eye")[0];
                if (x.type === "password") {
                    x.type = "text";
                } else {
                    x.type = "password";
                }
            }

            function showHidePassword() {
                var x = document.getElementById("Password");
                var icon = document.querySelector('.fa-eye');
                if (x.type === "password") {
                    x.type = "text";
                    icon.classList.add("view");
                } else {
                    x.type = "password";
                    icon.classList.remove("view");
                }
            }

        // Validate password upon change
        password.addEventListener("change", function () {

            // If password has no value, then it won't be changed and no error will be displayed
            if (password.value.length == 0 && verifyPassword.value.length == 0) hideErrorMsg("password")

            // If password has a value, then it will be checked. In this case the passwords don't match
            else if (password.value !== verifyPassword.value) displayErrorMsg("password", "Passwords do not match")

            // When the passwords match, we check the length
            else {
                // Check if the password has 8 characters or more
                if (password.value.length >= 8)
                    hideErrorMsg("password")
                else
                    displayErrorMsg("password", "Password must be at least 8 characters long")
            }
        })

        verifyPassword.addEventListener("change", function () {
            if (password.value !== verifyPassword.value)
                displayErrorMsg("password", "Passwords do not match")
            else {
                // Check if the password has 8 characters or more
                if (password.value.length >= 8)
                    hideErrorMsg("password")
                else
                    displayErrorMsg("password", "Password must be at least 8 characters long")
            }
        })

        // Validate email upon change
        email.addEventListener("change", function () {
            // Check if the email is valid using a regular expression (string@string.string)
            if (email.value.match(/^[^@]+@[^@]+\.[^@]+$/))
                hideErrorMsg("email")
            else
                displayErrorMsg("email", "Invalid email")
        });
    </script>

      <style>
        label[for="show-password"] {
        margin-top: 10px;
}

        .mb-3 {
        padding-top: 10px;
}
    </style>
</head>

<body style="background: rgb(119,40,32);">
    <form runat="server" class="container" style="position: absolute; left: 0; right: 0; top: 50%; transform: translateY(-50%); -ms-transform: translateY(-50%); -moz-transform: translateY(-50%); -webkit-transform: translateY(-50%); -o-transform: translateY(-50%);">
        <div class="row d-flex d-xl-flex justify-content-center justify-content-xl-center">
            <div class="col-sm-12 col-lg-10 col-xl-9 col-xxl-7 bg-white shadow-lg" style="border-radius: 5px;">
                <div class="p-5">
                    <div class="d-flex justify-content-xxl-center align-items-xxl-center">
                        <img class="img-fluid" src="assets/img/324620533_2986377338333052_6109802263453641588_n.png" width="300">
                    </div>
                    <div class="text-center">
                        <h4 class="text-dark mb-4" style="font-weight: bold;">Create an Account!</h4>
                    </div>
                    <div class="user" style="margin-bottom: 34px;">
                        <div class="mb-3">
                            <asp:TextBox runat="server" Class="form-control form-control-user" type="text" data-bs-toggle="tooltip" data-bss-tooltip="" ID="FirstName" placeholder="First Name*" required="*" style="width: 434.609px;" title="First Name" />
                        </div>
                        <div class="mb-3">
                            <asp:TextBox runat="server" Class="form-control form-control-user" type="text" data-bs-toggle="tooltip" data-bss-tooltip="" ID="MiddleName" placeholder="Middle Name" style="width: 434.609px;" title="Middle Name" />
                        </div>
                        <div class="mb-3">
                            <asp:TextBox runat="server" Class="form-control form-control-user" type="text" data-bs-toggle="tooltip" data-bss-tooltip="" ID="LastName" placeholder="Last Name*" required="*" style="width: 434.609px;" title="Last Name" />
                        </div>
                        <div class="mb-3">
                            <asp:TextBox runat="server" Class="form-control form-control-user" type="email" data-bs-toggle="tooltip" data-bss-tooltip="" ID="Email" placeholder="Email Address*" required="*" style="width: 434.609px;" inputmode="email" title="Email Address" />
                        </div>
                        <div class="mb-3">
                            
                                <asp:TextBox runat="server" Class="form-control form-control-user" type="password" data-bs-toggle="tooltip" data-bss-tooltip="" ID="Password" placeholder="Password" required="" Style="width: 434.609px;" title="Password" />
                              <label for="show-password">
                                    <input type="checkbox" id="show-password" onchange="showHidePassword()"> Show Password
                                </label>
                            
                            </div>
                        <div class="mb-3">
                                <asp:TextBox runat="server" Class="form-control form-control-user" type="password" data-bs-toggle="tooltip" data-bss-tooltip="" ID="RepeatPassword" placeholder="Confirm Password" required="" Style="width: 434.609px;" title="Repeat Password" />
                        </div>
                        <div class="row mb-3">
                            <p id="emailErrorMsg" class="text-danger" style="display: none;">Paragraph</p>
                            <p id="PasswordErrorMsg" class="text-danger" style="display: none;">Paragraph</p>
                        </div>
                        <asp:Button runat="server" ID="RegisterBtn" OnClick="RegisterBtn_Click" Class="btn btn-primary d-block btn-user w-100" Text="Register Account" UseSubmitBehavior="true" AutoPostBack="true" style="background: rgb(119,40,32);" />
                        <hr>
                    </div>
                    <div class="text-center"><a class="small" href="Login.aspx">Already have an account? Login!</a></div>
                </div>
            </div>
        </div>

    </form>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/bs-init.js"></script>
    <script src="assets/js/theme.js"></script>
</body>

</html>
