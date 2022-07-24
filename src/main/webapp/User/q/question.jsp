<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String username = (String) session.getAttribute("username");
    String path = request.getContextPath();
    String basePath = request.getScheme()+ "://"+request.getServerName()+":"+ request.getServerPort()+path+"/";
%>

<!doctype html>
<html lang="en">

<head>

    <meta charset="utf-8" />
    <title>Question</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- App favicon -->
    <link rel="shortcut icon" href="<%=basePath%>assets/images/favicon.ico">
    <!-- Bootstrap Css id="bootstrap-style"-->
    <link href="<%=basePath%>assets/css/bootstrap-dark.min.css" rel="stylesheet" type="text/css"/>
    <!-- Icons Css -->
    <link href="<%=basePath%>assets/css/icons.min.css" rel="stylesheet" type="text/css"/>
    <!-- App Css id="app-style"-->
    <link href="<%=basePath%>assets/css/app-dark.min.css" rel="stylesheet" type="text/css"/>
</head>

<body data-topbar="dark" data-sidebar="dark" data-appStyle="dark">

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

                <button type="button" class="btn btn-sm px-3 font-size-24 header-item waves-effect" id="vertical-menu-btn">
                    <i class="ri-menu-2-line align-middle"></i>
                </button>

                <!-- App Search-->
                <form class="app-search d-none d-lg-block">
                    <div class="position-relative">
                        <input type="text" class="form-control" placeholder="Search...">
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

                <div class="d-none d-lg-inline-block ms-1">
                    <button type="submit" class="btn header-item noti-icon waves-effect">
                        <a href="<%=basePath%>User/login.jsp" class=" font-size-18 text-white">Login</a>
                    </button>
                </div>

                <div class="d-none d-lg-inline-block ms-1">
                    <button type="submit" class="btn header-item noti-icon waves-effect">
                        <a href="<%=basePath%>User/register.jsp" class=" font-size-18 text-white">Sign Up</a>
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
    <!-- Start right Content here -->
    <!-- ============================================================== -->
    <div class="main-content">

        <div class="page-content">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-8">
                        <div class="card">
                            <div class="card-body">
                                <form method="post" action="${pageContext.request.contextPath}/questionServlet">
                                    <div style="display: none">
                                        <input type="hidden" name="username" value="${sessionScope.username}">
                                    </div>
                                    <div class="form-group mb-5 row">
                                        <h4>Title</h4>
                                        <p class="card-text">Be direct to the point</p>
                                        <div class="col-12">
                                            <input class="form-control" id="title" title="Must be 10 characters long!" type="text" name="title"  maxlength="250" minlength="10"  placeholder="eg. how to sort an array using bubble sort in java?" autocomplete="off" required>
                                        </div>
                                    </div>
                                    <div class="form-group mb-5 row">
                                        <h4>Body</h4>
                                        <p class="card-text">Attach all necessary information needed to answer your question </p>
                                    <textarea id="elm1" name="area" placeholder="Type your question here....." onclick="checkInputParameters(this);"></textarea>
                                    </div>
                                    <div class="form-group mb-3 row">
                                        <h4>Tags</h4>
                                        <p class="card-text">Add at most 5 tags to describe your question</p>
                                        <div class="col-12">
                                            <input class="form-control" type="text" name="tag"  maxlength="300" minlength="15"  placeholder="eg. java arrays bubble-sort" autocomplete="off" >
                                        </div>
                                    </div>

                                    <div class="form-group mb-4 row mt-3 pt-1">
                                        <div class="col-12">
                                            <button class="btn btn-info  waves-effect waves-light" id="btn-post-question" type="submit">Post your question</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div> <!-- end col -->
                </div> <!-- end row -->

            </div> <!-- container-fluid -->
        </div>
        <!-- End Page-content -->

        <footer class="footer">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-6">
                      All Rights Reserved  <script>document.write(new Date().getFullYear())</script> © Upcube.
                    </div>
                    <div class="col-sm-6">
                        <div class="text-sm-end d-none d-sm-block">
                            Crafted with <i class="mdi mdi-heart text-danger"></i> By <a href="#">DAVID COLE</a>
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

<!-- JAVASCRIPT -->
<script src="<%=basePath%>assets/libs/jquery/jquery.min.js"></script>
<script src="<%=basePath%>assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="<%=basePath%>assets/libs/metismenu/metisMenu.min.js"></script>
<script src="<%=basePath%>assets/libs/simplebar/simplebar.min.js"></script>
<script src="<%=basePath%>assets/libs/node-waves/waves.min.js"></script>

<!--tinymce js-->
<script src="<%=basePath%>assets/libs/tinymce/tinymce.min.js"></script>

<!-- init js -->
<script src="<%=basePath%>assets/js/pages/form-editor.init.js"></script>

<script src="<%=basePath%>assets/js/app.js"></script>
<script>
   /* function checkInputParameters(textField){
        var inputText = textField.val();
        if(inputText === ""){
            $('#btn-post-question').attr('disabled', "true");
        }else{
            if( inputText !== "") {
                $('#btn-post-question').removeAttr('disabled');
            }
        }
    }*/
</script>

<script>
   /* tinyMCE.init({
        mode : "specific_textareas",
        editor_selector : "mceEditor",
        setup: function (ed) {
            ed.on('keyup', function(e) {
                onChangeHandler(ed);
            });
        }
    });

    function onChangeHandler(inst) {
        var editorContent = tinyMCE.get('elm1').getContent()
        if ($.trim(editorContent) === '') {
            $('#btn-post-question').attr('disabled', true);
        } else {
            $('#btn-post-question').attr('disabled', false);
        }
    }*/
</script>

</body>
</html>
