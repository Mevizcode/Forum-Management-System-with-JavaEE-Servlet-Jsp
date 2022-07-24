<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.Listeners.onlineUserCounter" %>
<%@ page import="com.Util.newUserCounter" %>
<%@include file="Admin_header.jsp"%>
<%
    username = (String) session.getAttribute("username");
    if(username.equals("admin")){
%>
<!-- Begin page -->
<div id="layout-wrapper">
    <!-- ============================================================== -->
    <!-- Start right Content here -->
    <!-- ============================================================== -->
    <div class="main-content">
        <div class="page-content">
            <div class="container-fluid">
                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                            <h4 class="mb-sm-0">Dashboard</h4>
                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">Admin Panel</a></li>
                                    <li class="breadcrumb-item active">Add User</li>
                                </ol>
                            </div>

                        </div>
                    </div>
                </div>
                <!-- end page title -->

                <div class="row">
                    <div class="col-xl-4 col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex">
                                    <div class="flex-grow-1">
                                        <p class="text-truncate font-size-14 mb-2">Total Users</p>
                                        <h4 class="mb-2">${applicationScope.countTotalUsers.size()} Users</h4>
                                        <p class="text-muted mb-0"><span class="text-success fw-bold font-size-12 me-2"><i class="ri-arrow-right-up-line me-1 align-middle"></i>9.23%</span>from previous period</p>
                                    </div>
                                    <div class="avatar-sm">
                                                <span class="avatar-title bg-light text-primary rounded-3">
                                                    <i class="ri-team-line font-size-24"></i>
                                                </span>
                                    </div>
                                </div>
                            </div><!-- end cardbody -->
                        </div><!-- end card -->
                    </div><!-- end col -->

                    <div class="col-xl-4 col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex">
                                    <div class="flex-grow-1">
                                        <p class="text-truncate font-size-14 mb-2">New Users</p>
                                        <h4 class="mb-2"><%=newUserCounter.getCountNewUsers()%> User(s)</h4>
                                        <p class="text-muted mb-0"><span class="text-success fw-bold font-size-12 me-2"><i class="ri-arrow-right-up-line me-1 align-middle"></i>16.2%</span>from previous period</p>
                                    </div>
                                    <div class="avatar-sm">
                                                <span class="avatar-title bg-light text-primary rounded-3">
                                                    <i class="ri-user-3-line font-size-24"></i>
                                                </span>
                                    </div>
                                </div>
                            </div><!-- end cardbody -->
                        </div><!-- end card -->
                    </div><!-- end col -->
                    <div class="col-xl-4 col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex">
                                    <div class="flex-grow-1">
                                        <p class="text-truncate font-size-14 mb-2">Online </p>
                                        <h4 class="mb-2"><%=onlineUserCounter.getOnlineUserNumber()-1%> user(s) online</h4>
                                        <p class="text-muted mb-0"><span class="text-success fw-bold font-size-12 me-2"><i class="ri-arrow-right-up-line me-1 align-middle"></i>11.7%</span>from previous period</p>
                                    </div>
                                    <div class="avatar-sm">
                                                <span class="avatar-title bg-light text-success rounded-3">
                                                    <i class="mdi mdi-access-point font-size-24"></i>
                                                </span>
                                    </div>
                                </div>
                            </div><!-- end cardbody -->
                        </div><!-- end card -->
                    </div><!-- end col -->
                </div><!-- end row -->

                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                            <h4 class="mb-sm-0">Add New User</h4>

                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">Admin Panel</a></li>
                                    <li class="breadcrumb-item active">New User</li>
                                </ol>
                            </div>

                        </div>
                    </div>
                </div>
                <!-- end page title -->

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <form method="post" action="${pageContext.request.contextPath}/AddUserServlet" onkeyup="return validateInput();">
                                <div class="row mb-3">
                                    <label  class="col-sm-1 col-form-label">First Name</label>
                                    <div class="col-sm-5">
                                        <input class="form-control" type="text" placeholder="First Name" pattern="[a-zA-Z]{2,}" name="firstname" id="firstname" autocomplete="off" required>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label  class="col-sm-1 col-form-label">Last name</label>
                                    <div class="col-sm-5">
                                        <input class="form-control" type="text" placeholder="Last Name" pattern="[a-zA-Z]{2,}" name="lastname" id="lastname" autocomplete="off" required>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label  class="col-sm-1 col-form-label">Username</label>
                                    <div class="col-sm-5">
                                        <input class="form-control" type="text" placeholder="Username" pattern="[a-zA-Z]{2,15}" name="username" id="username" autofocus autocomplete="off" required onchange="validateUsername(this);">
                                        <div><span id="usernameExistMsg"></span></div>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label  class="col-sm-1 col-form-label">Email</label>
                                    <div class="col-sm-5">
                                        <input class="form-control" type="email" placeholder="eg. joedoe@gmail.com" name="email" id="email" autofocus autocomplete="off" required onchange="validateEmail(this);">
                                        <div><span id="emailExistMsg"></span></div>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label  class="col-sm-1 col-form-label">Telephone</label>
                                    <div class="col-sm-5">
                                        <input class="form-control" type="tel" name="mobile" placeholder="" id="mobile">
                                    </div>
                                </div>
                                <!-- end row -->
                                <div class="row mb-3">
                                    <label  class="col-sm-1 col-form-label">Age</label>
                                    <div class="col-sm-5">
                                        <input class="form-control" type="number" name="age" id="age">
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label class="col-sm-1 col-form-label">Gender</label>
                                    <div class="col-sm-5">
                                        <select class="form-select" name="gender" id="gender" aria-label="Default select example">
                                            <option value="Male">Male</option>
                                            <option value="Female">Female</option>
                                        </select>
                                    </div>

                                </div>
                                <div class="row mb-3">
                                    <label  class="col-sm-1 col-form-label">Birthday</label>
                                    <div class="col-sm-5">
                                        <input class="form-control" type="date" name="birthday"  id="birthday">
                                    </div>
                                </div>
                                <!-- end row -->
                                <div class="row mb-3">
                                    <label for="address" class="col-sm-1 col-form-label">Address</label>
                                    <div class="col-sm-5">
                                        <input class="form-control" type="text" name="address" id="address">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="password" class="col-sm-1 col-form-label">Password</label>
                                    <div class="col-sm-5">
                                        <input class="form-control" type="password" name="password"  id="password" autocomplete="off" required>
                                    </div>
                                </div>
                                <!-- end row -->
                                <div class="row mb-3">
                                    <label for="confirmPassword" class="col-sm-1 col-form-label">Confirm Password</label>
                                    <div class="col-sm-5">
                                        <input class="form-control" type="password" name="confirmPassword" id="confirmPassword" autocomplete="off" required>
                                    </div>
                                </div>
                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <button type="submit" class="btn btn-primary  w-lg" id="btn_adduser" disabled>Add User</button>
                                        </div>
                                        <div class="col-sm-3">
                                            <button type="reset" class="btn btn-warning w-lg">Cancel</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div> <!-- end col -->
                </div>
                <!-- end row -->
            </div>
            <!-- container-fluid -->
        </div>
        <!-- End Page-content -->

        <footer class="footer">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-6">
                        <script>document.write(new Date().getFullYear())</script> © Upcube.
                    </div>
                </div>
            </div>
        </footer>

    </div>
    <!-- end main content-->

</div>
<!-- END layout-wrapper -->

<!-- Right Sidebar -->
<div class="right-bar">
    <div data-simplebar class="h-100">
        <div class="rightbar-title d-flex align-items-center px-3 py-4">

            <h5 class="m-0 me-2">Settings</h5>

            <a href="javascript:void(0);" class="right-bar-toggle ms-auto">
                <i class="mdi mdi-close noti-icon"></i>
            </a>
        </div>

        <!-- Settings -->
        <hr class="mt-0" />
        <h6 class="text-center mb-0">Choose Layouts</h6>

        <div class="p-4">
            <div class="mb-2">
                <img src="<%=basePath%>assets/images/layouts/layout-1.jpg" class="img-fluid img-thumbnail" alt="layout-1">
            </div>

            <div class="form-check form-switch mb-3">
                <input class="form-check-input theme-choice" type="checkbox" id="light-mode-switch" checked>
                <label class="form-check-label" for="light-mode-switch">Light Mode</label>
            </div>

            <div class="mb-2">
                <img src="<%=basePath%>assets/images/layouts/layout-2.jpg" class="img-fluid img-thumbnail" alt="layout-2">
            </div>
            <div class="form-check form-switch mb-3">
                <input class="form-check-input theme-choice" type="checkbox" id="dark-mode-switch" data-bsStyle="<%=basePath%>assets/css/bootstrap-dark.min.css" data-appStyle="<%=basePath%>assets/css/app-dark.min.css">
                <label class="form-check-label" for="dark-mode-switch">Dark Mode</label>
            </div>

            <div class="mb-2">
                <img src="<%=basePath%>/assets/images/layouts/layout-3.jpg" class="img-fluid img-thumbnail" alt="layout-3">
            </div>
            <div class="form-check form-switch mb-5">
                <input class="form-check-input theme-choice" type="checkbox" id="rtl-mode-switch" data-appStyle="<%=basePath%>assets/css/app-rtl.min.css">
                <label class="form-check-label" for="rtl-mode-switch">RTL Mode</label>
            </div>


        </div>

    </div> <!-- end slimscroll-menu-->
</div>
<!-- /Right-bar -->

<!-- Right bar overlay-->
<div class="rightbar-overlay"></div>

<%
    }
    else{
        response.sendRedirect("index.jsp");
    }
%>

<!-- JAVASCRIPT -->
<script src="<%=basePath%>/assets/libs/jquery/jquery.min.js"></script>
<script src="<%=basePath%>/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="<%=basePath%>/assets/libs/metismenu/metisMenu.min.js"></script>
<script src="<%=basePath%>/assets/libs/simplebar/simplebar.min.js"></script>
<script src="<%=basePath%>/assets/libs/node-waves/waves.min.js"></script>


<!-- apexcharts -->
<script src="<%=basePath%>/assets/libs/apexcharts/apexcharts.min.js"></script>

<!-- jquery.vectormap map -->
<script src="<%=basePath%>/assets/libs/admin-resources/jquery.vectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="<%=basePath%>/assets/libs/admin-resources/jquery.vectormap/maps/jquery-jvectormap-us-merc-en.js"></script>

<!-- Required datatable js -->
<script src="<%=basePath%>/assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="<%=basePath%>/assets/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>

<!-- Responsive examples -->
<script src="<%=basePath%>/assets/libs/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script src="<%=basePath%>/assets/libs/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>

<script src="<%=basePath%>/assets/js/pages/dashboard.init.js"></script>

<!-- App js -->
<script src="<%=basePath%>/assets/js/app.js"></script>
<script>
    function validateInput(){
        var username = $('#username').val().trim();
        var email = $('#email').val().trim();
        var fname =  $('#firstname').val().trim();
        var lname = $('#lastname').val().trim();
        var pass = $('#password').val().trim();
        var repeatPass = $('#confirmPassword').val().trim();

        if((username === "") || (email === "") || (fname === "") || (lname === "") || (pass === "") || (repeatPass === "")){
            $('#btn_adduser').attr('disabled',"true");
        }else{
            if((pass === repeatPass) && (pass !== "") && (repeatPass !== "")){
                $('#btn_adduser').removeAttr('disabled');
            }
        }
    }

    function init(){
        document.getElementById("username").focus();
    }

    function validateUsername(NameField){
        var userExistenceMsg = document.getElementById("usernameExistMsg");
        if((NameField.value.trim()).length !== ""){
            var xmlHttpRequest = null;
            var url = "/UserManagementSystem_war_exploded/AccountExistServlet?username=" +NameField.value;
            //handle browser compatability for different browsers
            if(window.XMLHttpRequest){
                xmlHttpRequest = new XMLHttpRequest();
            }else if(window.ActiveXObject){
                xmlHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
            }

            xmlHttpRequest.open("GET",url,true);
            xmlHttpRequest.onreadystatechange = function (){
                if(xmlHttpRequest.readyState === 4){ //Ajax request is successful
                    if(xmlHttpRequest.status === 200){ //Ajax response OK
                        if(xmlHttpRequest.responseText.trim() !== ""){
                            userExistenceMsg.innerHTML = "<div style='color: red; font-size: 14px;' class='mb-1'>"+xmlHttpRequest.responseText.trim()+"</div>";
                            NameField.focus();
                        }else{
                            userExistenceMsg.innerHTML = "<div style='color: green; font-size: 14px;' class='mb-1'>Username is valid</div>";
                        }
                    }else{
                        userExistenceMsg.innerHTML = "<div class='alert alert-danger' role='alert'>Request error code: "+xmlHttpRequest.status+"</div>";
                    }
                }
            }
            xmlHttpRequest.send(null);
            //if length  == 0  return nothing
        }else{
            userExistenceMsg.innerHTML = "";
        }
    }

    function  validateEmail(emailField){
        var emailExistMsg = document.getElementById("emailExistMsg");
        var xmlHttpRequest = null;
        var url = "/UserManagementSystem_war_exploded/EmailExistServlet?email=" +emailField.value;
        if((emailField.value.trim()).length !== ""){
            //check browser
            if(window.XMLHttpRequest){
                xmlHttpRequest = new XMLHttpRequest();
            }else if(window.ActiveXObject){
                xmlHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
            }

            //post request
            xmlHttpRequest.open("GET", url, true);
            xmlHttpRequest.onreadystatechange = function (){
                if(xmlHttpRequest.readyState === 4){
                    if(xmlHttpRequest.status === 200){
                        if(xmlHttpRequest.responseText.trim() !== ""){
                            emailExistMsg.innerHTML = "<div style='color: red; font-size: 14px;' class='mb-1'>"+xmlHttpRequest.responseText.trim()+"</div>";
                            emailField.focus();
                        }else{
                            emailExistMsg.innerHTML = "<div style='color: green; font-size: 14px;' class='mb-1'>Email is valid</div>";
                        }
                    }else{
                        emailExistMsg.innerHTML = "<div class='alert alert-danger' role='alert'>Request error code: "+xmlHttpRequest.status+"</div>";
                    }
                }
            }
            xmlHttpRequest.send(null);
        }else{
            emailExistMsg.innerHTML = "";
        }
    }
</script>

</body>
</html>
