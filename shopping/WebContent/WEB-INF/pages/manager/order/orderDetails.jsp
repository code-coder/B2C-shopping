<%@page language="java" import="com.lin.entity.order.Orderitem"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<s:set var="context_path"
	value="#request.get('javax.servlet.forward.context_path')"></s:set>
<link href="${context_path}/css/shop.css" rel="stylesheet"
	type="text/css" />
<title>订单详情</title>
<style type="text/css">
#button {
	margin-top: 20px;
	padding-left: 10px;
	padding-right: 10px;
	font-size: 14px;
	width: 90px;
	height: 36px;
	line-height: 30px;
	vertical-align: middle;
	text-align: center;
	cursor: pointer;
	border-color: #77D1F6;
	border-width: 1px;
	border-style: solid;
	border-radius: 6px 6px;
	-moz-box-shadow: 2px 2px 4px #282828;
	-webkit-box-shadow: 2px 2px 4px #282828;
	background-image: -moz-linear-gradient(top, red, #BFBFBF);
	background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #EBEBEB),
		color-stop(1, #BFBFBF));
}

#orderitems_table {
	width: 100%;
	line-height: 24px;
	borde: 2px solid #e1e1e1;
}

#th {
	background: #e1e1e1;
	color: #FF7F00;
}

#td {
	padding: 10px 0;
	border-top: 1px solid #e1e1e1;
}

hr {
	border: 1px solid #e1e1e1;
}
</style>
</head>
<body>
	<div id="box">
		<div id="all">
			<br>&nbsp; <b style="color: #444444;font-size: 16px;">订单信息</b>
			<div id="order_part1">
				<b style="font-size: 16px;">收货人信息</b>
				<br><br>
				<span style="font-size:16px;">
				&nbsp;&nbsp;&nbsp;寄送到&nbsp;<s:property value="order.address" />(<s:property value="order.consignee" /> 收)&nbsp;<s:property
							value="order.mobile" /></span>	
				<br><br>
				<hr>
				<br>
				<b style="font-size: 16px;">发货清单</b><br><br>
				<table id="orderitems_table">
					<tr>
						<th id="th">商品名称</th>
						<th id="th">商品单价</th>
						<th id="th">商品总价</th>
						<th id="th">购买数量</th>
					</tr>
					<!-- 遍历订单 -->
					<s:iterator value="order.orderitems">	
						<tr>
							<td id="td"><s:iterator value="product.uploadfiles" var="uploadfile">
											<s:if test="#uploadfile.isCover ==1">
											   <img src='${RES}/upload/${uploadfile.path }' width="90px" border="0">
											</s:if>
										</s:iterator>
							<span style="color: blue"><s:property value="product.name" /></span></td>
							<td id="td"><s:property value="product.sellprice" /></td>
							<td id="td"><s:property value="price" /></td>
							<td id="td"><s:property value="amount" /></td>
						</tr>
					</s:iterator>
				</table>
				<br><br>
				<hr>
				<br>
				<div id="order_part1_2">
					<input type="button" id="button" value="确定" 
					onclick="window.location.href='<%=path%>/manager/order/order_list.action?pageNo=<s:property 
					value="pageNo"/>'">
				</div>
			</div>
		</div>
	</div>
</body>
</html>