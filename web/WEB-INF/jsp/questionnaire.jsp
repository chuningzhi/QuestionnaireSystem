<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线课堂问卷系统</title>
<link rel="stylesheet" type="text/css" href="admin/css/wenjuan_ht.css">

<script src="admin/js/jquery.form.js"></script>
<script src="admin/js/jquery-1.8.0.min.js"></script>
	<style type="text/css">
		.text-shadow{
		    text-shadow:#FF0000 0 0 10px;
		    color:#D2B48C;
		    font-size:200px
		}
	</style>

</head>
<body>
	<script type="text/javascript">
		$(document).ready(function(e) {
			$(".movie_box").hover(function(){ 
		 		 $(this).css({"border":"1px solid #0099ff"}); 
				},function(){ 
				 $(this).css({"border":"1px solid #fff"}); 
				$(this).children(".kzqy_czbut").remove();
				});	
		});
	</script>


	<div class=" all_660">
		<div class="yd_box">
		<div style="width: 100%;height:80px;text-align: center;">
			<label style="text-shadow:#FF0000 0 0 10px;color:white;font-size:60px;">课堂问卷系统</label>
		</div>
		<%
			int i=0;
			Server s = new ServerImpl();
			List<Question> list = s.findAllQues();
		%>
			<form action="../answerServlet?num=<%=list.size() %>" method="post">
			<%@page import="java.sql.ResultSet"%>
			<%@page import="java.util.*" %>
			<%@page import="zhi.entity.Question" %>
			<%
				//拿到List<Question>集合
				for(Question que : list){
					if(que.getQuestion_type().equals("xx")){%>
						<div class="movie_box">
							<ul class="wjdc_list">
								<li>
									<div class="tm_btitlt">
										<i class="nmb"><%=++i %></i>. <i class="btwenzi"><%=que.getQuestion() %></i>
									</div>
								</li>
								<li><label> <input name="<%=que.getQuestion_id() %>" type="radio" value="A">
										<span><%=que.getA() %></span></label></li>
								<li><label> <input name="<%=que.getQuestion_id() %>" type="radio" value="B">
										<span><%=que.getB() %></span></label></li>
								<li><label> <input name="<%=que.getQuestion_id() %>" type="radio" value="C">
										<span><%=que.getC() %></span></label></li>
								<li><label> <input name="<%=que.getQuestion_id() %>" type="radio" value="D">
										<span><%=que.getD() %></span></label></li>
							</ul>
							<div class="dx_box" data-t="0"></div>
						</div>
					<% }else if(que.getQuestion_type().equals("dx")){%>
						<div class="movie_box">
							<ul class="wjdc_list">
								<li>
									<div class="tm_btitlt">
										<i class="nmb"><%=++i %></i>. <i class="btwenzi"><%=que.getQuestion() %></i><span
											class="tip_wz">【多选】</span>
									</div>
								</li>
								<li><label> <input name="<%=que.getQuestion_id() %>" type="checkbox" value="A" lay-verify="required" >
										<span><%=que.getA() %></span></label></li>
								<li><label> <input name="<%=que.getQuestion_id() %>" type="checkbox" value="B" lay-verify="required" >
										<span><%=que.getB() %></span></label></li>
								<li><label> <input name="<%=que.getQuestion_id() %>" type="checkbox" value="C" lay-verify="required" >
										<span><%=que.getC() %></span></label></li>
								<li><label> <input name="<%=que.getQuestion_id() %>" type="checkbox" value="D" lay-verify="required" >
										<span><%=que.getD() %></span> </label></li>
							</ul>
							<div class="dx_box" data-t="1"></div>
						</div>
					<% }else{%>
						<div class="movie_box">
							<ul class="wjdc_list">
								<li>
									<div class="tm_btitlt">
										<i class="nmb"><%=++i %></i>. <i class="btwenzi"><%=que.getQuestion() %></i><span
											class="tip_wz">【填空】</span>
									</div>
								</li>
								<li>
									<label> 
										<textarea name="<%=que.getQuestion_id() %>" cols="" rows="" class="input_wenbk btwen_text btwen_text_dx"  onblur="if(!this.value)this.value=' '"	onclick="if(this.value&&this.value=='' )  this.value='  '"></textarea>
									</label>
								</li>
							</ul>
							<div class="dx_box" data-t="2"></div>
						</div>
						
				<% 		}
					}%>
				<div style="width: 100%;height:80px;text-align: center;">
					<input type="submit" value="完成答题" style="margin-bottom: 50px;width: 150px;height: 50px;align:center;">
				</div>
			</form>
		</div>
	</div>

</body>
</html>