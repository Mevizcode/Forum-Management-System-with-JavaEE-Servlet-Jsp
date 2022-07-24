<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+ "://"+request.getServerName()+":"+ request.getServerPort()+path+"/";
%>
<!doctype html>
<html lang="en">

<head>

    <meta charset="utf-8" />
    <title>Login </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- App favicon -->
    <link rel="shortcut icon" href="<%=basePath%>assets/images/favicon.ico">


    <!-- Bootstrap Css id="bootstrap-style" -->
    <link href="<%=basePath%>assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Icons Css -->
    <link href="<%=basePath%>assets/css/icons.min.css" rel="stylesheet" type="text/css" />
    <!-- App Css id="app-style"-->
    <link href="<%=basePath%>assets/css/app.min.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>assets/css/style.css" rel="stylesheet" type="text/css">
    <link href="<%=basePath%>assets/libs/toastr/build/toastr.min.css" rel="stylesheet"/>

    <style>

        form .passWordIcon{
            position: absolute;
            left: 20px;
            top:  6px;
            font-size: 16px;
        }
        input[type="text"], input[type="password"] {
            padding-left: 30px;

        }
    </style>
</head>
<body class="auth-body-bg">
<div class="bg-overlay"></div>
<div class="wrapper-page">
    <div class="container-fluid p-0">
        <div class="card">
            <div class="card-body">

                <div class="text-center mt-4">
                    <div class="mb-3">
                        <a href="index.jsp" class="auth-logo">
                            <img src="<%=basePath%>assets/images/logo-dark.png" height="30" class="logo-dark mx-auto" alt="">
                            <img src="<%=basePath%>assets/images/logo-light.png" height="30" class="logo-light mx-auto" alt="">
                        </a>
                    </div>
                </div>

               <div class="p-3">
                    <form class="form-horizontal mt-3" method="post" action="${pageContext.request.contextPath}/loginServlet" >

                        <div class="form-group mb-3 row">
                            <div class="col-12">
                                <input class="form-control" type="text" id="username" name="username" required placeholder="username" onchange="checkName(this);">
                                <span class="passWordIcon"><i class="ri-user-line"></i></span>
                                <small class="invalid-feedback" id="checkUsername"></small>
                            </div>
                        </div>

                        <div class="form-group mb-3 row">
                            <div class="col-12">
                                <input class="form-control" type="password" id="passw" name="password" required placeholder="password">
                                <span class="passWordIcon"><i class="mdi mdi-lock-open-check-outline"></i></span>
                                <small class="invalid-feedback" id="checkPassword"></small>
                            </div>
                        </div>

                        <div class="form-group mb-3 row">
                            <div class="col-md-7 mb-3">
                                <input type="text" name="checkCode" class="form-control" id="checkCodeId" placeholder="security code">
                                <span class="passWordIcon"><i class="mdi mdi-security"></i></span>
                            </div>
                            <div class="col-md-5 mb-3">
                                <a href="javascript:reloadCheckImg();"><img id="checkImg" src="<%=basePath%>User/checkImg.jsp" alt=""></a>
                                <div class="invalid-feedback" id="checkImg_tip"></div>
                            </div>
                        </div>

                        <div class="form-group mb-3 row">
                            <div class="col-sm-5">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="customCheck1" checked>
                                    <label class="form-label ms-1" for="customCheck1">Remember me</label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group mb-3 text-center row mt-3 pt-1">
                            <div class="col-12">
                                <button class="btn btn-info w-100 waves-effect waves-light" id="signIn" type="submit" disabled>Log In
                                    <i class="ri-arrow-right-line align-middle ms-2"></i>
                                </button>
                            </div>
                        </div>

                        <div class="form-group mb-0 row mt-1">
                            <div class="col-sm-7 mt-2">
                                <a href="<%=basePath%>User/ForgetPassword.jsp" class="text-muted"><i class="mdi mdi-lock"></i> Forgot your password?</a>
                            </div>
                            <div class="col-sm-5 mt-2">
                                <a href="<%=basePath%>User/register.jsp" class="text-muted"><i class="mdi mdi-account-circle"></i> Create an account</a>
                            </div>
                        </div>
                    </form>
               </div>
                <!-- end -->
            </div>
            <!-- end cardbody -->
        </div>
        <!-- end card -->
    </div>
    <!-- end container -->
</div>
<script src="<%=basePath%>assets/libs/jquery/jquery.min.js"></script>
<script src="<%=basePath%>assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="<%=basePath%>assets/libs/metismenu/metisMenu.min.js"></script>
<script src="<%=basePath%>assets/libs/simplebar/simplebar.min.js"></script>
<script src="<%=basePath%>assets/libs/node-waves/waves.min.js"></script>
<script src="<%=basePath%>assets/libs/toastr/toastr.js"></script>
<script src="<%=basePath%>assets/js/app.js"></script>
<script>
   function checkName(NameField){
       var checkUsername = document.getElementById("checkUsername");
       //var uname = document.getElementById("username").value;
       if((NameField.value.trim()).length !== ""){
           var xmlHttpRequest = null;
           var url = "/UserManagementSystem_war_exploded/AccountExistServlet?username="+NameField.value;
           if(window.XMLHttpRequest){
               xmlHttpRequest = new XMLHttpRequest();
           }else  if(window.ActiveXObject){
               xmlHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
           }

           xmlHttpRequest.open("GET", url, true);
           xmlHttpRequest.overrideMimeType("text/html");
           xmlHttpRequest.onreadystatechange = function (){
               if (xmlHttpRequest.readyState === 4 && xmlHttpRequest.status === 200){
                   if (xmlHttpRequest.responseText.trim()===""){
                       $("#username").attr("class", "form-control is-invalid");
                       //$('#signIn').attr('disabled', true);
                   }else{
                       $("#username").attr("class", "form-control is-valid");
                       //$('#signIn').removeAttr('disabled');
                   }
               }
           }
           xmlHttpRequest.send(null);
       }else{
           checkUsername.innerHTML = "";
       }
   }

</script>
<script>

    function reloadCheckImg(){
        $('#checkImg').attr("src", "<%=basePath%>User/checkImg.jsp?t=" + (new Date().getTime()));
    }

    $(document).ready(function () {
    $("#checkCodeId").change(function () {
        const $checkCode = $("#checkCodeId").val().trim();
        // (url, variable)
            $.post("/UserManagementSystem_war_exploded/CheckCodeServlet", "checkCode=" + $checkCode, function (result) {
                $("#checkImg_tip").html(result);
                if (result.trim() === "Code_Valid!") {
                    $("#checkCodeId").attr("class", "form-control is-valid");
                    //checkCodeError.html("");
                    var unam = $('#username').val().trim();
                    var pas = $('#passw').val().trim();
                    if ((unam !== "") && (pas !== "")) {
                        $('#signIn').removeAttr('disabled');
                    }
                } else {
                    $('#checkCodeId').attr("class", "form-control is-invalid");
                    //$('#signIn').attr('disabled', "true");
                }
            })
        })
    });
</script>
</body>
</html>

