<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%@ page import="user.Users"%>
<%@ page import="Dao.dao"%>
<%@ page import="book.book"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
</head>
<body>
<%
    String name = "";
    if(request.getParameter("name")!=null) name =request.getParameter("name"); 
%>
<br>
<%=name %>
<script type="text/javascript">
    function Jsp_Get_Js()
    {
        var v = "ISvalue";
        document.getElementById("name").value = v;
        //在此将JS中的v变量的值交给JSP
        document.Isform.submit();
    }
</script>
<form name="Isform"action="servlet/ceshi" onsubmit="return validateForm()" >
<input type="hidden" name="nam" id="name">  
<input type="submit" onclick="Jsp_Get_Js()">
</form>
</body>
</html>
