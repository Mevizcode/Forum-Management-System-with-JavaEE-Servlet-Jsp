<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.Entity.Posts" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.Entity.Thread" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+ "://"+request.getServerName()+":"+ request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8"/>
    <title>Thread Context </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- App favicon -->
    <link rel="shortcut icon" href="<%=basePath%>assets/images/favicon.ico">

    <!-- jquery.vectormap css -->
    <link href="<%=basePath%>assets/libs/admin-resources/jquery.vectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet"
          type="text/css"/>

    <!-- DataTables -->
    <link href="<%=basePath%>assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css"/>

    <!-- Responsive datatable examples -->
    <link href="<%=basePath%>assets/libs/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css" rel="stylesheet"
          type="text/css"/>

    <!-- slider --->
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
    <link href="<%=basePath%>style.css" rel="stylesheet" type="text/css">

    <!-- Bootstrap Css id="bootstrap-style"-->
    <link href="<%=basePath%>assets/css/bootstrap-dark.min.css" rel="stylesheet" type="text/css"/>
    <!-- Icons Css -->
    <link href="<%=basePath%>assets/css/icons.min.css" rel="stylesheet" type="text/css"/>
    <!-- App Css id="app-style"-->
    <link href="<%=basePath%>assets/css/app-dark.min.css" rel="stylesheet" type="text/css"/>


</head>

<body data-topbar="dark" data-sidebar="dark" data-appStyle="dark">

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
                    <a href="<%=basePath%>index.jsp" class="logo logo-dark">
                                <span class="logo-sm">
                                    <img src="<%=basePath%>assets/images/logo-sm.png" alt="logo-sm" height="22">
                                </span>
                        <span class="logo-lg">
                                    <img src="<%=basePath%>assets/images/logo-dark.png" alt="logo-dark" height="20">
                                </span>
                    </a>

                    <a href="<%=basePath%>index.jsp" class="logo logo-light">
                                <span class="logo-sm">
                                    <img src="<%=basePath%>assets/images/logo-sm.png" alt="logo-sm-light" height="22">
                                </span>
                        <span class="logo-lg">
                                    <img src="<%=basePath%>assets/images/logo-light.png" alt="logo-light" height="20">
                                </span>
                    </a>
                </div>


            </div>

            <div class="d-flex">

                <!-- App Search-->
                <form class="app-search d-none d-lg-block">
                    <div class="position-relative">
                        <input type="text" class="form-control" placeholder="Search...">
                        <span class="ri-search-line"></span>
                    </div>
                </form>

                <div class="dropdown d-inline-block d-lg-none ms-2">
                    <button type="button" class="btn header-item noti-icon waves-effect"
                            id="page-header-search-dropdown"
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
                                        <button class="btn btn-primary" type="submit"><i class="ri-search-line"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>


                <div class="d-none d-lg-inline-block ms-1">
                    <button type="submit" class="btn header-item noti-icon waves-effect">
                        <a href="<%=basePath%>login.jsp" class=" font-size-18 text-white">Login</a>
                    </button>
                </div>

                <div class="d-none d-lg-inline-block ms-1">
                    <button type="submit" class="btn header-item noti-icon waves-effect">
                        <a href="<%=basePath%>register.jsp" class=" font-size-18 text-white">Sign Up</a>
                    </button>
                </div>

                <div class="dropdown d-inline-block user-dropdown">
                    <button type="button" class="btn header-item waves-effect" id="page-header-user-dropdown"
                            data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <img class="rounded-circle header-profile-user" src="<%=basePath%>assets/images/users/avatar.jpg"
                             alt="Header Avatar">
                        <span class="d-none d-xl-inline-block ms-1"></span>
                        <i class="mdi mdi-chevron-down d-none d-xl-inline-block"></i>
                    </button>
                    <div class="dropdown-menu dropdown-menu-end">
                        <!-- item-->
                        <a class="dropdown-item" href="#"><i class="ri-user-line align-middle me-1"></i> Profile</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item text-danger" href="${pageContext.request.contextPath}/logoutServlet"><i
                                class="ri-shut-down-line align-middle me-1 text-danger"></i> Logout</a>
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

        <div data-simplebar class="h-100">

            <!--- Sidemenu -->
            <div id="sidebar-menu">
                <!-- Left Menu Start -->
                <ul class="metismenu list-unstyled" id="side-menu">

                    <li class="menu-title">Pages</li>

                    <li>
                        <a href="<%=basePath%>/UserServlet" class="waves-effect active">
                            <i class="ri-home-2-line"></i>
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
                        <a href="<%=basePath%>User/ResetPassword.jsp" class=" waves-effect">
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
        <div class="page-content mt-5 pt-1">
            <div class="container-fluid">
                <%
                    ResultSet listPost = (ResultSet) request.getAttribute("listPost");
                %>
                <div class="row d-flex">
                    <div class="col-xl-8">
                        <div class="row d-lg-inline-block">
                            <div class="col-lg-12 mb-4">
                                <div class="card" id="question-card">
                                    <div class="row px-3">
                                        <%
                                            if (listPost != null) {
                                        %>
                                        <div class="col-md-1" id="info">
                                            <a href="#">
                                                <div class="mt-3 d-inline-flex d-flex" style="align-items: flex-start;">
                                                    <img src="<%=basePath%>assets/images/users/pp.jpg" alt="pp"
                                                         class="rounded-circle avatar-sm">
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-md-10">
                                            <div class="card-body">
                                                <a href="#" class="card-link link-pink"><h4><%=listPost.getString("title")%>
                                                </h4></a>
                                                <h6 class="mb-0 card-text"><%=listPost.getString("content")%>
                                                </h6>
                                                <footer class="blockquote-footer m-0 card-text text-muted card-text">posted by <cite title="" class="text-primary"><%=listPost.getString("postedBy")%></cite> at <%=listPost.getTimestamp("createdOn")%></footer>
                                            </div>
                                        </div>
                                        <%
                                            }
                                        %>
                                        <hr>
                                        <h4>Answers</h4>
                                        <%
                                            List<Thread> listThreadsPerPost = (List<Thread>) request.getAttribute("listThreadsPerPost");
                                        %>
                                        <c:forEach items="${listThreadsPerPost}" var="ThreadsPerPost">
<%--                                            <div style="display: none">--%>
<%--                                                <input type="text" name="post_Id" value="${ThreadsPerPost.postId}">--%>
<%--                                            </div>--%>
                                            <div class="col-lg-12 mb-1">
                                                <div class="" >
                                                    <div class="row px-3">
                                                        <div class="col-xl-12">
                                                                <blockquote class="blockquote font-size-16 mb-0 card-text card-text">${ThreadsPerPost.subject}</blockquote>
                                                                <footer class="blockquote-footer m-0 card-text text-muted">posted  by <cite class="link-primary">${ThreadsPerPost.createdBy}</cite>
                                                                    on ${ThreadsPerPost.threadCreatedOn}</footer>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr>
                                        </c:forEach>

                                        <div class="row d-lg-inline-block">
                                            <div class="col-lg-12 mt-5">
                                                <form method="post"
                                                      action="${pageContext.request.contextPath}/threadServlet">
                                                    <input type="hidden" name="username" value="${username}">
                                                    <input type="hidden" name="this_post_ID" value="<%=request.getAttribute("post_Id")%>">
                                                    <div class="form-group mb-3 row mt-3 pt-1">
                                                        <div class="form-group mb-5 row">
                                                            <h6 class="card-text">Contribute to this question by submitting your answer below</h6>
                                                            <textarea id="elm1" name="area"
                                                                      placeholder="Comment your answer here....." required ></textarea> <!--onchange="checkParam2(this);" -->
                                                        </div>
                                                    </div>
                                                    <div class="form-group mb-3 text-center row mt-3 pt-1">
                                                        <div class="col-12">
                                                            <button class="btn btn-info w-100 waves-effect waves-light"
                                                                    id="post_answer" type="submit" >post answer
                                                            </button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4">
                        <div class="row d-lg-inline-block ms-4">
                            <div class="col-md-10 mb-2">
                                <h6 class="h6 mt-5">Trending Topics</h6>
                                <p><span class="rounded-pill badge-soft-danger pe-2">Java</span>&nbsp;
                                    <span class="rounded-pill badge-soft-success pe-2">Java EE</span>&nbsp;
                                    <span class="rounded-pill badge-soft-primary pe-2">Jsp</span>&nbsp;
                                    <span class="rounded-pill badge-soft-warning pe-2">Servlet</span>&nbsp;
                                    <span class="rounded-pill badge-soft-info pe-2">Jstl</span>
                                    <span class="rounded-pill badge-soft-warning pe-2">Spring Framework</span>
                                    <span class="rounded-pill badge-soft-primary pe-2">Spring Mvc</span>
                                    <span class="rounded-pill badge-soft-info pe-2">Spring Boot</span>
                                    <span class="rounded-pill badge-soft-danger pe-2">Python</span>
                                    <span class="rounded-pill badge-soft-warning pe-2">Django</span>
                                    <span class="rounded-pill badge-soft-success pe-2">Flask</span>
                                    <span class="rounded-pill badge-soft-info pe-2">Asp Core.Net</span>
                                    <span class="rounded-pill badge-soft-danger pe-2">C#</span>
                                    <span class="rounded-pill badge-soft-primary pe-2">Mvc 3</span>
                                    <span class="rounded-pill badge-soft-warning pe-2">JavaScript</span>
                                    <span class="rounded-pill badge-soft-primary pe-2">JQuery</span>
                                    <span class="rounded-pill badge-soft-warning pe-2">Vanilla Js</span>
                                    <span class="rounded-pill badge-soft-primary pe-2">Bootstrap</span>
                                    <span class="rounded-pill badge-soft-info pe-2">Tailwind</span>
                                    <span class="rounded-pill badge-soft-success pe-2">Html </span>
                                    <span class="rounded-pill badge-soft-danger pe-2">Css</span>
                                    <span class="rounded-pill badge-soft-primary pe-2">Php</span>
                                    <span class="rounded-pill badge-soft-warning pe-2">Laravel</span>
                                    <span class="rounded-pill badge-soft-danger pe-2">Design Pattern</span>
                                    <span class="rounded-pill badge-soft-primary pe-2">Web development</span>
                                    <span class="rounded-pill badge-soft-info pe-2">Web App</span></p>
                            </div>
                            <div class="col-md-10 mb-2">


                            </div>
                            <div class="col-md-10 ">

                            </div>
                        </div>
                    </div>
                </div>
            </div> <!-- end container-fluid -->
        </div>    <!-- End Page-content -->
    </div><!-- end main content-->
    <footer class="footer">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-6">
                    All Rights Reserved
                    <script>document.write(new Date().getFullYear())</script>
                    © Upcube.
                </div>
                <div class="col-sm-6">
                    <div class="text-sm-end d-none d-sm-block">
                        Crafted with <i class="mdi mdi-heart text-danger"></i> By <a href="#">DAVID COLE</a>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</div><!-- END layout-wrapper -->
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
        <hr class="mt-0"/>
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
                <input class="form-check-input theme-choice" type="checkbox" id="dark-mode-switch"
                       data-bsStyle="<%=basePath%>assets/css/bootstrap-dark.min.css" data-appStyle="<%=basePath%>assets/css/app-dark.min.css">
                <label class="form-check-label" for="dark-mode-switch">Dark Mode</label>
            </div>

            <div class="mb-2">
                <img src="<%=basePath%>assets/images/layouts/layout-3.jpg" class="img-fluid img-thumbnail" alt="layout-3">
            </div>
            <div class="form-check form-switch mb-5">
                <input class="form-check-input theme-choice" type="checkbox" id="rtl-mode-switch"
                       data-appStyle="<%=basePath%>assets/css/app-rtl.min.css">
                <label class="form-check-label" for="rtl-mode-switch">RTL Mode</label>
            </div>
        </div>
    </div> <!-- end slimscroll-menu-->
</div>
<!-- /Right-bar -->

<!-- Right bar overlay-->
<div class="rightbar-overlay"></div>
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
<!--tinymce js-->
<script src="<%=basePath%>assets/libs/tinymce/tinymce.min.js"></script>

<!-- init js -->
<script src="<%=basePath%>assets/js/pages/form-editor.init.js"></script>
<!--<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>-->
<!-- App js -->
<script src="<%=basePath%>assets/js/app.js"></script>
<%--<script>--%>
<%--    function checkParam2(content){--%>
<%--       const inputField = content.val();--%>
<%--        if(inputField === ""){--%>
<%--            $('#post_answer').attr('disabled', "true");--%>
<%--        }else{--%>
<%--            if( inputField !== "") {--%>
<%--                $('#post_answer').removeAttr('disabled');--%>
<%--            }--%>
<%--        }--%>
<%--    }--%>
<%--</script>--%>
</body>

</html>

