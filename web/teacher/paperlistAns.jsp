<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>emplist</title>
		<meta content="" charset="UTF-8" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link rel="stylesheet" type="text/css" href="../css/style1.css" />
		<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
		<script type="text/javascript" src="js/paperlist.js"></script>
	</head>
	
	<body>
		<input type="hidden" value="${user.id}" id="teacherIdEle">
		<div id="wrap">
			<div id="top_content"> 
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
								试卷名
							</td>
							<td>
								题量
							</td>
							<td>
								操作
							</td>
						</tr>
						<c:forEach items="${papers}" var="paper" varStatus="stat">
						<tr class="row${stat.index%2+1}">
							<td>
								${paper.id}
							</td>
							<td>
								${paper.paper_name}
							</td>
							<td>
								${fn:length(paper.questions)}
							</td>
							<td>
								<a href="../toAnsDetail.do?paper_id=${paper.id}">查看结果</a>
							</td>
						</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</body>
</html>
