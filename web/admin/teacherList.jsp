<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>emplist</title>
		<meta content="" charset="UTF-8" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link rel="stylesheet" type="text/css" href="css/style.css" />
		<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	</head>
	
	<body>
	<c:if test="${admin==null}"><c:redirect url="../loginAdmin.jsp"></c:redirect> </c:if>
		<div id="wrap">
			<div id="top_content"> 
				<%@include file="head.jsp" %>
				<div id="content">
					<p id="whereami">
					</p>
					<h1>
						Welcome!
					</h1>
					<table class="table">
						<tr class="table_header">
							<td>
								编号
							</td>
							<td>
								姓名
							</td>
							<td>
								工资
							</td>
							<td>
								年龄
							</td>
							<td>
								手机号
							</td>
							<td>
								操作
							</td>
						</tr>
						<c:forEach items="${teacherList}" var="teacher" varStatus="stat">
						<tr class="row${stat.index%2+1}">
							<td>
								${teacher.id}
							</td>
							<td>
								${teacher.username}
							</td>
							<td>
								${teacher.password}
							</td>
							<td>
								${teacher.name}
							</td>
							<td>
								${teacher.phoneNo}
							</td>
							<td>
								<a href="../deleTeacher.do?id=${teacher.id}">删除</a>
							</td>
						</tr>
						</c:forEach>
					</table>
					<p>
						<input type="button" class="button" value="Add Teacher" onclick="location='addTeacher.jsp'"/>
					</p>
				</div>
			</div>
		</div>
	</body>
</html>
