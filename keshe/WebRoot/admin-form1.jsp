<%@page import="com.sun.org.apache.commons.digester.rss.Item"%>

<%@page import="user.Users"%>
<%@page import="com.sun.xml.internal.bind.v2.runtime.property.Property"%>
<%@page import="Dao.dao"%>
<%@page import="book.book"%>
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
  <title>表单页面</title>
  <meta name="description" content="这是一个form页面">
  <meta name="keywords" content="form">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="assets/css/admin.css">
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
      <li><a href="http://localhost:8080/keshe/admin-form.jsp"><span class="am-icon-pencil-square-o"></span> 添加商品</a></li>
      <li><a href="http://localhost:8080/keshe/admin-index.jsp"><span class="am-icon-sign-out"></span> 返回首页</a></li>
    </ul>

  </div>
  <!-- sidebar end -->

<!-- content start -->
<div class="admin-content">

  <div class="am-cf am-padding">
    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">表单</strong> / <small>form</small></div>
  </div>

  <div class="am-tabs am-margin" data-am-tabs>
    <ul class="am-tabs-nav am-nav am-nav-tabs">
      
      <li><a href="#tab1">选项</a></li>
    </ul>

    <div class="am-tabs-bd">
    <% 
      	dao dd = new dao();
           	
        	String s= request.getParameter("changebookID");
        	book b=new book();
        	if(s!=null)
        	{
       	 	b = dd.SearchISBN(s);
       	 	System.out.println("找到"+b.getBookName());
       	 	
       	 	
%>
      <div class="am-tab-panel am-fade" id="tab3">
        <form class="am-form" method="post" action="servlet/warehouse?method=change">
          
          

          <div class="am-g am-margin-top-sm">
            <div class="am-u-sm-2 am-text-right">
              ISBN
            </div>
            <div class="am-u-sm-4 am-u-end">
              <input name="ISBN" type="text" class="am-input-sm" id="doc-ipt-email-1" value=<%=b.getISBN() %> readonly="true">
            </div>
          </div>
		  
		  <div class="am-g am-margin-top-sm">
            <div class="am-u-sm-2 am-text-right">
             		 书名
            </div>
            <div class="am-u-sm-4 am-u-end">
              <input name="name" type="text" class="am-input-sm" id="doc-ipt-email-1" value=<%=b.getBookName() %>>
            </div>
          </div>
		  
		  <div class="am-g am-margin-top-sm">
            <div class="am-u-sm-2 am-text-right">
         		     类别
            </div>
            <div class="am-u-sm-4 am-u-end">
              <input name="Kind" type="text" class="am-input-sm" id="doc-ipt-email-1" value=<%=b.getBookKind()%>>
            </div>
          </div>
		  
		  <div class="am-g am-margin-top-sm">
            <div class="am-u-sm-2 am-text-right">
          			    单价
            </div>
            <div class="am-u-sm-4 am-u-end">
              <input name="price" type="text" class="am-input-sm" id="doc-ipt-email-1" value=<%=b.getBookPrice()%>>
            </div>
          </div>
		  
		  
		  <div class="am-g am-margin-top-sm">
            <div class="am-u-sm-2 am-text-right">
            		  出版社
            </div>
            <div class="am-u-sm-4 am-u-end">
              <input name="Pub" type="text" class="am-input-sm" id="doc-ipt-email-1" value=<%=b.getBookPub()%>>
            </div>
          </div>
		  
		
		  
		  <div class="am-g am-margin-top-sm">
            <div class="am-u-sm-2 am-text-right">
              作者
            </div>
            <div class="am-u-sm-4 am-u-end">
              <input name="author" type="text" class="am-input-sm" id="doc-ipt-email-1" value=<%=b.getAuthor()%>>
            </div>
          </div>
		<div class="am-margin">
    <button type="submit" onClick="clicke()" value="Button1" class="am-btn am-btn-primary am-btn-xs">提交保存</button>
    <button type="button" onClick="clicke1(tab3)" value="Button2" class="am-btn am-btn-primary am-btn-xs">放弃保存</button>
  </div>
        </form>
        
      </div>

    </div>
  </div>
  
<%
}
 %>
  
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
