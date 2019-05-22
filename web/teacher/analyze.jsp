<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	<link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png">
	<link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="assets/plugins/chartist-js/dist/chartist.min.css" rel="stylesheet">
	<link href="assets/plugins/chartist-js/dist/chartist-init.css" rel="stylesheet">
	<link href="assets/plugins/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.css" rel="stylesheet">
	<link href="assets/plugins/c3-master/c3.min.css" rel="stylesheet">
	<link href="teacher/css/style.css" rel="stylesheet">
	<link href="teacher/css/colors/blue.css" id="theme" rel="stylesheet">

	<script src="assets/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap tether Core JavaScript -->
	<script src="assets/plugins/bootstrap/js/tether.min.js"></script>
	<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<!-- slimscrollbar scrollbar JavaScript -->
	<script src="teacher/js/jquery.slimscroll.js"></script>
	<!--Wave Effects -->
	<script src="teacher/js/waves.js"></script>
	<!--Menu sidebar -->
	<script src="teacher/js/sidebarmenu.js"></script>
	<!--stickey kit -->
	<script src="assets/plugins/sticky-kit-master/dist/sticky-kit.min.js"></script>
	<!--Custom JavaScript -->
	<script src="teacher/js/custom.min.js"></script>
	<!-- ============================================================== -->
	<!-- This page plugins -->
	<!-- ============================================================== -->
	<!-- chartist chart -->
	<script src="assets/plugins/chartist-js/dist/chartist.min.js"></script>
	<script src="assets/plugins/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.min.js"></script>
	<!--c3 JavaScript -->
	<script src="assets/plugins/d3/d3.min.js"></script>
	<script src="assets/plugins/c3-master/c3.min.js"></script>
	<script type="text/javascript" src="teacher/js/analyze.js"></script>
</head>
<body>
<input type="hidden" id="paperIdInput" value="${paper_id}"/>
<div class="page-wrapper" style="margin-left: 0px;">
	<div class="container-fluid">
		<div class="row page-titles">
			<div class="col-md-5 col-8 align-self-center">
				<h3 class="text-themecolor">Analyze</h3>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">
						<a href="javascript:void(0)">Home</a>
					</li>
					<li class="breadcrumb-item active">Analyze</li>
				</ol>
			</div>
		</div>
		<!-- ============================================================== -->
		<!-- End Bread crumb and right sidebar toggle -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Start Page Content -->
		<!-- ============================================================== -->
		<!-- Row -->
		<div class="row">
			<!-- Column -->
			<div class="col-lg-8 col-md-7">
				<div class="card">
					<div class="card-block">
						<div class="row">
							<div class="col-12">
								<div class="d-flex flex-wrap">
									<div>
										<h3 class="card-title">问卷概览</h3>
									</div>
									<div class="ml-auto">
										<ul class="list-inline">
											<li>
												<h6 class="text-muted text-info">
													<i class="fa fa-circle font-10 m-r-10"></i>A
												</h6>
											</li>
											<li>
												<h6 class="text-muted text-success">
													<i class="fa fa-circle font-10 m-r-10"></i>B
												</h6>
											</li>
											<li>
												<h6 class="text-muted  text-warning">
													<i class="fa fa-circle font-10 m-r-10" ></i>C
												</h6>
											</li>
											<li>
												<h6 style="color: #D17905">
													<i class="fa fa-circle font-10 m-r-10"></i>D
												</h6>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-12">
								<div class="amp-pxl" style="height: 360px;"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-5">
				<div class="card">
					<div class="card-block">
						<h3 class="card-title">问卷结果扇形图显示 </h3>
						<select name="que_num" id="selectQustion">

						</select>
						<div id="visitor" style="height:290px; width:100%;"></div>
					</div>
					<div>
						<hr class="m-t-0 m-b-0">
					</div>
					<div class="card-block text-center ">
						<ul class="list-inline m-b-0">
							<li>
								<h6 class="text-muted text-info"><i class="fa fa-circle font-10 m-r-10 "></i>A</h6> </li>
							<li>
								<h6 style="color: #26C6DA"><i class="fa fa-circle font-10 m-r-10"></i>B</h6> </li>
							<li>
								<h6 style="color: #F4C63D"><i class="fa fa-circle font-10 m-r-10"></i>C</h6> </li>
							<li>
								<h6 style="color: #D17905"><i class="fa fa-circle font-10 m-r-10"></i>D</h6> </li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- Row -->
		<!-- Row -->
		<div class="row">
			<!-- Column -->
			<div style="width:100%;padding-left: 50px" >
				<a onclick="viewChoose()" href="javaScript:;">查看选择题</a>&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="viewFilling()" href="javaScript:;">查看填空题</a><br/>
			</div>
			<div class="col-lg-5 col-xlg-5 col-md-5" style="margin-top: 10px" id="choose" style="display:block">
				<table border="1" width="100%">
					<tr>
						<th>题号</th>
						<th>选项A</th>
						<th>选项B</th>
						<th>选项C</th>
						<th>选项D</th>
					</tr>
					<c:forEach items="${scalesNoTk}" var="scalesNoTk">
						<tr>
							<td>${scalesNoTk.key}</td>
							<td>${scalesNoTk.value[0]}</td>
							<td>${scalesNoTk.value[1]}</td>
							<td>${scalesNoTk.value[2]}</td>
							<td>${scalesNoTk.value[3]}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="col-lg-5 col-xlg-5 col-md-5" style="margin-top: 10px;display:none" id="filling">
				<table border="1" width="100%">
					<tr>
						<th>题号</th>
						<th>答案内容</th>
					</tr>
					<c:forEach items="${scalesTk}" var="scaleTk">
						<tr>
							<td>${scaleTk.key}</td>
							<td>
								<c:forEach items="${scaleTk.value}" var="answer" varStatus="statu">
									${statu.index+1}：${answer.answer}<br/>
								</c:forEach>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<!-- ============================================================== -->
		<!-- End PAge Content -->
		<!-- ============================================================== -->
	</div>
</div>
</body>
</html>