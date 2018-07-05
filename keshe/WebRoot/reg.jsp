<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<title>Admin Template Login</title>
		<script src="js/jquery.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/menu.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/global.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/modal.js" type="text/javascript" charset="utf-8"></script>		
		<link rel="stylesheet" href="css/style.css" type="text/css" media="screen" charset="utf-8" />
  </head>
  
  <body>
    <body>
		<div id="wrapper_login">
			<div id="menu">
				<div id="left"></div>
				<div id="right"></div>
				<h2>Admin Template Login</h2>
				<div class="clear"></div>		
			</div>
			<div id="desc">
				<div class="body">
					<div class="col w10 last bottomlast">
						<form action="servlet/regservlet" method="post">
							<p>
								<label for="email">Email:</label>
								<input type="text" name="email" id="email" value="" size="40" class="text" />
								<br />
							</p>
							<p>
								<label for="password">密码:</label>
								<input type="password" name="password" id="password" value="" size="40" class="text" />
								<br />
							</p>
							<p>
								<label for="passwords">重复密码:</label>
								<input type="password" name="passwords" id="passwords" value="" size="40" class="text" />
								<br />
							</p>
							<p>
								<label for="name">用户名:</label>
								<input type="text" name="name" id="name" value="" size="20" class="text" />
								<br />
							</p>
							<p>
								<label for="phone">电话:</label>
								<input type="text" name="phone" id="phone" value="" size="28" class="text" />
								<br />
							</p>
							<p>
								<label for="address">发货地址:</label>
								<input type="text" name="address" id="address" value="" size="50" class="text" />
								<br />
							</p>
							<p align="center" class="last">
								<button type="submit" class="btn btn-default btn-block">
								 <a class="button form_submit"><small class="icon play"></small><span>注册</span></a></button>
								
								<br />
							</p>
							<div class="clear"></div>
						</form>
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
				<div id="body_footer">
					<div id="bottom_left"><div id="bottom_right"></div></div>
				</div>
			</div>		
		</div>
  </body>
</html>
