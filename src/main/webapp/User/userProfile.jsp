<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+ "://"+request.getServerName()+":"+ request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8" />
    <title>Edit Profile</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- App favicon -->
    <link rel="shortcut icon" href="<%=basePath%>assets/images/favicon.ico">

    <!-- jquery.vectormap css -->
    <link href="<%=basePath%>assets/libs/admin-resources/jquery.vectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />

    <!-- DataTables -->
    <link href="<%=basePath%>assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css" />

    <!-- Responsive datatable examples -->
    <link href="<%=basePath%>assets/libs/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css" rel="stylesheet" type="text/css" />

    <!-- Bootstrap Css id="bootstrap-style"-->
    <link href="<%=basePath%>assets/css/bootstrap-dark.min.css" rel="stylesheet" type="text/css" />
    <!-- Icons Css -->
    <link href="<%=basePath%>assets/css/icons.min.css" rel="stylesheet" type="text/css" />
    <!-- App Css id="app-style"-->
    <link href="<%=basePath%>assets/css/app-dark.min.css" rel="stylesheet" type="text/css" />

</head>

<body data-topbar="dark"  data-sidebar="dark">

<%
    String username = null;
    username = (String) session.getAttribute("username");

    if(username != null){
%>
<div class="spinner-border text-secondary m-1" role="status">
    <span class="sr-only">Loading...</span>
</div>
<!-- <body data-layout="horizontal" data-topbar="dark"> -->

<!-- Begin page -->
<div id="layout-wrapper">


    <header id="page-topbar">
        <div class="navbar-header">
            <div class="d-flex">
                <!-- LOGO -->
                <div class="navbar-brand-box">
                    <a href="index.jsp" class="logo logo-dark">
                                <span class="logo-sm">
                                    <img src="<%=basePath%>assets/images/logo-sm.png" alt="logo-sm" height="22">
                                </span>
                        <span class="logo-lg">
                                    <img src="<%=basePath%>assets/images/logo-dark.png" alt="logo-dark" height="20">
                                </span>
                    </a>

                    <a href="index.jsp" class="logo logo-light">
                                <span class="logo-sm">
                                    <img src="<%=basePath%>assets/images/logo-sm.png" alt="logo-sm-light" height="22">
                                </span>
                        <span class="logo-lg">
                                    <img src="<%=basePath%>assets/images/logo-light.png" alt="logo-light" height="20">
                                </span>
                    </a>
                </div>

                <button type="button" class="btn btn-sm px-3 font-size-24 header-item waves-effect" id="vertical-menu-btn">
                    <i class="ri-menu-2-line align-middle"></i>
                </button>

                <!-- App Search-->
                <form class="app-search d-none d-lg-block w-100">
                    <div class="position-relative">
                        <input type="text" class="form-control bg-white" placeholder="Search...">
                        <span class="ri-search-line"></span>
                    </div>
                </form>


            </div>

            <div class="d-flex">

                <div class="dropdown d-inline-block d-lg-none ms-2">
                    <button type="button" class="btn header-item noti-icon waves-effect" id="page-header-search-dropdown"
                            data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="ri-search-line"></i>
                    </button>
                    <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0"
                         aria-labelledby="page-header-search-dropdown">

                        <form class="p-3">
                            <div class="mb-3 m-0">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Search ...">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="submit"><i class="ri-search-line"></i></button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="dropdown d-none d-lg-inline-block ms-1 mt-4">
                    <a  class="h6 btn header-item noti-icon waves-effect" >
                        <i class="mdi mdi-home-account align-middle me-1"></i> Home
                    </a>
                </div>

                <div class="dropdown d-none d-lg-inline-block ms-1 mt-4">
                    <a href="${pageContext.request.contextPath}/userProfileServlet" class="h6 btn header-item noti-icon waves-effect" >
                        <i class="mdi mdi-account-circle-outline align-middle me-1"></i> Profile
                    </a>
                </div>

                <div class="dropdown d-inline-block user-dropdown mt-3">
                    <button type="button" class="btn header-item waves-effect" id="page-header-user-dropdown"
                            data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <img class="rounded-circle header-profile-user" src="<%=basePath%>assets/images/users/avatar.jpg"
                             alt="Header Avatar">
                        <span class="d-none d-xl-inline-block ms-1"><%=username%></span>
                        <i class="mdi mdi-chevron-down d-none d-xl-inline-block"></i>
                    </button>
                    <div class="dropdown-menu dropdown-menu-end">
                        <!-- item-->
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/userProfileServlet"><i class="ri-user-line align-middle me-1"></i> Profile</a>
                        <a class="dropdown-item d-block" href="#"><span class="badge bg-success float-end mt-1">11</span><i class="ri-settings-2-line align-middle me-1"></i> Settings</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item text-danger" href="${pageContext.request.contextPath}/logoutServlet"><i class="ri-shut-down-line align-middle me-1 text-danger"></i> Logout</a>
                    </div>
                </div>

                <div class="dropdown d-inline-block mt-3">
                    <button type="button" class="btn header-item noti-icon right-bar-toggle waves-effect">
                        <i class="ri-settings-2-line"></i>
                    </button>
                </div>

            </div>
        </div>
    </header>

    <!-- ========== Left Sidebar Start ========== -->
    <div class="vertical-menu">

        <div data-simplebar class="h-100">

            <!-- User details -->
            <div class="user-profile text-center mt-3">
                <div class="">
                    <img src="<%=basePath%>assets/images/users/avatar.jpg" alt="" class="avatar-md rounded-circle">
                </div>
                <div class="mt-3">
                    <h4 class="font-size-16 mb-1">Welcome <%=username%></h4>
                    <span class="text-muted"><i class="ri-record-circle-line align-middle font-size-14 text-success"></i> Online</span>
                </div>
            </div>

            <!--- Sidemenu -->
            <div id="sidebar-menu">
                <!-- Left Menu Start -->
                <ul class="metismenu list-unstyled" id="side-menu">

                    <li class="menu-title">Pages</li>

                    <li>
                        <a href="${pageContext.request.contextPath}/UserServlet" class="waves-effect">
                            <i class="ri-home-2-line"></i><span class="badge rounded-pill bg-success float-end">3</span>
                            <span>Home</span>
                        </a>
                    </li>

                    <li>
                        <a href="#" class=" waves-effect">
                            <i class="mdi mdi-trending-up"></i>
                            <span>Trending Post</span>
                        </a>
                    </li>

                    <li>
                        <a href="#" class=" waves-effect">
                            <i class="mdi mdi-arrow-up-bold"></i>
                            <span>Top Thread</span>
                        </a>
                    </li>


                    <li class="menu-title">User</li>

                    <li>
                        <a href="#" class=" waves-effect">
                            <i class="ri-line-chart-fill"></i>
                            <span>Login Activity</span>
                        </a>
                    </li>

                    <li>
                        <a href="${pageContext.request.contextPath}/userProfileServlet" class=" waves-effect">
                            <i class="ri-user-settings-line"></i>
                            <span>Edit Account</span>
                        </a>
                    </li>

                    <li>
                        <a href="${pageContext.request.contextPath}/User/ResetPassword.jsp" class=" waves-effect">
                            <i class="ri-shield-user-line"></i>
                            <span>Change Password</span>
                        </a>
                    </li>
                    
                </ul>
            </div>
            <!-- Sidebar -->
        </div>
    </div>
    <!-- Left Sidebar End -->



    <!-- ============================================================== -->
    <!-- Start main Content here -->
    <!-- ============================================================== -->
    <div class="main-content">

        <div class="page-content mt-5 pt-3">
            <div class="container-fluid ">

                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                            <h4 class="mb-sm-0">Profile</h4>

                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">User</a></li>
                                    <li class="breadcrumb-item active">Edit Account</li>
                                </ol>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12">
                        <div class="card">

                            <div class="card-body">

                                <h6 class="card-text">User Profile Detail</h6>
                                    <div class="table-responsive">
                                        <table class="table table-editable table-nowrap align-middle table-edits" style="outline: none;">
                                            <c:forEach items="${sessionScope.listUserInfo}" var="listUserDetail">
                                            <form method="post" action="${pageContext.request.contextPath}/UpdateProfile?Id=${listUserDetail.id}">
                                                <tr data-id="1"><td data-field="id" style="width: 80px">Username</td><td><input type="text" name="username" value='${listUserDetail.username}'></td></tr>
                                                <tr data-id="2"><td data-field="id" style="width: 80px">Email</td><td><input type="email" name="email" value='${listUserDetail.email}'></td></tr>
                                                <tr data-id="3"><td data-field="id" style="width: 80px">First Name</td><td><input type="text" name="firstname" value='${listUserDetail.firstName}'></td></tr>
                                                <tr data-id="4"><td data-field="id" style="width: 80px">Last Name</td><td><input type="text" name="lastname" value='${listUserDetail.lastName}'></td></tr>
                                                <tr data-id="5"><td data-field="id" style="width: 80px">Gender</td><td><input type="text" name="gender" value='${listUserDetail.gender}'></td></tr>
                                                <tr data-id="6"><td data-field="id" style="width: 80px">Birthday</td><td><input type="text" name="birthday" value='${listUserDetail.birthday}'></td></tr>
                                                <tr data-id="7"><td data-field="id" style="width: 80px">Age</td><td><input type="text" name="age" value='${listUserDetail.age}'></td></tr>
                                                <tr data-id="8"><td data-field="id" style="width: 80px">Address</td><td><input type="text" name="address" value='${listUserDetail.address}'></td></tr>
                                                <tr data-id="9"><td data-field="id" style="width: 80px">Mobile</td><td><input type="text" name="mobile" value='${listUserDetail.mobile}'></td></tr>
                                                <tr data-id="10"><td data-field="id" style="width: 80px">Password</td><td><input type="password" name="password" value='${listUserDetail.password}'></td></tr>
                                                <tr><td><input type="submit" value="Update" class="btn btn-primary"></td><td><input type="button" value="Back" class="btn btn-primary" onclick="history.back()"></td></tr>
                                            </form>
                                            </c:forEach>
                                        </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end page title -->
            </div>
        </div>
    </div>
    <!-- End Page-content -->

    <footer class="footer">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-6">
                    <script>document.write(new Date().getFullYear())</script> © Upcube.
                </div>
                <div class="col-sm-6">
                    <div class="text-sm-end d-none d-sm-block">
                        Crafted with <i class="mdi mdi-heart text-danger"></i> By David Cole</a>
                    </div>
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
                <img src="<%=basePath%>assets/images/layouts/layout-3.jpg" class="img-fluid img-thumbnail" alt="layout-3">
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
        response.sendRedirect("User/login.jsp");
    }
%>
<!-- JAVASCRIPT -->
<script src="<%=basePath%>assets/libs/jquery/jquery.min.js"></script>
<script src="<%=basePath%>assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="<%=basePath%>assets/libs/metismenu/metisMenu.min.js"></script>
<script src="<%=basePath%>assets/libs/simplebar/simplebar.min.js"></script>
<script src="<%=basePath%>assets/libs/node-waves/waves.min.js"></script>


<!-- apexcharts -->
<script src="<%=basePath%>assets/libs/apexcharts/apexcharts.min.js"></script>

<!-- jquery.vectormap map -->
<script src="<%=basePath%>assets/libs/admin-resources/jquery.vectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="<%=basePath%>assets/libs/admin-resources/jquery.vectormap/maps/jquery-jvectormap-us-merc-en.js"></script>

<!-- Required datatable js -->
<script src="<%=basePath%>assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="<%=basePath%>assets/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>

<!-- Responsive examples -->
<script src="<%=basePath%>assets/libs/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script src="<%=basePath%>assets/libs/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>

<script src="<%=basePath%>assets/js/pages/dashboard.init.js"></script>

<!-- App js -->
<script src="<%=basePath%>assets/js/app.js"></script>
</body>

</html>
