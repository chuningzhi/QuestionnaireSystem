<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="teacher/css/wenjuan_ht.css">
<link type="text/css" href="css/bootstrap.min.css">
<script type="text/javascript" src="teacher/js/jquery-1.8.0.min.js"></script>
</head>
<body>

<input value="${paper_id}" type="hidden" id="paper_id">
	<div class=" all_660 col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="yd_box col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<form action="../addAnswer.do" method="post">
				<c:forEach items="${questions}" var="que">
					<c:if test="${que.question_type == 'xx'}">
						<div class="movie_box col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<ul class="wjdc_list">
								<li>
									<div class="tm_btitlt col-xs-12 col-sm-12 col-md-12 col-lg-12">
										<a class="nmb">${que.que_num}</a>. <i class="btwenzi">${que.question}</i>
									</div>
								</li>
								<li><label> <input name="${que.question_id}" type="radio" value="">
										<span>${que.a}</span></label></li>
								<li><label> <input name="${que.question_id}" type="radio" value="">
										<span>${que.b}</span></label></li>
								<li><label> <input name="${que.question_id}" type="radio" value="">
										<span>${que.c}</span></label></li>
								<li><label> <input name="${que.question_id}" type="radio" value="">
										<span>${que.d}</span></label></li>
							</ul>
							<div class="dx_box col-xs-12 col-sm-12 col-md-12 col-lg-12" data-t=0></div>
						</div>
					</c:if>
					<c:if test="${que.question_type == 'dx'}">
						<div class="movie_box col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<ul class="wjdc_list col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<li>
									<div class="tm_btitlt col-xs-12 col-sm-12 col-md-12 col-lg-12">
										<a class="nmb">${que.que_num}</a>. <i class="btwenzi">${que.question}</i><span
											class="tip_wz">【多选】</span>
									</div>
								</li>
								<li><label> <input name="${que.question_id}" type="checkbox" value="">
									<span>${que.a}</span></label></li>
								<li><label> <input name="${que.question_id}" type="checkbox" value="">
									<span>${que.b}</span></label></li>
								<li><label> <input name="${que.question_id}" type="checkbox" value="">
									<span>${que.c}</span></label></li>
								<li><label> <input name="${que.question_id}" type="checkbox" value="">
									<span>${que.d}</span></label></li>
							</ul>
							<div class="dx_box col-xs-12 col-sm-12 col-md-12 col-lg-12" data-t=1></div>
						</div>
					</c:if>
					<c:if test="${que.question_type == 'tk'}">
						<div class="movie_box col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<ul class="wjdc_list">
								<li>
									<div class="tm_btitlt col-xs-12 col-sm-12 col-md-12 col-lg-12">
										<a class="nmb">${que.que_num}</a>. <i class="btwenzi">${que.question}</i><span
											class="tip_wz">【填空】</span>
									</div>
								</li>
								<li>
									<label>
										<textarea name="${que.question_id}" cols="" rows="" class="input_wenbk btwen_text btwen_text_dx"  onblur="if(!this.value)this.value=' '"	onclick="if(this.value&&this.value=='' )  this.value='  '"></textarea>
									</label>
								</li>
							</ul>
							<div class="dx_box col-xs-12 col-sm-12 col-md-12 col-lg-12" data-t=2></div>
						</div>
					</c:if>
				</c:forEach>
				<div style="width: 100%;height:80px;text-align: center;" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<input type="submit" value="完成答题" style="margin-bottom: 50px;width: 150px;height: 50px;align:center;">
				</div>
			</form>
		</div>
	</div>
</body>
</html>