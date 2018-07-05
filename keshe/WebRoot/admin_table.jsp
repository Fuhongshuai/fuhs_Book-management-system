<%@page import="user.Users"%>
<%@page import="com.sun.xml.internal.bind.v2.runtime.property.Property"%>
<%@page import="Dao.dao"%>
<%@page import="book.book"%>
<%@page import="order.order"%>
<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
int pp=0;
String t="";
%>
<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>后台管理系统</title>
  <meta name="description" content="这是一个 table 页面">
  <meta name="keywords" content="table">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="assets/css/admin.css">
  <style>
	 .div1 {
		height: 20px;
		width: 70px;
		overflow: hidden;
	         }
	  .div2 {
		height: 20px;
		width: 150px;
		overflow: hidden;
	         }
	</style> 
</head>
<body>
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif]-->

<header class="am-topbar admin-header">
  <div class="am-topbar-brand">
    <strong></strong> <small>后台管理</small>
  </div>

  <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

  <div class="am-collapse am-topbar-collapse" id="topbar-collapse">
 <jsp:useBean  id="regUser" class="user.Users" scope="session"/>  
    <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
      <li><a href="javascript:;"><span class="am-icon-envelope-o"></span> 收件箱 <span class="am-badge am-badge-warning">5</span></a></li>
      <li class="am-dropdown" data-am-dropdown>
        <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
          <span class="am-icon-users"></span> 管理员 <span class="am-icon-caret-down"></span>
        </a>
        <ul class="am-dropdown-content">
          <li><a href="#"><span class="am-icon-user"></span> 资料</a></li>
          <li><a href="#"><span class="am-icon-cog"></span> 设置</a></li>
          <%
				Users u = (Users) session.getAttribute("regUser");
				if(u.getUername()!=null)
				{
				session.setAttribute("Adm", u);
			 %>
				<li><a href="login.jsp?email=<%=u.getUername()%>" ><span class = "am-icon-power-off"></span> <jsp:getProperty name="regUser" property="uername"/></a></li>
				<%
				}
				else
				{
			 %>
				<li><span class = "am-icon-power-off"></span><a href="login.jsp"> 登录</a></li>
				<%
				}
				 %>
        </ul>
      </li>
      <li><a href="javascript:;" id="admin-fullscreen"><span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
    </ul>
  </div>
</header>

<div class="am-cf admin-main">
  <!-- sidebar start -->
  <div class="admin-sidebar">
    <ul class="am-list admin-sidebar-list">
     <li><a href="http://localhost:8080/keshe/admin-index.jsp">首页</a></li>
     <li><a href="http://localhost:8080/keshe/admin_article.jsp"><span class="am-icon-home"></span> 库存管理</a></li>
      <li><a href="http://localhost:8080/keshe/admin-table.jsp"><span class="am-icon-table"></span> 订单信息</a></li>
      <li><a href="http://localhost:8080/keshe/admin_table.jsp"><span class="am-icon-table"></span> 历史订单</a></li>
      <li><a href="http://localhost:8080/keshe/admin-form.jsp"><span class="am-icon-pencil-square-o"></span> 添加商品</a></li>
      <li><a href="http://localhost:8080/keshe/admin-index.jsp"><span class="am-icon-sign-out"></span> 返回首页</a></li>
    </ul>

  </div>
  <!-- sidebar end -->

  <!-- content start -->
  <div class="admin-content">

    <div class="am-cf am-padding">
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">历史订单</strong> / <small>bookorder</small></div>
    </div>

    <div class="am-g">
      <div class="am-u-md-6 am-cf">
        <div class="am-fl am-cf">
          <div class="am-btn-toolbar am-fl">
            

            
          </div>
        </div>
      </div>
      
    </div>

    <div class="am-g">
      <div class="am-u-sm-12">
        <form class="am-form">
          <table class="am-table am-table-striped am-table-hover table-main">
            <thead>
           
              <tr>
                <th class="table-check"><input type="checkbox" /></th>
                <th class="table-id"><div class="div1">订单编号</div></th>
                <th class="table-title"><div clas ="div2">收货人邮箱</div></th>
                <th class="table-num"><div class="div1">订单数量</div></th>
                <th class="table-price"><div class="div1">总价格</div></th>
                <th class="table-date"><div class="div2">订单日期</div></th>
                <th class="table-address"><div class="div1">收货地址</div></th>
                <th class="table-set"><div class="div1">操作</div></th>
              </tr>
              
          </thead>
          <tbody>
          <div>
            
             <%
            dao dd = new dao();
            String num = dd.GetorderNum();
        	ArrayList<order> list = new ArrayList<order>();
        	list = dd.getAllorder();
        	for(int i = 0;i < list.size();i++){
        		if(list.get(i).getfinish().equals("ok")){
        		String s = list.get(i).getISBN();
    			float price = Float.valueOf(dd.Getorderprice(s));
             %>
            <tr>
              <td><input type="checkbox" /></td>
              <td><a href="http://localhost:8080/keshe/admin-info.jsp"></a><div class="div1"><%=list.get(i).getorderNO() %></div></td>
              <td><div class="div2"><%=list.get(i).getemail() %></div></td>
              <td><div class="div1"><%=list.get(i).getnum() %></div></td>
              <td><div class="div1"><%=((int)list.get(i).getnum()*(int)price) %></div></td>
              <td><div class="div2"><%=list.get(i).getordertime() %></div></td>
              <td><div class="div1"><%=list.get(i).getaddress() %></div></td>
              <td>
                <div class="am-btn-toolbar">
                  <div class="am-btn-group am-btn-group-xs">
                    <a>
                    <input type = "button" class="am-btn am-btn-default am-btn-xs am-text-danger" value = "删除"></a>
                  </div>
                </div>
              </td>
            </tr>
            
			<%}
			} %>
			</div>
          </tbody>
        </table>
          <div class="am-cf">
  		共<%=num %> 条记录
  <div class="am-fr">
    <ul class="am-pagination">
      <li class="am-disabled"><a href="#">«</a></li>
      <li class="am-active"><a href="#">1</a></li>
      <li><a href="#">2</a></li>
      <li><a href="#">3</a></li>
      <li><a href="#">4</a></li>
      <li><a href="#">5</a></li>
      <li><a href="#">»</a></li>
    </ul>
  </div>
</div>
          <hr />
          <p>注：.....</p>
        </form>
      </div>

    </div>
  </div>
  <!-- content end -->
</div>

<footer>
  <hr>
  <p class="am-padding-left"></p>
</footer>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/polyfill/rem.min.js"></script>
<script src="assets/js/polyfill/respond.min.js"></script>
<script src="assets/js/amazeui.legacy.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/amazeui.min.js"></script>
<!--<![endif]-->
<script src="assets/js/app.js"></script>
</body>
</html>
