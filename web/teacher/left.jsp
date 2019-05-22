<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
        <script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
</head>
<body>
        <c:if test="${user==null}"><c:redirect url="../login.jsp"></c:redirect> </c:if>
		<script type="text/javascript">
            $(function () {

                $("#logout").live("click",function () {
                    $.ajax({
                        url:"../logout.do",
                        type:"post",
                        dataType:"text",
                        success:function (data) {
                            window.parent.location.reload();
                        }
                    });
                })
            })
           /* function logout() {
                window.parent.location.reload();
            }*/
		</script>
	<div class="scroll-sidebar">
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                        <li> <a class="waves-effect waves-dark" href="../findAllAns.do" target="right" aria-expanded="false"><i class="mdi mdi-gauge"></i><span class="hide-menu" style="font-size: 20px;">数据分析</span></a>
                        </li>
                        <li> <a class="waves-effect waves-dark" href="../goQuestion.do" target="right" aria-expanded="false"><i class="mdi mdi-table"></i><span class="hide-menu" style="font-size: 20px;">编辑题目</span></a>
                        </li>
                        <li> <a class="waves-effect waves-dark" href="information.jsp" target="right" aria-expanded="false"><i class="mdi mdi-account-check"></i><span class="hide-menu" style="font-size: 20px;">修改个人信息</span></a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="sidebar-footer">
                <a href="" class="link" data-toggle="tooltip" title="Settings"><i class="ti-settings"></i></a>
                <a href="../logout.do" onlick="logout()" id="logout" class="link" data-toggle="tooltip" title="Logout"><i class="mdi mdi-power"></i></a>
            </div>
</body>
</html>