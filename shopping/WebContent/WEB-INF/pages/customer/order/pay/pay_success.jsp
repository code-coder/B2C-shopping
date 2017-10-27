<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<style type="text/css">

#tips{
	margin-top:10px;
	width:100%;
	height:40px;
}

#mainContainer{
	padding-left:10px;
	padding-right:10px;
	text-align:center;
	width:98%;
	font-size:12px;
}
</style>
<head>
	<title>支付成功</title>
</head>
<body>
<div id="tips">
	<!-- 导航空白 -->
</div>
<div id="mainContainer">
   <strong>支付成功，查看<a href="<%=path%>/customer/order/customer_order_myOrder.action">我的订单</a></strong>
   <!--数据表格空白 -->
</div>
</body>
</html>