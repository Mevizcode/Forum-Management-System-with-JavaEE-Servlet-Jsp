<%@ page import="com.Util.newUserCounter" %>
<div class="row">
    <div class="col-xl-4 col-md-6">
        <div class="card">
            <div class="card-body">
                <div class="d-flex">
                    <div class="flex-grow-1">
                        <p class="text-truncate font-size-14 mb-2">Total Users</p>
                        <h5 class="mb-2"><%=userList.size()%> User(s)</h5>
                        <p class="text-muted mb-0"><span class="text-success fw-bold font-size-12 me-2"><i
                                class="ri-arrow-right-up-line me-1 align-middle"></i>9.23%</span>from previous period
                        </p>
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
                        <h5 class="mb-2"><%=newUserCounter.getCountNewUsers()%> User(s)</h5>
                        <p class="text-muted mb-0"><span class="text-success fw-bold font-size-12 me-2"><i
                                class="ri-arrow-right-up-line me-1 align-middle"></i>16.2%</span>from previous period
                        </p>
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
                        <h5 class="mb-2"><%=onlineUserCounter.getOnlineUserNumber() - 1%> user(s) online</h5>
                        <p class="text-muted mb-0"><span class="text-success fw-bold font-size-12 me-2"><i
                                class="ri-arrow-right-up-line me-1 align-middle"></i>11.7%</span>from previous period
                        </p>
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
</div>
<!-- end row -->
