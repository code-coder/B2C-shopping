<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的订单</title>
 <link href="${RES }/css/user-style.css" rel="stylesheet" type="text/css" media="all" />

</head>

<body>
<s:include value="/WEB-INF/pages/common/header.jsp"/>
<div class="container container-fluid margin-20">
	<ul class="breadcrumb">
		<li><a href="${RES }"><i class="fa fa-home"></i></a></li>
		<li><a href="${RES }/customer/shopping/customer_shopping_myShopping.action">我的商城</a></li>
		<li><a href="#">我的订单</a></li>
	</ul>
<div class="row">

<div class="col-md-3">
<s:include value="/WEB-INF/pages/customer/common/menu.jsp"></s:include>
</div>
<!-- start main -->
<div class="main-content col-md-9">
<div><h3>我的订单</h3></div>
<hr>
<div class="catbox">
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
		<s:iterator value="pageModel.list">
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
<s:url var="first">
        <s:param name="pageNo" value="1"></s:param>
      </s:url>
      <s:url var="previous">
        <s:param name="pageNo" value="pageModel.pageNo-1"></s:param>
      </s:url>
      <s:url var="last">
        <s:param name="pageNo" value="pageModel.bottomPageNo"></s:param>
      </s:url>
      <s:url var="next">
        <s:param name="pageNo" value="pageModel.pageNo+1"></s:param>
      </s:url>

      <s:include value="/WEB-INF/pages/common/page.jsp"></s:include>
</div>
</div>
</div>
</div>
<s:include value="/WEB-INF/pages/common/footer.jsp"></s:include>
</body>
</html>
