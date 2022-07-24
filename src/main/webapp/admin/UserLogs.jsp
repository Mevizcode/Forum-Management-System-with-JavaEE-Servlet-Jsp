<%@include file="Admin_header.jsp"%>
<div class="spinner-border text-secondary m-1" role="status">
    <span class="sr-only">Loading...</span>
</div>
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
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">Analytic</a></li>
                                    <li class="breadcrumb-item active">Users Logs</li>
                                </ol>
                            </div>

                        </div>
                    </div>
                </div>
                <!-- end page title -->

             <%--   <%@include file="Admin-divider.jsp" %> --%>
                <!--- row table-->
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card">
                                <div class="card-body">
                                    <div class="card-title">User Login Times</div>
                                    <div id="userlog_data" style="display: none">
                                        <%
                                            ResultSet rs = (ResultSet) request.getAttribute("userLogs");
                                            if (rs != null){
                                                while (rs.next()){
                                                    %>
                                                    <span class="userlog_cell_username"><%=rs.getString("username")%></span><span class="userlog_cell_frequency"><%=rs.getString("count(1)")%></span>
                                                    <%
                                                }
                                            } else{
                                                %>
                                                <h4>Failed to obtain user log information!</h4>
                                        <%
                                                }
                                        %>
                                    </div>
                                        <canvas id="userLog_barChart">

                                        </canvas>
                                </div>
                        </div>
                    </div> <!-- end col -->
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                            <div class="card-title">User Gender Ratio</div>
                                <div id="userLog_gender_data" style="display: none">
                                    <%
                                        ResultSet rs_gender = (ResultSet) request.getAttribute("userLog_gender_rs");
                                        if (rs_gender!=null){
                                            while (rs_gender.next()){
                                                %>
                                    <span class="userLog_gender_cell"><%=rs_gender.getString("Gender")%></span>
                                    <span class="userLog_gender_num"><%=rs_gender.getString("GenderNum")%></span>
                                    <%
                                            }
                                        }else {
                                            %>
                                    <h4>Failed to obtain gender information!</h4>
                                    <%
                                            }
                                    %>
                                </div>
                                <canvas id="userlog_gender_pieChart">

                                </canvas>
                            </div>
                        </div>
                    </div>
                </div> <!-- end row -->

                <!-- Daily Logins row -->
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title">Total Visit Per Day</div>
                                <div id="userLog_logins_data" style="display:none;">
                                    <%
                                        ResultSet rs_loginPerDay = (ResultSet) request.getAttribute("dailyLogins");
                                       if(rs_loginPerDay!=null){
                                           while (rs_loginPerDay.next()){
                                               %>
                                            <span class="todayLogins"><%=rs_loginPerDay.getString("Today")%></span>
                                            <span class="yesterdayLogins"><%=rs_loginPerDay.getString("Yesterday")%></span>
                                            <span class="dayBeforeLogins"><%=rs_loginPerDay.getString("2_days_ago")%></span>
                                            <span class="3daysAgoLogins"><%=rs_loginPerDay.getString("3_days_ago")%></span>
                                            <span class="4DaysAgoLogins"><%=rs_loginPerDay.getString("4_days_ago")%></span>
                                    <%
                                           }
                                       }else{
                                           %>
                                    <h4>Fail to obtain logins information</h4>
                                    <%
                                       }
                                    %>
                                </div>
                                <canvas id="logins_data_chart">

                                </canvas>
                            </div>
                        </div>
                    </div>
                   <!-- <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title">Active Time Ratio</div>
                                <div id="userLog_ActiveTime_data" style="display: none">
                                   <%-- <%
                                        ResultSet rs_activeTimePerUser = (ResultSet) request.getAttribute("activeTimePerUser");
                                        if (rs_activeTimePerUser != null){
                                            try{
                                            while (rs_activeTimePerUser.next()){
                                                %>
                                                <span class="username_Per_ActiveTime"><%=rs_activeTimePerUser.getString("username")%></span>
                                                <span class="userLog_ActiveTime_Data"><%=rs_activeTimePerUser.getString("active_time")%></span>
                                    <%
                                            }
                                        }catch (Exception e){
                                                e.printStackTrace();
                                            }
                                        }else{
                                            %>
                                        <h4>Fail to obtain Active Time Ratio</h4>
                                    <%
                                        }
                                    %>--%>
                                </div>
                                <canvas id="activeTimeRatio_chart">

                                </canvas>
                            </div>
                        </div>
                    </div>
                </div>-->


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

<%@include file="Admin_Right-bar.jsp"%>

<%@include file="Admin_footer.jsp"%>
