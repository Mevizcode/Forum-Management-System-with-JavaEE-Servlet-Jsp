<%@ page import="com.Entity.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.Util.newUserCounter" %>
<%@include file="Admin_header.jsp"%>
    <!-- ============================================================== -->
    <!-- Start right Content here -->
    <!-- ============================================================== -->
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
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">Admin</a></li>
                                    <li class="breadcrumb-item active">Dashboard</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end page title -->
                <div class="row">
                    <div class="col-xl-3 col-md-6">
                        <div class="card" >
                            <div class="card-body">
                                <div class="d-flex">
                                     <div class="flex-grow-1">
                                        <p class="text-truncate font-size-14 mb-2">Total Users</p>
                                        <h5 class="mb-2">${applicationScope.countTotalUsers.size()} Users</h5>

                                      <p class="text-muted mb-0"><span class="text-success fw-bold font-size-12 me-2"><i
                                                class="ri-arrow-right-up-line me-1 align-middle"></i>9.23%</span>from
                                            previous period</p>
                                    </div>
                                    <div class="avatar-sm">
                                                <span class="avatar-title bg-light text-primary rounded-3">
                                                    <i class="ri-team-line font-size-24"></i>
                                                </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%
                        ResultSet rs_CountPosts = (ResultSet) request.getAttribute("countTotalPosts");
                        if (rs_CountPosts!=null){
                    %>
                    <div class="col-xl-3 col-md-6">
                        <div class="card" >
                            <div class="card-body">
                                <div class="d-flex">
                                    <div class="flex-grow-1">
                                        <p class="text-truncate font-size-14 mb-2">Total Posts</p>
                                        <%
                                            while (rs_CountPosts.next()){
                                        %>
                                        <h5 class="mb-2"><%=rs_CountPosts.getString("count(*)")%> posts</h5>
                                        <%
                                            }
                                        %>
                                        <p class="text-muted mb-0"><span class="text-success fw-bold font-size-12 me-2"><i
                                                class="ri-arrow-right-up-line me-1 align-middle"></i>11.7%</span>from
                                            previous period</p>
                                    </div>
                                    <div class="avatar-sm">
                                                <span class="avatar-title bg-light text-success rounded-3">
                                                    <i class="mdi mdi-access-point font-size-24"></i>
                                                 </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                        }else{
                            %>
                    <h4>Cannot get total posts</h4>
                    <%
                        }

                    %>

                   <div class="col-xl-3 col-md-6">
                        <div class="card" >
                            <div class="card-body">
                                <div class="d-flex">
                                    <div class="flex-grow-1">
                                        <p class="text-truncate font-size-14 mb-2">New Users</p>
                                        <h5 class="mb-2"><%=newUserCounter.getCountNewUsers()%> User(s)</h5>
                                        <p class="text-muted mb-0"><span class="text-success fw-bold font-size-12 me-2"><i
                                                class="ri-arrow-right-up-line me-1 align-middle"></i>16.2%</span>from
                                            previous period</p>
                                    </div>
                                    <div class="avatar-sm">
                                                <span class="avatar-title bg-light text-primary rounded-3">
                                                    <i class="ri-user-3-line font-size-24"></i>
                                                </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-3 col-md-6">
                        <div class="card" >
                            <div class="card-body">
                                <div class="d-flex">
                                    <div class="flex-grow-1">
                                        <p class="text-truncate font-size-14 mb-2">Online Users</p>
                                        <h5 class="mb-2"><%=onlineUserCounter.getOnlineUserNumber()-1%> user(s) online</h5>
                                        <p class="text-muted mb-0"><span class="text-success fw-bold font-size-12 me-2"><i
                                                class="ri-arrow-right-up-line me-1 align-middle"></i>11.7%</span>from
                                            previous period</p>
                                    </div>
                                    <div class="avatar-sm">
                                                <span class="avatar-title bg-light text-success rounded-3">
                                                    <i class="mdi mdi-access-point font-size-24"></i>
                                                 </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!---- Search Result ---->
                <!--- Display newly added users -->
                <div class="row">
                    <div class="col-xl-8">
                        <div class="card">
                            <div class="card-body">
                                <h6 class="text-center card-header">New Users</h6>
                                <div class="row">
                                    <div class="col-sm-8">
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
                                                <th class="sorting_desc">Date Joined</th>
                                            </tr>
                                            </thead>
                                            <c:forEach items="${requestScope.newlyAdded}" var="newUsers">
                                            <tr class="odd">
                                                <td>${newUsers.username}</td>
                                                <td>${newUsers.email}</td>
                                                <td>${newUsers.firstName}</td>
                                                <td>${newUsers.lastName}</td>
                                                <td>${newUsers.gender}</td>
                                                <td>${newUsers.createdOn}</td>
                                            </tr>
                                            </c:forEach>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                        ResultSet setUserByMaxActiveTime = (ResultSet) request.getAttribute("setUserByMaxActiveTime");
                        if(setUserByMaxActiveTime != null){
                    %>
                    <div class="col-4">
                        <div class="card">
                            <div class="card-body">
                                <h6 class="text-center card-header">Max Active Session Per User</h6>
                                <table
                                       class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer dtr-inline collapsed"
                                       style="border-collapse: collapse; border-spacing: 0; width: 100%;"
                                       role="grid" aria-describedby="datatable-buttons_info">
                                    <thead>
                                    <tr role="row" style="font-weight: bolder;">
                                        <th class="sorting_asc">Username</th>
                                        <th class="sorting_asc">Max Active Time</th>
                                    </tr>
                                    </thead>
                                    <%
                                        while (setUserByMaxActiveTime.next()){
                                    %>
                                        <tr class="odd">
                                            <td><%=setUserByMaxActiveTime.getString("username")%></td>
                                            <td><%=setUserByMaxActiveTime.getString("max(active_time)")%></td>
                                        </tr>
                                   <%
                                       }
                                   %>
                                </table>
                            </div>
                        </div>
                    </div>
                    <%
                        }else{
                            %>
                    <h4>Fail to obtain information</h4>
                    <%
                        }
                    %>
                    <div>
                    </div>
                </div>
            </div><!-- container fluid -->
        </div>
        <!-- End Page-content -->

        <footer class="footer">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-6">
                        <script>document.write(new Date().getFullYear())</script> Upcube.
                    </div>
                </div>
            </div>
        </footer>
    </div>
    <!-- end main content-->
</div>
<!-- END layout-wrapper -->
<%@include file="Admin_Right-bar.jsp"%>

<%@include file="Admin_footer.jsp"%>
