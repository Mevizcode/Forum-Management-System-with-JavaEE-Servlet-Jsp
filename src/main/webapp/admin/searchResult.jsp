<%--
  Created by IntelliJ IDEA.
  User: David Cole
  Date: 5/18/2022
  Time: 2:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.Entity.User" %>
<%@ page import="java.util.List" %>
<%@include file="Admin_header.jsp"%>
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
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">Search</a></li>
                                    <li class="breadcrumb-item active">Search Result</li>
                                </ol>
                            </div>

                        </div>
                    </div>
                </div>

                <!-- Display Search Result -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card">
                            <div class="card-body">
                                <%
                                   // List<User> result = (List<User>) request.getAttribute("searchResult");
                                    List<User> rsSearchCount = (List<User>) request.getAttribute("searchCount");
                                    if(rsSearchCount != null){

                                %>
                                <div class="card-title"><h5>Search Result: <%=rsSearchCount.size()%> results found</h5>
                                </div>

                                <div class="table-responsive " tabindex="1" style="overflow: hidden; outline: none;">
                                    <table class="table table-striped table-bordered">
                                        <thead role="row">
                                        <th class="sorting_asc">Username</th>
                                        <th class="sorting_desc">Email</th>
                                        <th class="sorting_asc">First Name</th>
                                        <th class="sorting_desc">Last Name</th>
                                        <th colspan="3" class="text-center">Action</th>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${searchResult}" var="user">
                                            <tr>
                                                <td>${user.getUsername()}</td>
                                                <td>${user.getEmail()}</td>
                                                <td>${user.getFirstName()}</td>
                                                <td>${user.getLastName()}</td>
                                                <td>
                                                    <a class="btn btn-light" href="<%=request.getContextPath()%>/UserDetailServlet?id=${user.getId()}">Detail</a>
                                                </td>
                                                <td>
                                                    <a class="btn btn-outline-success" href="<%=request.getContextPath()%>/UserDetailServlet?id=${user.getId()}"
                                                       onclick="return window.confirm('Are you sure to update a user?')">Update</a>
                                                </td>
                                                <td>
                                                    <a class="btn btn-outline-danger" href="<%=request.getContextPath()%>/UserDeleteServlet?id=${user.getId()}"
                                                       onclick="return window.confirm('Are you sure to delete a user?')">Delete</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        <!-- <p>Search Result:  results found</p> -->
                                        </tbody>
                                    </table>
                                </div>
                                <!-- pagination column -->
                                <div class="col-sm-12">
                                    <ul class="pagination pagination-rounded">
                                        <c:set var="disabled" value="${pageIndex - 1 < 1 ? 'disabled' : ''}"></c:set>
                                        <li class="paginate_button page-item ${disabled}">
                                            <a class="page-link" href="${basePath}/SearchServlet?pageIndex=${pageIndex-1}">Previous</a>
                                        </li>
                                        <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                                            <c:set var="active" value="${loop.index==pageIndex ? 'active' : ''}"></c:set>
                                            <li class="paginate_button page-item ${active}">
                                                <a class="page-link" href="${basePath}/SearchServlet?pageIndex=${loop.index}">${loop.index}</a>
                                            </li>
                                        </c:forEach>
                                        <c:set var="disabled" value="${pageIndex + 1 > totalPages ? 'disabled' : ''}"></c:set>
                                        <li class="paginate_button page-item ${disabled}">
                                            <a class="page-link" href="${basePath}/SearchServlet?pageIndex=${pageIndex + 1 < totalPages ? pageIndex + 1 : totalPages}">Next</a>
                                        </li>
                                        <li class="paginate_button page-item ${disabled}">
                                            <a href="${basePath}/SearchServlet?pageIndex=${totalPages}" class="page-link">Last</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <%
                            }else {
                                        %>
                       <h6>No User Found</h6>
                        <%
                            }
                        %>

                    </div><!-- end col -->
                </div><!-- end row -->

            </div> <!-- end container-fluid -->
        </div> <!-- end page-content -->
    </div> <!-- end main-content -->
</div> <!-- end layout-wrapper -->
<%@include file="Admin_Right-bar.jsp"%>
<%@include file="Admin_footer.jsp"%>