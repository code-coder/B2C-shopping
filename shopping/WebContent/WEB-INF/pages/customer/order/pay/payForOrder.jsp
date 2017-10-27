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
		<li><a href="#">余额支付</a></li>
	</ul>
<div class="row">
<div class="col-md-3">
<s:include value="/WEB-INF/pages/customer/common/menu.jsp"></s:include>
</div>
<!-- start main -->
<div class="main-content col-md-9">
<div><h3>余额支付</h3></div>
<hr>
  <div id="box">
    <div id="all">  
      <div id="order_part1">
        应付金额：<b style="color: red;font-size: 24px;">￥<s:property value="order.totalPrice"/></b><br><br>
        <form action="${RES }/customer/order/customer_order_payValid.action" >
          <s:hidden name="order.orderId"></s:hidden>
          <table>
          <tr>
          <td>支付密码： <input type="password" id="text" name="account.password"></td>
          <td id="td1"><input class="btn btn-primary" type="submit" id="button"  value="支付">&nbsp;
          <a class="btn btn-primary" href="${RES }/customer/order/customer_order_myOrder.action" onclick="javascript: return confirm('确定放弃支付吗？');">放弃</a></td> 
          </tr></table>
          <span style="color: red;"><s:fielderror></s:fielderror></span>
        </form>
      </div>
    </div>
  </div>
</div>
</div>
</div>
<s:include value="/WEB-INF/pages/common/footer.jsp"></s:include>
</body>
</html>
