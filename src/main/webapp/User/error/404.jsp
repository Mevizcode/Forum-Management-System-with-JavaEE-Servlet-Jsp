
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+ "://"+request.getServerName()+":"+ request.getServerPort()+path+"/";
%>
<!doctype html>
<html lang="en">

<head>

  <meta charset="utf-8" />
  <title>404 Error </title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- App favicon -->
  <link rel="shortcut icon" href="<%=basePath%>assets/images/favicon.ico">

  <!-- Bootstrap Css -->
  <link href="<%=basePath%>assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
  <!-- Icons Css -->
  <link href="<%=basePath%>assets/css/icons.min.css" rel="stylesheet" type="text/css" />
  <!-- App Css-->
  <link href="<%=basePath%>assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />

</head>

<body class="auth-body-bg">
<div class="bg-overlay"></div>
<div class="my-5 pt-5">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-lg-4">
        <div class="card">
          <div class="card-body">
            <div class="ex-page-content text-center">
              <h1>404!</h1>
              <h3>Sorry, page not found</h3><br>
                <%
                  if(request.getSession().getAttribute("username").equals("admin")){
                %>
              <a class="btn btn-info mb-5 waves-effect waves-light" href="<%=basePath%>/AdminServlet">Back to Dashboard</a>
              <%
                }else{
                    %>
              <a class="btn btn-info mb-5 waves-effect waves-light" href="<%=basePath%>/UserServlet">Back to Dashboard</a>
              <%
                }
              %>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="bg-white p-3 fixed-bottom border-top shadow">
  <div class="d-flex align-items-center justify-content-between flex-wrap">
    <ul class="list-inline mb-0">
      <li class="list-inline-item">Follow Us :</li>
      <li class="list-inline-item"><a href="javascript:;"><i class="bx bxl-facebook me-1"></i>Facebook</a>
      </li>
      <li class="list-inline-item"><a href="javascript:;"><i class="bx bxl-twitter me-1"></i>Twitter</a>
      </li>
      <li class="list-inline-item"><a href="javascript:;"><i class="bx bxl-google me-1"></i>Google</a>
      </li>
    </ul>
    <p class="mb-0">Copyright © 2022. All right By <a href="#">DAVID COLE</a>.</p>
  </div>
</div>

<!-- JAVASCRIPT -->
<script src="<%=basePath%>assets/libs/jquery/jquery.min.js"></script>
<script src="<%=basePath%>assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="<%=basePath%>assets/libs/metismenu/metisMenu.min.js"></script>
<script src="<%=basePath%>assets/libs/simplebar/simplebar.min.js"></script>
<script src="<%=basePath%>assets/libs/node-waves/waves.min.js"></script>

<script src="<%=basePath%>assets/js/app.js"></script>

</body>
</html>

