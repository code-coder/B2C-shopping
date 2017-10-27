<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<s:set var="context_path" value="#request.get('javax.servlet.forward.context_path')"></s:set>


<!DOCTYPE html>
<html>
<head>
	<title>后台管理</title>
	<meta http-equiv="content-type" content="text/html;charset=UTF-8">
	<link href="${context_path}/css/index.css" rel="stylesheet" type="text/css" />
	<link href="${context_path}/css/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<!-- <link rel="stylesheet" type="text/css" href="../css/index.css" /> -->
</head>
<body>
<div id="wrapper">
	<div id="header">
		<div id="logo"><a href="${RES }"><img src="${RES}/image/demo/logos/theme_logo.png" title="Your Store" alt="Your Store" /></a></div>
		<div id="title">后台管理系统</div>
		<div id="user_info">
			<div id="welcome">欢迎  <span style="color:blue;">${sessionScope.admin}</span> 使用本系统</div>
			<div id="logout"><a href="<%=path%>/manager/manager_logout.action">安全退出</a></div>
		</div>
	</div>
	<div id="navigator">
		<iframe src="tree.jsp"></iframe>
        </div>
	<div id="main">
		<iframe name="MainFrame" src="manager_mainframe.jsp"></iframe>
	</div>
</div>
</body>
<script type="text/javascript">
function screenAdapter(){
		document.getElementById('navigator').style.height=document.documentElement.clientHeight-100+"px";
		document.getElementById('main').style.height=document.documentElement.clientHeight-100+"px";
		document.getElementById('main').style.width=window.screen.width-240+"px";
}

window.onscroll=function(){screenAdapter();};
window.onresize=function(){screenAdapter();};
window.onload=function(){screenAdapter();};
</script>
</html>