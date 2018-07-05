<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%@ page import="user.Users"%>
<%@ page import="Dao.dao"%>
<%@ page import="book.book"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<title>Admin Template</title>
		<script src="js/jquery.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/menu.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/global.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/modal.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" href="css/style.css" type="text/css" media="screen" charset="gb2312" />
		<!--[if IE 6]>
			<link rel="stylesheet" href="css/ie6.css" type="text/css" media="screen" charset="gb2312" />
		<![endif]-->		
	</head>
	<body text="#000000">
		<div id="header">
			<div class="col w5 bottomlast">
				<a href="" class="logo">
					<img src="images/logo.gif" alt="Logo" />
				</a>
			</div>
			<div class="col w5 last right bottomlast">
			<%
				Users u = (Users)session.getAttribute("regUser"); 
				if(u.getUername()!=null)
				{
				session.setAttribute("Adm", u);
				session.setAttribute("path", request.getServletPath());
			 %>
				<p class="last"><span class="strong">欢迎，</span> <a href="login.jsp?email=<%=u.getEmail()%>"><%=u.getUername() %></a></p>
				<%
				}
				else
				{
			 %>
				<p class="last"><span class="strong">欢迎，</span> <a href="login.jsp">登录</a></p>
				<%
				}
				 %>
			</div>
			<div class="clear"></div>
		</div>
		<div style="padding-top: 20px" align="center">
			<p>
				
			<font color="#CC0066">商品详情</font></p>
			<% 
			dao d=new dao();
			
			book b=d.SearchISBN(request.getParameter("id"));
			
			if(b==null)
			{
				//System.out.println( "id是" +session.getAttribute("id"));
				String sid=(String)session.getAttribute("id");
				System.out.println(sid);
				b=d.SearchISBN((String)(session.getAttribute("id")));
			}
            if(b!=null)
             {
             session.setAttribute("Book", b);
          %>
			<table width="90%" border="0" cellspacing="2" cellpadding="1">
				<form name="form1" method="post" action="servlet/buybook">
					<tr>
						<td align="right" width="120">
							书号
						</td>
						<td><%=b.getISBN()%></td>
					</tr>
					<tr>
						<td align="right" width="120">
							书名
						</td>
						<td><%=b.getBookName()%></td>
					</tr>
					<tr>
						<td align="right" width="120">
							类别
						</td>
						<td><%=b.getBookKind()%></td>
					</tr>
					<tr>
						<td align="right" width="120">
							作者
						</td>
						<td><%=b.getAuthor()%></td>
					</tr>
					<tr>
						<td align="right" width="120">
							出版社
						</td>
						<td><%=b.getBookPub()%></td>
					</tr>
					<tr>
						<td align="right" width="120">
							价格
						</td>
						<td><%=b.getBookPrice()%></td>
					</tr>
					<tr>
						<td align="right" width="120">
							库存
						</td>
						<td><%=b.getBookNum()%></td>
					</tr>
					<tr>
						<td align="right" width="120">
							实物图
						</td>
						<td>
							<img src="<%%>" width="80" height="112">
						</td>
					</tr>
					<%
					}
					 %>
					
					<tr>
						<td align="right" width="120" valign="top">&nbsp;
							
						</td>
						<td>
						<a onClick="check()" class="fl delete" id="deleteAll" href="servlet/buybook">
							<input type="submit" name="Submit" value="加入购物车";"></a> 
							<a href="shopcar.jsp">查看购物车</a>
						</td>
					</tr>
				</form>
			</table>
			<%
				session.setAttribute("tttt", 0);
			 %>

			<br>
			<p align="center">
				<a href="articles.jsp">返回首页</a>
			</p>
		</div>
		</div>
                </div>	
                </div>				
		<div id="footer">
			<p class="last">Copyright 2018 - Gray Admin Template - Created by <a href="">fjq</a></p>
		</div>		
		<script type="text/javascript">
			function check() {
			alert("添加成功");
			}
		</script>
	</body>
</html>
