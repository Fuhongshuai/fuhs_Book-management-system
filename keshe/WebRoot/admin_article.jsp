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
		height: 50px;
		width: 80px;
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
     <li><a href="http://localhost:8080/keshe/admin-index.jsp"> 首页</a></li>
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
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">表格</strong> / <small>Table</small></div>
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
                <th class="table-check"><input type="checkbox" /></th><th class="table-id">ISBN</th><th class="table-title">书名</th><th class="table-type">种类</th>
                <th class="table-price">单价</th><th class="table-author">作者</th><th class="table-date">出版社</th><th class="table-set">操作</th>
              </tr>
          </thead>
          <tbody>
           <%
           	dao dd = new dao();
           	ArrayList<book> list = new ArrayList<book>();
        	list = dd.getAllbook();
       	 	book item = new book();
       	 	String strpage=request.getParameter("page"); 
                                    	if(strpage!=null)
                                    	{
                                    	strpage= new String(strpage.getBytes("iso8859_1"),"utf-8");//转码为utf-8，否则乱码
                                    	pp=Integer.valueOf(strpage);
                                    	System.out.print(pp);
                                    	}
                                    	else 
                                    	{
                                    	System.out.print("当前为首页");
                                    	pp=0;
                                    	}
            int tail=25; 
            if(list.size()>pp*25)
            {
            	tail=pp*25+25;
            }       
            else{
            tail=list.size();
            }                 	                          
        	for(int i = pp*25;i < tail; i ++){
        	item = list.get(i);
        	
            %>
             
            <tr>
              <td><input type="checkbox" /></td>
              <td><a href="http://localhost:8080/keshe/admin-info.jsp"><%=item.getISBN() %></a></td>
              <td><div class = "div1"><%=item.getBookName()%></div></td>
              <td><div class = "div1"><%=item.getBookKind()%></div></td>
              <td><div class = "div1"><%=item.getBookPrice()%></div></td>
              <td><div class = "div1"><%=item.getAuthor()%></div></td>
              <td><div class = "div1"><%=item.getBookPub()%></div></td>
              <td>
                <div class="am-btn-toolbar">
                  <div class="am-btn-group am-btn-group-xs">
                    <a href="servlet/warehouse?method=deletebook&deletebookID=<%=item.getISBN() %>">
                    <input type = "button" class="am-btn am-btn-default am-btn-xs am-text-danger" value = "删除"></a>
                  </div>
                </div>
              </td>
              <td>
                <div class="am-btn-toolbar">
                  <div class="am-btn-group am-btn-group-xs">
                    <a href="http://localhost:8080/keshe/admin-form1.jsp?changebookID=<%=item.getISBN() %>">
              
                    <input type = "button" class="am-btn am-btn-default am-btn-xs am-text-danger" value = "修改"></a>
                  </div>
                </div>
              </td>
            </tr>
			<%} %>
          </tbody>
        </table>
          <div class="am-cf">
  共 1 条记录
  <div class="am-fr">
    <ul class="am-pagination">
    <%if(pp>=1)
						{%> 
      <li ><a href="admin_article.jsp?page=<%=pp-1%>">«</a></li>
      <%
						}
						 
	if(pp<(list.size()/25+1)-1){
						
	%> 
      <li><a href="admin_article.jsp?page=<%=pp+1%>">»</a></li>
      <%} %>
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
  <p class="am-padding-left">keshe</p>
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
