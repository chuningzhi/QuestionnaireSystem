<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>课堂问卷系统后台</title>
</head>
	<c:if test="${user==null}"><c:redirect url="../login.jsp"></c:redirect> </c:if>
	<frameset rows="15%,*" frameborder="0px">
		<frame src="top.jsp" frameborder="0px"/>
		<frameset cols="20%,*" frameborder="0px">
			<frame src="left.jsp" frameborder="0px"/>
			<frame name="right" frameborder="0px"/>
		</frameset>
	</frameset>
</html>