<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+ "://"+request.getServerName()+":"+ request.getServerPort()+path+"/";
%>
<!doctype html>
<html lang="en">
<head>

    <meta charset="utf-8"/>
    <title>Register</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- App favicon -->
    <link rel="shortcut icon" href="<%=basePath%>assets/images/favicon.ico">

    <!-- sweet alert -->
    <link href="<%=basePath%>assets/libs/sweetalert2/sweetalert2.min.css" rel="stylesheet" type="text/css">
    <!-- Bootstrap Css -->
    <link href="<%=basePath%>assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css"/>
    <!-- Icons Css -->
    <link href="<%=basePath%>assets/css/icons.min.css" rel="stylesheet" type="text/css"/>
    <!-- App Css-->
    <link href="<%=basePath%>assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css"/>

</head>

<body class="auth-body-bg">
<div class="bg-overlay"></div>
<div class="wrapper-page">
    <div class="container-fluid p-0">
        <div class="card">
            <div class="card-body">
                <div class="text-center mt-4">
                    <div class="mb-3">
                        <img src="<%=basePath%>assets/images/logo-dark.png" height="30" class="logo-dark mx-auto" alt="">
                        <img src="<%=basePath%>assets/images/logo-light.png" height="30" class="logo-light mx-auto" alt="">
                        </a>
                    </div>
                </div>

                <h4 class="text-muted text-center font-size-18"><b>Register</b></h4>

                <div class="p-3">
                    <form class="form-horizontal mt-3" method="post"
                          action="${pageContext.request.contextPath}/registerServlet" id="myFormID"
                          onkeyup="return validateInput();">

                        <div class="form-group mb-3 row">
                            <div class="col-6">
                                <input class="form-control" name="firstname" pattern="[a-zA-Z]{2,}" id="firstname"
                                       type="text" placeholder="First Name" required>
                                <div><small id="name_error"></small></div>
                            </div>
                            <div class="col-6">
                                <input class="form-control" name="lastname" pattern="[a-zA-Z]{2,}" id="lastname"
                                       type="text" placeholder="Last Name" required>
                            </div>
                        </div>

                        <div class="form-group mb-3 row">
                            <div class="col-12">
                                <input class="form-control" name="username" type="text" id="username"
                                       placeholder="Username" pattern="[A-Za-z0-9]{3,}" required
                                       onchange="validateUsername(this);">
                                <div><span id="usernameExistMsg"></span></div>
                            </div>
                        </div>

                        <div class="form-group mb-3 row">
                            <div class="col-12">
                                <input class="form-control" name="email" type="email" id="email" placeholder="Email"
                                       pattern="[A-Za-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required
                                       onchange="validateEmail(this);">
                                <div><span id="emailExistMsg"></span></div>
                            </div>
                        </div>
                        <div class="form-group mb-3 row">
                            <div class="col-12">
                                <!--pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" -->
                                <input class="form-control" name="password" id="password" type="password"
                                       placeholder="Password" required>
                                <div><span id="pwdError"></span></div>
                            </div>
                        </div>

                        <div class="form-group mb-3 row">
                            <div class="col-12">
                                <!--pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" -->
                                <input class="form-control" name="confirmPassword" id="confirmPassword" type="password"
                                       placeholder="Confirm Password" required>
                                <div><span id="confirmPwdError"></span></div>
                            </div>
                        </div>

                        <div class="form-group mb-3 row">
                            <div class="col-12">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="customCheck1">
                                    <label class="form-label ms-1 fw-normal" for="customCheck1">I accept <a href="#"
                                                                                                            class="text-muted">Terms
                                        and Conditions</a></label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group text-center row mt-3 pt-1">
                            <div class="col-12">
                                <button class="btn btn-info w-100 waves-effect waves-light" type="submit"
                                        id="btn_adduser" disabled>Register
                                </button>
                            </div>
                        </div>

                        <div class="form-group mt-2 mb-0 row">
                            <div class="col-12 mt-3 text-center">Already have account?
                                <a href="<%=basePath%>/User/login.jsp" class="text-muted text-decoration-underline">Login</a>
                            </div>
                        </div>
                    </form>
                    <!-- end form -->
                </div>
            </div>
            <!-- end cardbody -->
        </div>
        <!-- end card -->
    </div>
    <!-- end container -->
</div>
<!-- end -->
<!-- JAVASCRIPT -->
<script src="<%=basePath%>assets/libs/jquery/jquery.min.js"></script>
<script src="<%=basePath%>assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="<%=basePath%>assets/libs/metismenu/metisMenu.min.js"></script>
<script src="<%=basePath%>assets/libs/simplebar/simplebar.min.js"></script>
<script src="<%=basePath%>assets/libs/node-waves/waves.min.js"></script>
<script src="<%=basePath%>assets/libs/sweetalert2/sweetalert2.min.js"></script>
<script src="<%=basePath%>assets/js/pages/sweet-alerts.init.js"></script>

<script src="<%=basePath%>assets/js/app.js"></script>

<script>
    function validateInput() {
        const username = $('#username').val().trim();
        const email = $('#email').val().trim();
        const fname = $('#firstname').val().trim();
        const lname = $('#lastname').val().trim();
        const pass = $('#password').val().trim();
        const repeatPass = $('#confirmPassword').val().trim();
        const repeatPwdError = $('#confirmPwdError');



        if ((username === "") || (email === "") || (fname === "") || (lname === "") || (pass === "") || (repeatPass === "")) {
            $('#btn_adduser').attr('disabled', "true");
        } else if ((pass !== repeatPass)) {
            $('#confirmPassword').attr("class", "form-control is-invalid");
            $('#password').attr("class", "form-control is-invalid");
            repeatPwdError.html("<small style='color: red; font-size: 12px;' class='mb-1'>confirm password do not match password</small>");
            $('#btn_adduser').attr('disabled', "true");
        } else {
            if ((pass === repeatPass) && (pass !== "") && (repeatPass !== "")) {
                $('#password').attr("class", "form-control is-valid");
                repeatPwdError.html("");
                $('#confirmPassword').attr("class", "form-control is-valid");
                $('#btn_adduser').removeAttr('disabled');
            }
        }
    }

   /* function init() {
        document.getElementById("username").focus();
    }*/

    function validateUsername(NameField) {
        const userExistenceMsg = document.getElementById("usernameExistMsg");
        const url = "/UserManagementSystem_war_exploded/AccountExistServlet?username=" + NameField.value;
        let xmlHttpRequest = null;

        if ((NameField.value.trim()).length !== "") {
            //handle browser compatability for different browsers
            if (window.XMLHttpRequest) {
                xmlHttpRequest = new XMLHttpRequest();
            } else if (window.ActiveXObject) {
                xmlHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
            }

            xmlHttpRequest.open("GET", url, true);
            xmlHttpRequest.overrideMimeType("text/html");
            xmlHttpRequest.onreadystatechange = function () {
                if (xmlHttpRequest.readyState === 4) {
                    if (xmlHttpRequest.status === 200) {
                        if (xmlHttpRequest.responseText.trim() !== "") {
                            $('#username').attr("class", "form-control is-invalid");
                            userExistenceMsg.innerHTML = "<div style='color: red; font-size: 14px;' class='mb-1'>" + xmlHttpRequest.responseText.trim() + "</div>";
                            NameField.focus();
                        } else {
                            $('#username').attr("class", "form-control is-valid");
                            userExistenceMsg.innerHTML = "";
                        }
                    } else {
                        userExistenceMsg.innerHTML = "<div class='alert alert-danger' role='alert'>Request error code: " + xmlHttpRequest.status + "</div>";
                    }
                }
            }
            xmlHttpRequest.send(null);
        } else {
            $('#username').attr("class", "form-control is-invalid");
            userExistenceMsg.innerHTML = "";
        }
    }

    function validateEmail(emailField) {
        const emailExistMsg = document.getElementById("emailExistMsg");
        const url = "/UserManagementSystem_war_exploded/EmailExistServlet?email=" + emailField.value;
        let xmlHttpRequest = null;
        if ((emailField.value.trim()).length !== "") {
            if (window.XMLHttpRequest) {
                xmlHttpRequest = new XMLHttpRequest();
            } else if (window.ActiveXObject) {
                xmlHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlHttpRequest.open("GET", url, true);
            xmlHttpRequest.overrideMimeType("text/html");
            xmlHttpRequest.onreadystatechange = function () {
                if (xmlHttpRequest.readyState === 4) {
                    if (xmlHttpRequest.status === 200) {
                        if (xmlHttpRequest.responseText.trim() !== "") {
                            $('#email').attr("class", "form-control is-invalid");
                            emailExistMsg.innerHTML = "<div style='color: red; font-size: 14px;' class='mb-1'>" + xmlHttpRequest.responseText.trim() + "</div>";
                            //emailField.focus();
                        } else {
                            emailExistMsg.innerHTML = "";
                            //emailExistMsg.innerHTML = "<div style='color: green; font-size: 14px;' class='mb-1'>Email is valid</div>";
                            $('#email').attr("class", "form-control is-valid");
                        }
                    } else {
                        emailExistMsg.innerHTML = "<div class='alert alert-danger' role='alert'>Request error code: " + xmlHttpRequest.status + "</div>";
                    }
                }
            }
            xmlHttpRequest.send(null);
        } else {
            $('#email').attr("class", "form-control is-invalid");
            emailExistMsg.innerHTML = "";
        }
    }
</script>
</body>
</html>

