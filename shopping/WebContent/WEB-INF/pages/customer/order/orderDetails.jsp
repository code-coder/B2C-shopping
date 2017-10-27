<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单详情</title>
 <link href="${RES }/css/user-style.css" rel="stylesheet" type="text/css" media="all" />

</head>

<body>
<s:include value="/WEB-INF/pages/common/header.jsp"/>
<div class="container container-fluid margin-20">
	<ul class="breadcrumb">
		<li><a href="${RES }"><i class="fa fa-home"></i></a></li>
		<li><a href="${RES }/customer/shopping/customer_shopping_myShopping.action">我的商城</a></li>
		<li><a href="#">订单详情</a></li>
	</ul>
<div class="row">

<div class="col-md-3">
<s:include value="/WEB-INF/pages/customer/common/menu.jsp"></s:include>
</div>
<!-- start main -->
<div class="main-content col-md-9">
<div><h3>订单详情</h3></div>
<hr>
<div class="catbox">
<b>收货人信息</b>
<ul>
	<li>收件地址：${order.address }</li>
	<li>收件人：${order.consignee }</li>
	<li>收件人电话：${order.mobile }</li>
</ul>
<hr>
<b>订单信息</b>
<ul>
<li>订单编号：${order.orderId }</li>
<li>订单状态：${order.orderState }</li>
<li>订单创建时间：<fmt:formatDate value="${order.createTime }" type="date" dateStyle="full"/>&nbsp;&nbsp;<fmt:formatDate value="${order.createTime }" type="time" dateStyle="short"/></li>
<li>订单支付时间：<fmt:formatDate value="${order.payTime }" type="date" dateStyle="full"/>&nbsp;&nbsp;<fmt:formatDate value="${order.payTime }" type="time" dateStyle="short"/></li>
</ul>
<hr>
<b>商品信息</b>
<br>
	<table id="cartTable">
		<thead>
          <tr>
            <th >商品名称</th>
            <th >商品单价</th>
            <th >商品价格</th>
            <th >购买数量</th>
          </tr>
        </thead>
		<!-- 遍历订单 -->
		<tbody>
		<s:iterator value="order.orderitems">
			<tr>
				<td class="goods">
					<a href="${RES }/product/product_select.action?product.id=${product.id}">
					<s:iterator value="product.uploadfiles" var="uploadfile">
								<s:if test="#uploadfile.isCover ==1">
								   <img src='${RES}/upload/${uploadfile.path }' >
								</s:if>
					</s:iterator> 
					<span><s:property value="product.name" /></span>
					</a>
				</td>
				<td class="unit-price"><s:property value="product.sellprice" /></td>
				<td class="subtotal">
				<s:property value="price" />
				</td>
				<td class="count">
				<s:property value="amount" />
				</td>
			</tr>
		</s:iterator>
		</tbody>
	</table>
	<hr>
	<a href="${RES }/customer/order/customer_order_myOrder.action">返回我的订单</a>
</div>
</div>
</div>
</div>
<s:include value="/WEB-INF/pages/common/footer.jsp"></s:include>
</body>
</html>
