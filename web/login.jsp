<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>教师登陆</title>
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<script src="js/jquery-1.8.0.min.js" type="text/javascript"></script>
		<script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			.text-shadow{
			    text-shadow:#FF0000 0 0 10px;
			    color:white;
			    font-size:200px
			}
		</style>
	</head>

	<body>
		<img src="images/login-bg.png" height="100%" width="100%" style="position:absolute;z-index: -1;"/>
		<div id="" class=".container" style="height:100%;width:100%;">
			<div style="width:800px;height:400px;margin:auto;text-align: center;">
				<label style="text-shadow:#FF0000 0 0 10px;color:white;font-size:60px;">课堂问卷系统后台登录</label>
					<form class="form-horizontal" method="post" action="login.do">
						<div class="form-group" style="padding-top: 50px;margin:auto;">
							<div class="col-sm-10" style="text-align: center;">
								<label for="" class="col-sm-6 control-label" style="color:#D9534F;font-size: 20px;" >账号:</label>
								<input type="text" class="form-control" id="inputID" placeholder="请输入您的账号" style="width: 200px;height: 40px;" name="username">
							</div>
						</div>
						<div class="form-group" style="margin:auto;margin-top: 20px">
							<div class="col-sm-10">
								<label for="inputPassword3" class="col-sm-6 control-label" style="color:#D9534F;font-size: 20px;" >密码:</label>
								<input type="password" class="form-control" id="inputPassword3" placeholder="请输入您的密码" style="width: 200px;height: 40px;" name="password">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-9">
								<label style="color:red">${login_msg }</label><br/>
								<button type="submit" class="btn btn-default" style="width: 200px;margin:auto;margin-top: 20px;background-color: #FF552E;color: white;margin-left:-50px;">登陆</button>
								<br/><br/><a href="loginAdmin.jsp" style="font-size: 20px;color: red">>>>>>>管理员登陆</a>
							</div>

						</div>
					</form>
			</div>
		</div>
	</body>

</html>