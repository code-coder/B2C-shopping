<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<META HTTP-EQUIV="Refresh" CONTENT="0;URL=<%=path%>/manager/main/manager_main_home.action">
</head>
<body>
<center>
	<img src="<%=request.getContextPath()%>/images/load.gif"><br>
	<p>页面加载中......</p>
</center>
</body>
</html>