<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+ "://"+request.getServerName()+":"+ request.getServerPort()+path+"/";
%>
<!doctype html>
<html lang="en">

<head>

    <meta charset="utf-8" />
    <title>Reset Password </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- App favicon -->
    <link rel="shortcut icon" href="<%=basePath%>assets/images/favicon.ico">

    <!-- Bootstrap Css -->
    <link href="<%=basePath%>assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
    <!-- Icons Css -->
    <link href="<%=basePath%>assets/css/icons.min.css" rel="stylesheet" type="text/css" />
    <!-- App Css-->
    <link href="<%=basePath%>assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />

</head>

<body class="auth-body-bg">
<div class="bg-overlay"></div>
<div class="wrapper-page">
    <div class="container-fluid p-0">
        <div class="card">
            <div class="card-body">

                <div class="text-center mt-4">
                    <div class="mb-3">
                        <a href="#" class="auth-logo">
                            <img src="<%=basePath%>assets/images/logo-dark.png" height="30" class="logo-dark mx-auto" alt="">
                            <img src="<%=basePath%>assets/images/logo-light.png" height="30" class="logo-light mx-auto" alt="">
                        </a>
                    </div>
                </div>

                <h4 class="text-muted text-center font-size-18"><b>Reset Password</b></h4>

                <div class="p-3">
                    <form class="form-horizontal mt-3" method="post" action="${pageContext.request.contextPath}/ResetPasswordHandler" onkeyup="return validateUserInfo();">
                        <div style="display: none">
                        <input type="hidden" name="userid" value="<%=session.getAttribute("verifiedID")%>">
                        </div>
                        <div class="alert alert-info alert-dismissible fade show" role="alert">
                            Enter a new <strong>Password</strong> and Confirm to Continue!
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                        <div class="form-group mb-3">
                            <div class="col-xs-12">
                                <input class="form-control" type="password" id="pass" name="password"  placeholder="New Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" required>
                            </div>
                        </div>

                        <div class="form-group mb-3">
                            <div class="col-xs-12">
                                <input class="form-control" type="password" id="confirmPass" name="confirmPassword"  placeholder="Confirm Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" required>
                            </div>
                        </div>
                        <!-- add captcha security -->

                        <div class="form-group pb-2 text-center row mt-3">
                            <div class="col-12">
                                <button class="btn btn-info w-100 waves-effect waves-light" id="resetPass" type="submit" disabled>Change Password</button>
                            </div>
                            <div class="col-12 mt-4">
                                <button class="btn btn-outline-success w-100 waves-effect waves-light" onclick="history.back()" type="button">Back</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!-- end cardbody -->
        </div>
        <!-- end card -->
    </div>
    <!-- end container -->
</div>
<!-- end -->
<script>
    function validateUserInfo(){
    var pass = $('#pass').val().trim();
    var repeatPass = $('#confirmPass').val().trim();

    if((pass === "") || (repeatPass === "")){
        $('#resetPass').attr('disabled', "true");
    }else{
        if((pass === repeatPass) && (pass !== "") && (repeatPass !== "")){
            $('#resetPass').removeAttr('disabled');
        }
    }
    }
</script>

<!-- JAVASCRIPT -->
<script src="<%=basePath%>assets/libs/jquery/jquery.min.js"></script>
<script src="<%=basePath%>assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="<%=basePath%>assets/libs/metismenu/metisMenu.min.js"></script>
<script src="<%=basePath%>assets/libs/simplebar/simplebar.min.js"></script>
<script src="<%=basePath%>assets/libs/node-waves/waves.min.js"></script>

<script src="<%=basePath%>assets/js/app.js"></script>

</body>
</html>

