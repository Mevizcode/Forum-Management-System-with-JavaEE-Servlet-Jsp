<%@ page import="com.Entity.User" %>
<%@ page import="java.util.List" %>
<%@include file="Admin_header.jsp" %>

<!-- ============================================================== -->
<!-- Start right Content here -->
<!-- ============================================================== -->

<%
    if (username.equals("admin")) {
%>
<div id="layout-wrapper">
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
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">Admin Dashboard</a></li>
                                    <li class="breadcrumb-item active">Users List</li>
                                </ol>
                            </div>

                        </div>
                    </div>
                </div>
                <!-- end page title -->

                <!---- Getting total User -->
                <%
                    List<User> userList = (List<User>) request.getAttribute("userList");
                   // List<User> users = (List<User>) request.getAttribute("users");
                %>
                <%@include file="Admin-divider.jsp" %>
                <!--- row table-->
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">

                                <h3 class="card-title">User List </h3>
                                <div id="datatable-buttons_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                                    <div class="row">

                                        <div class="col-sm-12 col-md-6">
                                            <div>
                                                <button type="button" class="btn btn-outline-primary" onclick="history.back();"><i class="ri-arrow-go-back-line" style="font-size: 12px;"></i> Back</button>&nbsp;
                                            </div>
                                        </div>
                                    </div> <!--id="datatable-buttons"-->
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <table id="myTable"
                                                   class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer dtr-inline collapsed"
                                                   style="border-collapse: collapse; border-spacing: 0; width: 100%;"
                                                   role="grid" aria-describedby="datatable-buttons_info">
                                                <thead>
                                                <tr role="row" style="font-weight: bolder;">
                                                    <th class="sorting_asc">Username</th>
                                                    <th class="sorting_asc">Email</th>
                                                    <th class="sorting_asc">First Name</th>
                                                    <th class="sorting_asc">Last Name</th>
                                                    <th class="sorting_desc">Gender</th>
                                                    <th class="sorting_desc">Mobile</th>
                                                    <th colspan="3" style="width: 100px;text-align: center;">Actions</th>
                                                </tr>
                                                </thead>
                                                <c:forEach items="${users}" var="user">
                                                    <tr class="odd">
                                                        <td>${user.getUsername()}</td>
                                                        <td>${user.getEmail()}</td>
                                                        <td>${user.getFirstName()}</td>
                                                        <td>${user.getLastName()}</td>
                                                        <td>${user.getGender()}</td>
                                                        <td>${user.getMobile()}</td>
                                                        <td>
                                                            <a href="<%=request.getContextPath()%>/UserDetailServlet?id=${user.getId()}"
                                                               class="btn btn-light waves-effect waves-light">View</a>
                                                        </td>
                                                        <td>
                                                            <a href='<%=request.getContextPath()%>/UserDetailServlet?id=${user.getId()}'  class="btn btn-success waves-effect waves-light" onclick="return window.confirm('Do you want to update this user?')"> <!-- id="update-record"-->
                                                                <i class="ri-edit-box-line align-middle me-1" style="font-size: 12px;"></i>Update</a>
                                                        </td>
                                                        <td>
                                                            <a href='<%=request.getContextPath()%>/UserDeleteServlet?id=${user.getId()}'
                                                               class="btn btn-danger waves-effect waves-light" onclick="return window.confirm('Proceed to delete user')"> <!--  id="delete-record"-->
                                                               <i class="ri-delete-bin-2-line align-middle me-1" style="font-size: 12px;"></i>Delete</a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12 col-md-5">
                                            <div class="dataTables_info" id="datatable-buttons_info" role="status" aria-live="polite">
                                                Showing ${beginIndex+1} to ${endIndex} of ${applicationScope.userList.size()} entries
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-7">
                                                <ul class="pagination pagination-rounded justify-content-end">
                                                    <!-- pageIndex - 1 < 1 returns true, it should be disabled -->
                                                    <c:set var="disabled" value="${pageIndex - 1 < 1 ? 'disabled' : ''}"></c:set> <!--judge if the page is less than 1, if less than 1 disable previous button -->
                                                    <li class="paginate_button page-item ${disabled}">
                                                        <a href="${basePath}/userListServlet?pageIndex=${pageIndex-1}" class="page-link ">Previous</a>
                                                    </li>
                                                    <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                                                        <c:set var="active" value="${loop.index==pageIndex ? 'active' : ''}"></c:set> <!-- if true let the page be active  -->
                                                        <li class="paginate_button page-item  ${active}">
                                                            <a href="${basePath}/userListServlet?pageIndex=${loop.index}" class="page-link">${loop.index}</a>
                                                        </li>
                                                    </c:forEach>
                                                    <c:set var="disabled" value="${pageIndex + 1 > totalPages ? 'disabled' : ''}"></c:set>
                                                    <li class="paginate_button page-item next ${disabled}">
                                                        <a href="${basePath}/userListServlet?pageIndex=${pageIndex + 1 < totalPages ? pageIndex + 1 : totalPages}" class="page-link">Next</a>
                                                    </li>
                                                    <li class="paginate_button page-item ${disabled}">
                                                        <a href="${basePath}/userListServlet?pageIndex=${totalPages}" class="page-link">Last</a>
                                                    </li>
                                                </ul>
                                        </div>
                                    </div>
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
                        <script>document.write(new Date().getFullYear())</script>
                        © Upcube.
                    </div>
                </div>
            </div>
        </footer>

    </div>
    <!-- end main content-->

</div>
<!-- END layout-wrapper -->

<%@include file="Admin_Right-bar.jsp" %>

<%
    } else {
        response.sendRedirect("index.jsp");
    }
%>

<%@include file="Admin_footer.jsp" %>