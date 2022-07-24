<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.Listeners.onlineUserCounter" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+ "://"+request.getServerName()+":"+ request.getServerPort()+path+"/";
    request.setAttribute("basePath", basePath);
    String username = null;
    username = (String) session.getAttribute("username");
    //if(username.equals("admin")){

%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8" />
    <title>Dashboard | Admin & Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- App favicon -->
    <link rel="shortcut icon" href="<%=basePath%>/assets/images/favicon.ico">

    <!-- jquery.vectormap css -->
    <link href="<%=basePath%>/assets/libs/admin-resources/jquery.vectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />

    <!-- sweet alert -->
    <link href="<%=basePath%>/assets/libs/sweetalert2/sweetalert2.min.css" rel="stylesheet" type="text/css">
    <!-- DataTables -->
    <link href="<%=basePath%>/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>/assets/libs/datatables.net-buttons-bs4/css/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>/assets/libs/datatables.net-select-bs4/css/select.bootstrap4.min.css" rel="stylesheet" type="text/css" />

    <!-- Responsive datatable examples -->
    <link href="<%=basePath%>/assets/libs/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css" rel="stylesheet" type="text/css" />

    <!-- Bootstrap Css id="bootstrap-style" id="app-style" bootstrap-dark.min.css-->
    <link href="<%=basePath%>/assets/css/bootstrap-dark.min.css"  rel="stylesheet" type="text/css" />
    <!-- Icons Css -->
    <link href="<%=basePath%>/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
    <!-- App Css app-dark.min.css-->
    <link href="<%=basePath%>/assets/css/app-dark.min.css"  rel="stylesheet" type="text/css" />

</head>

<body data-topbar="dark" data-sidebar="dark">
<!-- <body data-layout="horizontal" data-topbar="dark"> -->
<div id="preloader">
    <div id="status">
        <div class="spinner-chase">
           <!-- <i class="ri-loader-5-line"></i>
            <div class="chase-dot"><i class="ri-loader-5-line"></i></div>
            <div class="chase-dot"><i class="ri-loader-4-line"></i></div>
            <div class="chase-dot"><i class="ri-loader-3-line"></i></div>
            <div class="chase-dot"><i class="ri-loader-2-line"></i></div> -->
            <div class="chase-dot"><i class="ri-loader-1-line font-size-24"></i></div>
        </div>
    </div>
</div>
    <header id="page-topbar">
        <div class="navbar-header">
            <div class="d-flex">
                <!-- LOGO -->
                <div class="navbar-brand-box">
                    <a href="<%=basePath%>admin/admin.jsp" class="logo logo-dark">
                                <span class="logo-sm">
                                    <img src="<%=basePath%>/assets/images/logo-sm.png" alt="logo-sm" height="22">
                                </span>
                        <span class="logo-lg">
                                    <img src="<%=basePath%>/assets/images/logo-dark.png" alt="logo-dark" height="20">
                                </span>
                    </a>

                    <a href="<%=basePath%>admin/admin.jsp" class="logo logo-light">
                                <span class="logo-sm">
                                    <img src="<%=basePath%>/assets/images/logo-sm.png" alt="logo-sm-light" height="22">
                                </span>
                        <span class="logo-lg">
                                    <img src="<%=basePath%>/assets/images/logo-light.png" alt="logo-light" height="20">
                                </span>
                    </a>
                </div>

                <button type="button" class="btn btn-sm px-3 font-size-24 header-item waves-effect" id="vertical-menu-btn">
                    <i class="ri-menu-2-line align-middle"></i>
                </button>

                <!-- App Search-->
                <form class="app-search d-none d-lg-block" method="post"
                      action="${pageContext.request.contextPath}/SearchServlet" onkeyup="check();">
                    <div class="position-relative">
                        <input type="text" class="form-control" name="searchStr" id="searchBar" placeholder="Search...">
                        <div class="position-absolute"
                             style="width: 25px;height: 25px; position: absolute !important;z-index: 200;right: 12px; top: 7px;cursor: pointer;">
                            <button type="submit" id="btn-search-btn" style="background-color: inherit; border: none;">
                                <i class="ri-search-line text-muted font-size-16"></i></button>
                        </div>

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

                        <form class="p-3" method="post" action="${pageContext.request.contextPath}/SearchServlet"
                              onkeyup="check_two();">
                            <div class="mb-3 m-0">
                                <div class="input-group">
                                    <input type="text" class="form-control" id="searchBar2" placeholder="Search ...">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="submit" id="btn-search-btn2" disabled><i
                                                class="ri-search-line"></i></button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>


              <!--  <div class="dropdown d-none d-lg-inline-block ms-1">
                    <button type="button" class="btn header-item noti-icon waves-effect" data-toggle="fullscreen">
                        <i class="ri-fullscreen-line"></i>
                    </button>
                </div> -->


                <div class="dropdown d-inline-block user-dropdown">
                    <button type="button" class="btn header-item waves-effect" id="page-header-user-dropdown"
                            data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <img class="rounded-circle header-profile-user" src="<%=basePath%>/assets/images/users/avatar.jpg"
                             alt="Header Avatar">
                        <span class="d-none d-xl-inline-block ms-1"><%=username%></span>
                        <i class="mdi mdi-chevron-down d-none d-xl-inline-block"></i>
                    </button>
                    <div class="dropdown-menu dropdown-menu-end">
                        <!-- item-->
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/UserUpdateServlet"><i class="ri-user-line align-middle me-1"></i> Profile</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item text-danger" href="${pageContext.request.contextPath}/logoutServlet"><i class="ri-shut-down-line align-middle me-1 text-danger"></i> Logout</a>
                    </div>
                </div>

                <div class="dropdown d-inline-block">
                    <button type="button" class="btn header-item noti-icon right-bar-toggle waves-effect">
                        <i class="ri-settings-2-line"></i>
                    </button>
                </div>

            </div>
        </div>
    </header>

    <!-- ========== Left Sidebar Start ========== -->
    <div class="vertical-menu">

        <div data-simplebar="init" class="h-100">

            <!-- User details -->
            <div class="user-profile text-center mt-3">
                <div class="">
                    <img src="<%=basePath%>/assets/images/users/avatar.jpg" alt="" class="avatar-md rounded-circle">
                </div>
                <div class="mt-3">
                    <h4 class="font-size-16 mb-1"><%=username%></h4>
                    <span class="text-muted"><i class="ri-record-circle-line align-middle font-size-14 text-success"></i> Online</span>
                </div>
            </div>

            <!--- Sidemenu -->
            <div id="sidebar-menu">
                <!-- Left Menu Start -->
                <ul class="metismenu list-unstyled" id="side-menu">
                    <li class="menu-title">Menu</li>

                    <li>
                        <a href="${pageContext.request.contextPath}/AdminServlet" class="waves-effect">
                            <i class="ri-dashboard-line"></i><span class="badge rounded-pill bg-success float-end">3</span>
                            <span>Dashboard</span>
                        </a>
                    </li>

                    <li>
                        <a href="${pageContext.request.contextPath}/admin/addUser.jsp" class="waves-effect">
                            <i class="ri-user-add-fill"></i>
                            <span>Add User</span></a>
                    </li>

                    <li>
                        <a href="${pageContext.request.contextPath}/userListServlet" class="waves-effect">
                            <i class="ri-list-ordered"></i>
                            <span>List Users</span>
                        </a>
                    </li>

                    <li class="menu-title">User</li>

                    <li>
                        <a href="#" class=" waves-effect">
                            <i class="ri-line-chart-fill"></i>
                            <span>Login Activity</span>
                        </a>
                    </li>

                    <li class="menu-title">Analytics</li>
                    <li>
                        <a href="${pageContext.request.contextPath}/UserLogServlet" class="waves-effect">
                            <i class="ri-bar-chart-fill"></i>
                            <span>User Log Charts</span>
                        </a>
                    </li>
                </ul>
            </div>
            <!-- Sidebar -->
        </div>
    </div>
    <!-- Left Sidebar End -->
