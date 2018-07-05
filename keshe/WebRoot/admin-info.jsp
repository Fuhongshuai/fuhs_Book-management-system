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
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">订单资料</strong> / <small>information</small></div>
    </div>

    <hr/>

    <div class="am-g">

      <div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">
        

        

      </div>

      <div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
        <ul class="am-list admin-content-task">
          <li>
            <div class="admin-task-meta"> 订单编号</div>
            <div class="admin-task-bd">
              000001
            </div>
            <div class="am-cf">
              <div class="am-btn-toolbar am-fl">
                <div class="am-btn-group am-btn-group-xs">
                </div>
              </div>
              <div class="am-fr">
              </div>
            </div>
          </li>

          <li>
            <div class="admin-task-meta"> 数量</div>
            <div class="admin-task-bd">
              2
            </div>
            <div class="am-cf">
              <div class="am-btn-toolbar am-fl">
                <div class="am-btn-group am-btn-group-xs">
                </div>
              </div>
              <div class="am-fr">
              </div>
            </div>
          </li>

          <li>
            <div class="admin-task-meta"> 总价格</div>
            <div class="admin-task-bd">
              200
            </div>
            <div class="am-cf">
              <div class="am-btn-toolbar am-fl">
                <div class="am-btn-group am-btn-group-xs">
                </div>
              </div>
              <div class="am-fr">
              </div>
            </div>
          </li>

          <li>
            <div class="admin-task-meta"> ISBN</div>
            <div class="admin-task-bd">
              0000-12367-12812-zhsae
            </div>
            <div class="am-cf">
              <div class="am-btn-toolbar am-fl">
                <div class="am-btn-group am-btn-group-xs">
                </div>
              </div>
              <div class="am-fr">
              </div>
            </div>
          </li>
          <li>
            <div class="admin-task-meta"> 书名</div>
            <div class="admin-task-bd">
              数据库系统
            </div>
            <div class="am-cf">
              <div class="am-btn-toolbar am-fl">
                <div class="am-btn-group am-btn-group-xs">
                </div>
              </div>
              <div class="am-fr">
              </div>
            </div>
          </li>
          <li>
            <div class="admin-task-meta"> 类别</div>
            <div class="admin-task-bd">
              科技
            </div>
            <div class="am-cf">
              <div class="am-btn-toolbar am-fl">
                <div class="am-btn-group am-btn-group-xs">
                </div>
              </div>
              <div class="am-fr">
              </div>
            </div>
          </li>
          <li>
            <div class="admin-task-meta"> 单价</div>
            <div class="admin-task-bd">
              100
            </div>
            <div class="am-cf">
              <div class="am-btn-toolbar am-fl">
                <div class="am-btn-group am-btn-group-xs">
                </div>
              </div>
              <div class="am-fr">
              </div>
            </div>
          </li>
          <li>
            <div class="admin-task-meta"> 出版社</div>
            <div class="admin-task-bd">
              邮电出版社
            </div>
            <div class="am-cf">
              <div class="am-btn-toolbar am-fl">
                <div class="am-btn-group am-btn-group-xs">
                </div>
              </div>
              <div class="am-fr">
              </div>
            </div>
          </li>
          <li>
            <div class="admin-task-meta"> 出版日期</div>
            <div class="admin-task-bd">
              2014.1.1
            </div>
            <div class="am-cf">
              <div class="am-btn-toolbar am-fl">
                <div class="am-btn-group am-btn-group-xs">

                </div>
              </div>
              <div class="am-fr">
              </div>
            </div>
          </li>
          <li>
            <div class="admin-task-meta"> 作者</div>
            <div class="admin-task-bd">
              李华
            </div>
            <div class="am-cf">
              <div class="am-btn-toolbar am-fl">
                <div class="am-btn-group am-btn-group-xs">
                </div>
              </div>
              <div class="am-fr">
              </div>
            </div>
          </li>
          
        </ul>
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
