<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
		<link rel="icon" type="image/png" sizes="16x16" href="../assets/images/favicon.png">
		<link href="../assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	    <link href="../assets/plugins/chartist-js/dist/chartist.min.css" rel="stylesheet">
	    <link href="../assets/plugins/chartist-js/dist/chartist-init.css" rel="stylesheet">
	    <link href="../assets/plugins/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.css" rel="stylesheet">
	    <link href="../assets/plugins/c3-master/c3.min.css" rel="stylesheet">
	    <link href="css/style.css" rel="stylesheet">
	    <link href="css/colors/blue.css" id="theme" rel="stylesheet">
</head>
<body>
<c:if test="${user==null}"><c:redirect url="../login.jsp"></c:redirect> </c:if>
	<script type="text/javascript">
		
	</script>
		<div class="page-wrapper" style="margin-left: 0px;">
            <div class="container-fluid">
                <div class="row page-titles">
                    <div class="col-md-5 col-8 align-self-center">
                        <h3 class="text-themecolor m-b-0 m-t-0">Information</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                            <li class="breadcrumb-item active">Information</li>
                        </ol>
                    </div>
                </div>
                
                
                <div class="row">
                    <!-- Column -->
                    <!-- Column -->
                    <div class="col-lg-8 col-xlg-9 col-md-7">
                        <div class="card">
                            <div class="card-block">
                                <form class="form-horizontal form-material" action="../updateTeacher.do">
                                    <div class="form-group">
                                        <input type="hidden" name="id" value="${user.id}">
                                        <label class="col-md-12">账号:</label>
                                        <div class="col-md-12">
                                            <input type="text" name="username" readonly="readonly" value="${user.username}" class="form-control form-control-line">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">密码:</label>
                                        <div class="col-md-12">
                                            <input type="password" name="password" value="${user.password}" class="form-control form-control-line">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">手机号码:</label>
                                        <div class="col-md-12">
                                            <input type="text" name="phoneNo" value="${user.phoneNo}" class="form-control form-control-line">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">姓名:</label>
                                        <div class="col-md-12">
                                           <input type="text" readonly="readonly" value="${user.name}" name="name" class="form-control form-control-line">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <button type="submit" class="btn btn-success">提交</button>
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
    <script src="../assets/plugins/jquery/jquery.min.js"></script>
    <script src="../assets/plugins/bootstrap/js/tether.min.js"></script>
    <script src="../assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="js/jquery.slimscroll.js"></script>
    <script src="js/waves.js"></script>
    <script src="js/sidebarmenu.js"></script>
    <script src="../assets/plugins/sticky-kit-master/dist/sticky-kit.min.js"></script>
    <script src="js/custom.min.js"></script>
</body>
</html>