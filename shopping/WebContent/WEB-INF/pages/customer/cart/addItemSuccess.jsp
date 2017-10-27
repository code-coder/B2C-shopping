<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<s:set var="context_path"
	value="#request.get('javax.servlet.forward.context_path')"></s:set>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>   
    <title>添加进入购物车成功</title>
  </head>
  
  <body>
    <center>
      <img src="${context_path}/images/add_cart_success.jpg"/>
      <hr>
      	成功添加进购物车，<s:a action="customer_cart_myCart" namespace="/customer/cart">查看我的购物车</s:a>
      <br>
      <br>
      <br>
      
    </center>
  </body>
</html>
