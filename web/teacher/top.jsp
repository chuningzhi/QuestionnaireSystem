<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
    <c:if test="${user == null}"><c:redirect url="../login.jsp"></c:redirect> </c:if>
	<div id="main-wrapper">
        <div class="topbar">
            <nav class="navbar top-navbar navbar-toggleable-sm navbar-light">
                <div class="navbar-header">
                    <a class="navbar-brand" href="javascript:void(0)">
                            <img src="../assets/images/logo-light-icon.png" alt="homepage" class="light-logo" />
                        </b>
                         <label style="color:white;font-size:20px;margin-left: 5px;padding-top: 0px;">问卷系统管理</label></span> </a>
                </div>
                <div style="color: white;font-size: 10px;margin-left: 50px">
                    欢迎你！${user.name}
                </div>
            </nav>
        </div>
    </div>
</body>
</html>