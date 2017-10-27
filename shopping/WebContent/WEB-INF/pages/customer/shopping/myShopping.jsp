<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link href="${RES }/css/user-style.css" rel="stylesheet" type="text/css" media="all" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的商城</title>
</head>
<body>
	<s:include value="/WEB-INF/pages/common/header.jsp"></s:include>
	<div class="container container-fluid margin-20">
		<ul class="breadcrumb">
			<li><a href="${RES }"><i class="fa fa-home"></i></a></li>
			<li><a href="#">我的商城</a></li>
		</ul>
		<div class="row">
			<div class="col-md-3">
				<s:include value="/WEB-INF/pages/customer/common/menu.jsp"></s:include>
			</div>
			<!-- start main -->
			<div class="main-content col-md-9">
				<div class="path">
					<h3>我的商城</h3>
				</div>
				<hr>
				<div class="myshopping-personal">
					<div class="head">
						<s:if test="#session.customer.headPortrait.path == null">
							<s:a action="customer_shopping_modifyHeadPortrait"
								namespace="/customer/shopping">
								<img src="${HEAD_SRC }" width="130" height="130" border="1">
							</s:a>
						</s:if>
						<s:else>
							<s:a action="customer_shopping_modifyHeadPortrait" namespace="/customer/shopping">
								<img src='${HEADSRC }<s:property value="#session.customer.headPortrait.path"/>' width="130" height="130" border="1">
							</s:a>
						</s:else>
					</div>
					<div class="info">
						<ul>
							<li><s:a action="customer_shopping_modifyInfo"
									namespace="/customer/shopping">
									<b style="font-size: 18px;"><s:property
											value="#session.customer.username" /></b>
								</s:a></li>
							<li>实名： <s:if test="#session.customer.realname !=null">
									<s:property value="#session.customer.realname" />
								</s:if> <s:else>未实名</s:else>
							</li>
							<li>余额： <s:a action="customer_shopping_account"
									namespace="/customer/shopping">
									<b style="color: red; font-size: 16px;"><fmt:formatNumber value="${account.balance }" pattern="￥0.00"/></b>
								</s:a>
							</li>
						</ul>
					</div>
				</div>
				<div class="catbox">
					<div class="content-title-1">
						<s:a action="customer_cart_myCart" namespace="/customer/cart">
							<b>我的购物车 ( <s:property value="cart.itemAmount" /> )
							</b>
						</s:a>
					</div>
					<s:if test="cart.itemAmount <= 0">
						<br>&nbsp;&nbsp;&nbsp;&nbsp; <img
							src="${RES}/images/cart.png" width="40" height="30">
						<span style="color: #c1c1c1">您买的东西太少了，这里都空空的，快去挑选合适的商品吧！</span>
					</s:if>
					<s:else>
						<br>
						<table id="cartitems_table">
							<tr>
								<th id="th">商品名称</th>
								<th id="th">商品单价</th>
								<th id="th">总价</th>
								<th id="th">购买数量</th>
							</tr>
							<!-- 遍历购物车 -->
							<s:iterator value="cart.cartitems">
								<tr>
									<td id="td">
										<s:iterator value="product.uploadfiles" var="uploadfile">
											<s:if test="#uploadfile.isCover ==1">
											   <img src='${RES}/upload/${uploadfile.path }' width="90px" height="60px" border="0">
											</s:if>
										</s:iterator>
										<span style="color: blue"><s:property value="product.name" /></span>
									</td>
									<td id="td"><fmt:formatNumber value="${ product.sellprice}" pattern="￥.00"/></td>
									<td id="td"><fmt:formatNumber value="${ price}" pattern="￥.00"/></td>
									<td id="td"><s:property value="amount" /></td>
								</tr>
							</s:iterator>
						</table>
					</s:else>
				</div>
				<div class="catbox">
					<div class="content-title-1">
						<s:a action="customer_order_myOrder" namespace="/customer/order">
							<b>我的订单 ( <s:property value="orders.totalRecords" /> )
							</b>
						</s:a>
					</div>
					<s:if test="orders.totalRecords <= 0">
						<span>您还没有购买过东西！去看看吧！</span>
					</s:if>
					<s:else>
						<br>
						<table id="cartTable">
		<thead>
            <tr>
                <th>订单编号</th>
                <th>下单时间</th>
                <th>金额</th>
                <th>订单状态</th>
                <th>订单评价</th>
                <th>操作</th>
            </tr>
        </thead>
		<!-- 遍历订单 -->
		<tbody>
		<s:iterator value="orders.list">
			<tr>
				<td class="ckbox">
	            	<s:property value="orderId" />
	            </td>
				<td class="goods">
					<fmt:formatDate value="${createTime }" type="date" dateStyle="full"/>
					<br>
					<fmt:formatDate value="${createTime }" type="time" dateStyle="short"/>
				</td>
				<td class="unit-price"><fmt:formatNumber value="${totalPrice }" type="currency" pattern="￥.00" /></td>
				<td class="count">
				<s:if test="orderState == '未付款'">
	              <a href='${RES }/customer/order/customer_order_payForOrder.action?order.orderId=<s:property 
	            value="orderId"/>&order.totalPrice=<s:property  value="totalPrice"/>'>未付款</a>
	            </s:if>
	            <s:else>
	              <s:property value="orderState" />
	            </s:else>
				</td>
				<td class="subtotal">评价</td>
				<td class="operation"><a href='${RES }/customer/order/customer_order_viewOrderDetails.action?order.orderId=<s:property 
                value="orderId"/>' >查看订单详情</a></td>
			</tr>
		</s:iterator>
		</tbody>
	</table>
					</s:else>
				</div>

			</div>
		</div>
	</div>
<s:include value="../../common/footer.jsp"></s:include>

