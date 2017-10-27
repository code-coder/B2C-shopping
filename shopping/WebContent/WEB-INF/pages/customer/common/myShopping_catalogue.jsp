<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib prefix="s" uri="/struts-tags"%>
<s:set var="context_path"
	value="#request.get('javax.servlet.forward.context_path')"></s:set>
<link href="${context_path}/css/shop.css" rel="stylesheet"
	type="text/css">
</head>

<body>
	<table cellspacing="10px">
		<tr>
			<td><b>我的商城</b></td>
		</tr>
		<tr>
			<td><s:a action="customer_shopping_modifyInfo"
					namespace="/customer/shopping">个人信息</s:a></td>
		</tr>
		<tr>
			<td><s:a action="customer_shopping_modifyPassword"
					namespace="/customer/shopping">修改密码</s:a></td>
		</tr>
		<tr>
			<td><s:a action="customer_shopping_modifyHeadPortrait"
					namespace="/customer/shopping">上传头像</s:a></td>
		</tr>
		<tr>
			<td><s:a action="customer_shopping_account"
					namespace="/customer/shopping">交易账户</s:a></td>
		</tr>
		<tr>
			<td><s:a action="customer_order_myOrder" namespace="/customer/order">我的订单</s:a></td>
		</tr>
		<tr>
			<td><s:a action="customer_cart_myCart" namespace="/customer/cart">我的购物车</s:a></td>
		</tr>
		<tr>
			<td><s:a action="customer_shopping_shoppingAddress"
					namespace="/customer/shopping">收货地址</s:a></td>
		</tr>
	</table>
	
	
</body>
</html>
