<%@page import="sun.awt.SunHints.Value"%>
<%@page import="bookcar.bookcar"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%@ page import="user.Users"%>
<%@ page import="Dao.dao"%>
<%@ page import="bookcar.bookcar"%>
<%@ page import="book.book"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";


%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>购物车</title>
<link rel="stylesheet" href="css/style1.css"/>
<script type="text/javascript" src="js/demo.js"></script>
</head>
<body>

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
		
<form name="regForm" action="servlet/bookservlet" method="post" >	
	
<div class="catbox">
<div class="col w5 bottomlast">
				购物车
			</div>
  <table id="cartTable">
    <thead>
      <tr>
        <th><label>
            <input class="check-all check" type="checkbox"/>&nbsp;&nbsp;全选</label></th>
        <th>书名</th>
        <th>单价</th>
        <th>数量</th>
        <th>小计</th>
        <th>操作</th>
      </tr>
    </thead>
    <tbody>
    
    <%
    dao d = new dao();
    ArrayList<bookcar> bookcars=new ArrayList<bookcar>();
    bookcars =d.getbookcar(u.getEmail(),"no");
    int booknum=0;
    if(bookcars!=null)
    {
    
    for (int i=0;i<bookcars.size();i++)
    {
    float price=(bookcars.get(i).getBookPrice());
    int num=bookcars.get(i).getNum();
   	//System.out.println("书号："+bookcars.get(i).getISBN());
   	//if(bookcars.get(i).getFinish().equals("no"))
   	{
     %>
       <tr>
        <td class="checkbox"><input class="check-one check" type="checkbox"/></td>
        <td class="goods"><img src="images/3.jpg" alt=""/><span><%=bookcars.get(i).getBookname()%><br/><%=bookcars.get(i).getAuthor()%></span></td>
        <td class="price"><%=bookcars.get(i).getBookPrice() %></td>
        <td class="count"><span class="reduce"></span>
          <input class="count-input" type="text" name=<%=bookcars.get(i).getISBN()%> value=<%=bookcars.get(i).getNum()%>>
          <span class="add">+</span></td>
        <td class="subtotal"><%=num*price %></td>
        
        
        <td class="operation"><a href="servlet/changecar?id=<%=bookcars.get(i).getISBN()%>">删除</a></td>
      </tr>
     <%
      booknum++;
      }
     }
     
     session.setAttribute("bookcars",bookcars);
     }
     session.setAttribute("booknum",booknum+"");
     System.out.println("一共"+booknum);
      %>
      
    </tbody>
  </table>
      
        
       
  <div class="foot" id="foot">
    <label class="fl select-all"><input type="checkbox" class="check-all check"/>&nbsp;&nbsp;全选</label>
   	
     <div class="fr closing" onclick="getTotal();"><input type="submit" value="提交"/>&nbsp;&nbsp;</div>
    <input type="hidden" id="cartTotalPrice" />
    <div class="fr total">合计：￥<span id="priceTotal">0.00</span></div>
    <div class="fr selected" id="selected">已选商品<span id="selectedTotal">0</span>件<span class="arrow up">︽</span><span class="arrow down">︾</span></div>
    <div class="selected-view">
      <div id="selectedViewList" class="clearfix">
        <div><img src="images/1.jpg"><span>取消选择</span></div>
      </div>
      <span class="arrow">◆<span>◆</span></span> </div>
  </div>
</div>
</form>



<div class="catbox">
<div class="col w5 bottomlast">
				
				<td align="right" width="120">
												订单
											</a>
											<br/>
											<br/>
			</div>
  <table id="cartTable">
    <thead>
      <tr>
        
            
        <th>书名</th>
        <th>单价</th>
        <th>数量</th>
        <th>小计</th>
     
      </tr>
    </thead>
    <tbody>
    
    <%

    bookcars =d.getbookcar(u.getEmail());
    if(bookcars!=null)
    {
    
    for (int i=0;i<bookcars.size();i++)
    {
    float price=(bookcars.get(i).getBookPrice());
    int num=bookcars.get(i).getNum();
   
   	if(!bookcars.get(i).getFinish().equals("no"))
   	{
     %>
       <tr>
        <td class="goods"><img src="images/3.jpg" alt=""/><span><%=bookcars.get(i).getBookname()%><br/><%=bookcars.get(i).getAuthor()%></span></td>
        <td class="price"><%=bookcars.get(i).getBookPrice() %></td>
        <td class="count">
          <input class="count-input" type="text" name=<%=bookcars.get(i).getISBN()%> value=<%=bookcars.get(i).getNum()%>>
          </td>
        <td class="subtotal"><%=num*price %></td>
        
        
        
      </tr>
     <%
      }
     }
     
     }
      %>
      
    </tbody>
  </table>



<p align="center">
				<a href="articles.jsp">返回首页</a>
			</p>
</body>
</html>