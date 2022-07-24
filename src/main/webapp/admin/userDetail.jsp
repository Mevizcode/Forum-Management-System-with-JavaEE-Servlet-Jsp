<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.Listeners.onlineUserCounter" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.Util.newUserCounter" %>
<%@ include file="Admin_header.jsp"%>
<%
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
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">Upcube</a></li>
                                    <li class="breadcrumb-item active">User Detail</li>
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
                            <h4 class="mb-sm-0">View User Detail</h4>

                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">User</a></li>
                                    <li class="breadcrumb-item active">Current User</li>
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

                                <h4 class="card-title">Update user details</h4>

                            <%
                                ResultSet rs = (ResultSet) request.getAttribute("userDetails");
                                if(rs!=null){
                            %>
                                <div class="table-responsive">
                                    <table class="table table-editable table-nowrap align-middle table-edits">
                                        <form method="post" action="${pageContext.request.contextPath}/UserUpdateServlet?Id=<%=rs.getString("Id")%>" >

                                        <tr data-id="1"><td data-field="id" style="width: 80px">Username</td><td><input type="text" name="username" value='<%=rs.getString("username")%>'></td></tr>
                                        <tr data-id="2"><td data-field="id" style="width: 80px">Email</td><td><input type="email" name="email" value='<%=rs.getString("email")%>'></td></tr>
                                        <tr data-id="3"><td data-field="id" style="width: 80px">First Name</td><td><input type="text" name="firstname" value='<%=rs.getString("first_name")%>'></td></tr>
                                        <tr data-id="4"><td data-field="id" style="width: 80px">Last Name</td><td><input type="text" name="lastname" value='<%=rs.getString("last_name")%>'></td></tr>
                                        <tr data-id="5"><td data-field="id" style="width: 80px">Gender</td><td><input type="text" name="gender" value='<%=rs.getString("gender")%>'></td></tr>
                                        <tr data-id="6"><td data-field="id" style="width: 80px">Birthday</td><td><input type="text" name="birthday" value='<%=rs.getDate("birthday")%>'></td></tr>
                                        <tr data-id="7"><td data-field="id" style="width: 80px">Age</td><td><input type="text" name="age" value='<%=rs.getLong("age")%>'></td></tr>
                                        <tr data-id="8"><td data-field="id" style="width: 80px">Address</td><td><input type="text" name="address" value='<%=rs.getString("address")%>'></td></tr>
                                        <tr data-id="9"><td data-field="id" style="width: 80px">Mobile</td><td><input type="text" name="mobile" value='<%=rs.getString("mobile")%>'></td></tr>
                                        <tr data-id="10"><td data-field="id" style="width: 80px">Password</td><td><input type="password" name="password" value='<%=rs.getString("password")%>'></td></tr>
                                            <tr><td><input type="submit" value="Update" class="btn btn-primary"></td><td><input type="button" value="Back" class="btn btn-primary" onclick="history.back()"></td></tr>
                                        </form>
                                    </table>
                                <%
                                }else{
                                %>
                                    <h5>Fail to acquire the information of the user</h5>

                                    <%
                                    }
                                %>
                                </div>
                            </div>
                        </div>
                    </div> <!-- end col -->
                </div> <!-- end row -->

                <!-- end col -->

            </div>

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
                <img src="<%=basePath%>/assets/images/layouts/layout-1.jpg" class="img-fluid img-thumbnail" alt="layout-1">
            </div>

            <div class="form-check form-switch mb-3">
                <input class="form-check-input theme-choice" type="checkbox" id="light-mode-switch" checked>
                <label class="form-check-label" for="light-mode-switch">Light Mode</label>
            </div>

            <div class="mb-2">
                <img src="<%=basePath%>/assets/images/layouts/layout-2.jpg" class="img-fluid img-thumbnail" alt="layout-2">
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

<!-- Buttons examples -->
<script src="<%=basePath%>/assets/libs/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<script src="<%=basePath%>/assets/libs/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js"></script>
<script src="<%=basePath%>/assets/libs/jszip/jszip.min.js"></script>
<script src="<%=basePath%>/assets/libs/pdfmake/build/pdfmake.min.js"></script>
<script src="<%=basePath%>/assets/libs/pdfmake/build/vfs_fonts.js"></script>
<script src="<%=basePath%>/assets/libs/datatables.net-buttons/js/buttons.html5.min.js"></script>
<script src="<%=basePath%>/assets/libs/datatables.net-buttons/js/buttons.print.min.js"></script>
<script src="<%=basePath%>/assets/libs/datatables.net-buttons/js/buttons.colVis.min.js"></script>

<script src="<%=basePath%>/assets/libs/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
<script src="<%=basePath%>/assets/libs/datatables.net-select/js/dataTables.select.min.js"></script>


<!-- Responsive examples -->
<script src="<%=basePath%>/assets/libs/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script src="<%=basePath%>/assets/libs/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>

<script src="<%=basePath%>/assets/js/pages/dashboard.init.js"></script>

<!-- Table Editable plugin -->
<script src="<%=basePath%>/assets/libs/table-edits/build/table-edits.min.js"></script>

<script src="<%=basePath%>/assets/js/pages/table-editable.init.js"></script>


<!-- App js -->
<script src="<%=basePath%>/assets/js/app.js"></script>


</body>
</html>

