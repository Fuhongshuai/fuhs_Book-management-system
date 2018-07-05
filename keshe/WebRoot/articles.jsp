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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
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
		<link rel="stylesheet" href="css/style.css" type="text/css" media="screen" charset="utf-8" />
		<script>function changeSrc(){
			document.getElementById("myImage").src="hackanm.gif";
			}
		</script>
		<!--[if IE 6]>
			<link rel="stylesheet" href="css/ie6.css" type="text/css" media="screen" charset="utf-8" />
		<![endif]-->		
	</head>
	<body>
		<div id="header">
			<div class="col w5 bottomlast">
				<a href="" class="logo">
					<img src="images/logo.gif" alt="Logo" />
				</a>
			</div>
			<jsp:useBean  id="regUser" class="user.Users" scope="session"/>  
			<div class="col w5 last right bottomlast">
			<%
				Users u = (Users) session.getAttribute("regUser");
				if(u.getUername()!=null)
				{
				session.setAttribute("Adm", u);
			 %>
				<p class="last"><span class="strong">欢迎，</span> <a href="login.jsp?email=<%=u.getEmail()%>"><jsp:getProperty name="regUser" property="uername"/></a></p>
				<br />
				<p class="last"><span class="strong"><a href="regchange.jsp?email=<%=u.getEmail()%>">修改个人信息</a></span> </p>
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
		<div id="wrapper">
			<div id="minwidth">
				<div id="holder">
					<div id="menu">
						<div id="left"></div>
						<div id="right"></div>
						<ul>
							<li></li>							
						</ul>
						<div class="clear"></div>
					</div>
					<div id="submenu">
						<div class="modules_left">
							<div class="module buttons">
								<a href="" class="dropdown_button"><small class="icon plus"></small><span>New Category</span></a>
								<div class="dropdown">
									<div class="arrow"></div>
									<div class="content">
										<form>
											<p>
												<label for="name">Category Name:</label>
												<input type="text" class="text w_22" name="name" id="name" value="" />
											</p>
											<p>
												<label for="description">Category Description:</label>
												<textarea name="description" id="description" class="w_22" rows="10"></textarea>
											</p>
										</form>
										<a href="" class="button green right"><small class="icon check"></small><span>Save</span></a>
										<a class="button red mr right close"><small class="icon cross"></small><span>Close</span></a>
										<div class="clear"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="title">
							Bookshelf
						</div>
						<div class="modules_right">
							<div class="module search">
								<form action="">
									<p><input type="text" value="Search..." name="user_search" /></p>
								</form>
							</div>
						</div>
					</div>
					<div id="desc">
						<div class="body">
							<div class="col w2">
								<div class="content">
									<div class="box header">
										<div class="head"><div></div></div>
										<h2>图书分类</h2>
										<div class="desc">
										<a href="articles.jsp?type=<%="首页" %>" class="button green left"><span><p><tr>
												<td align="right" width="120">
												首页
												</td></p></span>
											</a>
											<br/>
											<br/>
										<%
											dao dd=new dao();
											ArrayList<String> type=dd.getBookType();
											for(int k=0;k<type.size();k++)
											{
										 %>
                                        	<a href="articles.jsp?type=<%=type.get(k)%>" class="button green left"><span><p><tr>
												<td align="right" width="120">
												<%=type.get(k) %>
												</td></p></span>
											</a>
											<br/>
											<br/>
											<%
											}
											 %>
										</div>
										
										
									</div>
								</div>
							</div>
							<div class="col w8 last">
								<div class="content">
									
                                    
                                    <%
                                    	int num=5;
                                    	int row=0;
                                    	
                                    	dao d=new dao();
                                    	ArrayList<book> list=new ArrayList<book>();
                                    	if(request.getParameter("user_search")!=null)
                                    	{
                                    		String search=request.getParameter("user_search");
                                    		search= new String(search.getBytes("iso8859_1"),"utf-8");
                                    		list=d.SearchBookName(search);
                                    		
                                    	}
                                    	else
                                    	{
                                    	if(request.getParameter("type")!=null)
                                    	{
                                    	String strpage=request.getParameter("page"); 
                                    	if(strpage!=null)
                                    	{
                                    	strpage= new String(strpage.getBytes("iso8859_1"),"utf-8");//转码为utf-8，否则乱码
                                    	pp=Integer.valueOf(strpage);
                                    	}
                                    	else 
                                    	{
                                    	pp=0;
                                    	}                                    	
                                    	t=(String)request.getParameter("type");
                                    	t= new String(t.getBytes("iso8859_1"),"utf-8");//转码为utf-8，否则乱码
                                    	System.out.println(t);
                                    	list=d.getAllType(t);
                                    	}
                                    	else{
                                    	list=d.getAllbook();
                                    	};
                                    	}
                                    	d.close();                                    	                                    	                                    	                                    	                                    	                              
                                    	if(list!=null)
                                    	System.out.println(pp);
                                    	for(int i=0;i<num;i++)
                                    	{
         					                                   
                                     %>
                                    <div class="shelf">
										<div class="left"></div>
										<div class="right"></div>
										<div class="inside">
										<%
										
											for(int j=0;j<5;j++)
											{
												if(((i*5+j)+pp*25)<list.size())
												{
												
											 %>
											<div class="books articles">
											
												<div class="col w2">
													<a href="bookdetail.jsp?id=<%=list.get(((i*5+j)+pp*25)).getISBN()%>">
														<%=list.get(((i*5+j)+pp*25)).getBookName() %><br/>
														<%=list.get(((i*5+j)+pp*25)).getBookPrice() %>元
												    </a>
												</div>
									
												
										
											</div>
											<%
												}
												else
												{
												%>
												<div class="books articles">
											
												<div class="col w2">
													<a href="">
														<br/>
												    </a>
												</div>
									
												
										
											</div>
												<% 
											} 
											}
											%>
										</div>
										<div class="clear"></div>
									</div>
                                    
                                    <% 
                                    
                                    }
                                     %>                                                                        	
                                                       
                            <div class="clear"></div>
						</div>
						<%if(pp>=1)
						{%> 
						<a href="articles.jsp?page=<%=(pp-1)%>&type=<%=t%>" class="button green left" ><span><p><tr>
												<td align="right" width="120">
												上一页
												</td></p></span>
						</a>
						<%
						}
						 
						if(pp<(list.size()/25+1)-1){
						
						%> 
						<a href="articles.jsp?page=<%=(pp+1)%>&type=<%=t%>" class="button green left" ><span><p><tr>
												<td align="right" width="120">
												下一页
												</td></p></span>
						</a>
						<%} %>
						<div class="clear"></div>
						<div id="body_footer">
							<div id="bottom_left"><div id="bottom_right"></div></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="footer">
			<p class="last">Copyright 2009 - Gray Admin Template - Created by <a href="">Passatgt</a></p>
		</div>		
	</body>
</html>