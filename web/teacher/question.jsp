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
<script type="text/javascript" src="teacher/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="teacher/js/question.js"></script>
</head>
<body>
<c:if test="${user==null}"><c:redirect url="../login.jsp"></c:redirect> </c:if>

    <%--<div >
        <select style="margin-left: 100px;height: 30px" id="paper_select">
			<c:forEach items="${papers}" var="paper">
				<c:if test="${paper.id == paper_id}">
            		<option value="${paper.id}">${paper.id}:${paper.paper_name}</option>
				</c:if>
				<c:if test="${paper.id != paper_id}">
					<option value="${paper.id}">${paper.id}:${paper.paper_name}</option>
				</c:if>
			</c:forEach>
        </select>
    </div>--%>
<input value="${paper_id}" type="hidden" id="paper_id">
	<div class=" all_660">
		<div class="yd_box">
			<c:forEach items="${questions}" var="que">
				<c:if test="${que.question_type == 'xx'}">
					<div class="movie_box">
						<ul class="wjdc_list">
							<li>
								<div class="tm_btitlt">
									<a class="nmb">${que.que_num}</a>. <i class="btwenzi">${que.question}</i>
								</div>
							</li>
							<li><label> <input name="a" type="radio" value="">
									<span>${que.a}</span></label></li>
							<li><label> <input name="a" type="radio" value="">
									<span>${que.b}</span></label></li>
							<li><label> <input name="a" type="radio" value="">
									<span>${que.c}</span></label></li>
							<li><label> <input name="a" type="radio" value="">
									<span>${que.d}</span></label></li>
						</ul>
						<div class="dx_box" data-t=0></div>
					</div>
				</c:if>
				<c:if test="${que.question_type == 'dx'}">
					<div class="movie_box">
						<ul class="wjdc_list">
							<li>
								<div class="tm_btitlt">
									<a class="nmb">${que.que_num}</a>. <i class="btwenzi">${que.question}</i><span
										class="tip_wz">【多选】</span>
								</div>
							</li>
							<li><label> <input name="a" type="checkbox" value="">
								<span>${que.a}</span></label></li>
							<li><label> <input name="a" type="checkbox" value="">
								<span>${que.b}</span></label></li>
							<li><label> <input name="a" type="checkbox" value="">
								<span>${que.c}</span></label></li>
							<li><label> <input name="a" type="checkbox" value="">
								<span>${que.d}</span></label></li>
						</ul>
						<div class="dx_box" data-t=1></div>
					</div>
				</c:if>
				<c:if test="${que.question_type == 'tk'}">
					<div class="movie_box">
						<ul class="wjdc_list">
							<li>
								<div class="tm_btitlt">
									<a class="nmb">${que.que_num}</a>. <i class="btwenzi">${que.question}</i><span
										class="tip_wz">【填空】</span>
								</div>
							</li>
							<li>
								<label> 
									<textarea name="" cols="" rows="" class="input_wenbk btwen_text btwen_text_dx"  onblur="if(!this.value)this.value=' '"	onclick="if(this.value&&this.value=='' )  this.value='  '"></textarea>
								</label>
							</li>
						</ul>
						<div class="dx_box" data-t=2></div>
					</div>
				</c:if>
			</c:forEach>
	


			<!--选项卡区域  模板区域---------------------------------------------------------------------------------------------------------------------------------------->
			<div class="xxk_box">
				<ul class="xxk_title">
					<li class="on">单选</li>
					<li>多选</li>
					<li>填空</li>
				</ul>
				<div class="xxk_conn">
					
					<!--单选----------------------------------------------------------------------------------------------------------------------------------------->
					<div class="xxk_xzqh_box dxuan" id="xx_box">
						<form id="xx_form" action="../addQuestion.do?question_type=xx&que_num=${fn:length(questions)+1}&paper_id=${paper_id}" method="post" >
							<textarea name="question" cols="" rows=""
								class="input_wenbk btwen_text btwen_text_dx" placeholder="单选题目"></textarea>
							<div class="title_itram">
								<div class="kzjxx_iteam">
									<input name="" type="radio" value="" class="dxk"> <input
										name="A" type="text" class="input_wenbk" placeholder="选项" >
								</div>
								<div class="kzjxx_iteam">
									<input name="" type="radio" value="" class="dxk"> <input
										name="B" type="text" class="input_wenbk" placeholder="选项" >
								</div>
								<div class="kzjxx_iteam">
									<input name="" type="radio" value="" class="dxk"> <input
										name="C" type="text" class="input_wenbk" placeholder="选项" >
								</div>
								<div class="kzjxx_iteam">
									<input name="" type="radio" value="" class="dxk"> <input
										name="D" type="text" class="input_wenbk" placeholder="选项" >
								</div>
							</div>
	
							<!--完成编辑-->
							<div class="bjqxwc_box">
								<input type="reset" class="qxbj_but" id="xx_delete" value="取消编辑">
								<input type="submit" class="swcbj_but" id="xxwc_but" value="完成编辑">
							</div>
						</form>
					</div>
					
					
					
					<!--多选----------------------------------------------------------------------------------------------------------------------------------------->
					<div class="xxk_xzqh_box duoxuan hide" id="dx_box">
						<form id="dx_form" action="../addQuestion.do?question_type=dx&que_num=${fn:length(questions)+1}&paper_id=${paper_id}" method="post">
							<textarea name="question" cols="" rows=""
								class="input_wenbk btwen_text btwen_text_duox" placeholder="多选题目"></textarea>
							<div class="title_itram">
								<div class="kzjxx_iteam">
									<input name="" type="radio" value="" class="dxk"> <input
										name="A" type="text" class="input_wenbk" placeholder="选项">
								</div>
								<div class="kzjxx_iteam">
									<input name="" type="radio" value="" class="dxk"> <input
										name="B" type="text" class="input_wenbk" placeholder="选项">
								</div>
								<div class="kzjxx_iteam">
									<input name="" type="radio" value="" class="dxk"> <input
										name="C" type="text" class="input_wenbk" placeholder="选项">
								</div>
								<div class="kzjxx_iteam">
									<input name="" type="radio" value="" class="dxk"> <input
										name="D" type="text" class="input_wenbk" placeholder="选项">
								</div>
							</div>
							<!--完成编辑-->
							<div class="bjqxwc_box" >
								<input type="reset" class="qxbj_but" id="dx_delete" value="取消编辑">
								<input type="submit" class="swcbj_but" id="dxwc_but" value="完成编辑">
							</div>
						</form>
					</div>


					<!-- 填空----------------------------------------------------------------------------------------------------------------------------------------->
					<div class="xxk_xzqh_box tktm hide" id="tk_box">
						<form id="tk_form" action="../addQuestion.do?question_type=tk&que_num=${fn:length(questions)+1}&paper_id=${paper_id}" method="post">
							<textarea name="question" cols="" rows=""
								class="input_wenbk btwen_text btwen_text_tk" placeholder="填空题目"></textarea>
	
							<!--完成编辑-->
							<div class="bjqxwc_box">
								<input type="reset" class="qxbj_but" id="tk_delete" value="取消编辑">
								<input type="submit" class="swcbj_but" id="tkwc_but" value="完成编辑">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>