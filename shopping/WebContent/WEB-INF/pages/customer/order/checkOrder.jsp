<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>确认订单</title>
<link href="${RES }/css/user-style.css" rel="stylesheet" type="text/css" media="all" />
<link href="${RES }/css/orderconfirm.css" rel="stylesheet" type="text/css" media="all" />
</head>

<body>
<s:include value="/WEB-INF/pages/common/header.jsp"/>
<div class="container container-fluid margin-20">
	<ul class="breadcrumb">
		<li><a href="${RES }"><i class="fa fa-home"></i></a></li>
		<li><a href="#">确认订单</a></li>
	</ul>
<div class="row">

<div class="col-md-3">
<s:include value="/WEB-INF/pages/customer/common/menu.jsp"></s:include>
</div>
<!-- start main -->
<div class="main-content col-md-9">
<div><h3>确认订单</h3></div>
<hr>
<div class="catbox">
<form action="${RES }/customer/order/customer_order_submitOrder" method="post">
<div id="address" class="address" style="margin-top: 20px;">
<b>确认收货地址
	<span class="manage-address">
	<s:a class="makePoint" action="customer_shopping_shoppingAddress" namespace="/customer/shopping">管理收货地址</s:a>
 </span>
</b>
<ul id="address-list" class="container-fluid">
<s:iterator value="shoppingAddresses.list">
          <s:if test="isDefault == true">
          <li class="row text-left" style="position:relative;">
          
            <span class="marker-tip">寄送至</span>
            <div class="col-md-7 col-md-offset-1">
            <input class="makePoint" type="radio" name="shoppingAddress.id" value='<s:property value="id"/>'
              checked="checked" />
			<s:property value="address" />(<s:property value="consignee" /> 收)&nbsp;
			
			<s:property value="mobile" />&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
			<div class="col-md-4">
			<span style="font-size:13px;">
			<a href='${RES }/customer/order/customer_order_modifyShoppingAddress.action?shoppingAddress.id=<s:property
			value="id"/>'>修改</a>
			|
			<a href='${RES }/customer/order/customer_order_delectShoppingAddress.action?shoppingAddress.id=<s:property
			value="id"/>' onclick="javascript: return confirm('确定移除该地址？');">删除</a>
			</span>&nbsp;&nbsp;&nbsp;默认地址
			</div>
          
          </li>
          </s:if>
          <s:else>
          <li class="row">
          <span class="marker-tip" style="display:none;">寄送至</span>
          <div class="col-md-7 col-md-offset-1">
            <input class="makePoint" type="radio" name="shoppingAddress.id" value='<s:property  value="id"/>'>
            <s:property value="address" />(<s:property value="consignee" /> 收)&nbsp;
           
            <s:property value="mobile" />
            </div>
           <div class="col-md-4">
            <span style="font-size:13px;"><a
              href='${RES }/customer/order/customer_order_modifyShoppingAddress.action?shoppingAddress.id=<s:property
              value="id"/>' >修改</a>
              |
              <a href='${RES }/customer/order/customer_order_delectShoppingAddress.action?shoppingAddress.id=<s:property
              value="id"/>' onclick="javascript: return confirm('确定移除该地址？');">删除</a></span>
            </div>
          </li>
          </s:else>
        </s:iterator>
</ul>
<div class="address-bar">
 <s:a cssClass="new" action="customer_order_newShoppingAddress"  namespace="/customer/order">新增收货地址</s:a>
 </div>
 
</div>
        <hr>
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
		<s:if test="#session.orderSource == 'cart'">
            <!-- 遍历购物车 -->
            <s:iterator value="cart.cartitems">
              <tr>
                <td class="goods">
                	<s:iterator value="product.uploadfiles" var="uploadfile">
					<s:if test="#uploadfile.isCover ==1">
                	<img src='${RES}/upload/${uploadfile.path}' width="90px" height="60px" border="0"> 
                	</s:if>
                	</s:iterator>
                	<span style="color: blue"><s:property value="product.name" /></span></td>
                <td class="unit-price"><s:property value="product.sellprice" /></td>
                <td class="subtotal"><s:property value="price" /></td>
                <td class="count"><s:property value="amount" /></td>
              </tr>
            </s:iterator>
          </s:if>
          <s:else>
            <tr>
              <td class="goods">
              <s:iterator value="orderitem.product.uploadfiles" var="uploadfile">
					<s:if test="#uploadfile.isCover ==1">
                	<img src='${RES}/upload/${uploadfile.path}'width="90px" height="60px" border="0"> 
                	</s:if>
               </s:iterator>
              <span style="color: blue">${ orderitem.product.name}</span></td>
              <td class="unit-price">${ orderitem.product.sellprice}</td>
              <td class="subtotal">${ orderitem.price}</td>
              <td class="count">${ orderitem.amount}</td>
            </tr>
          </s:else>
		</tbody>
	</table>
	<hr>
	<div class="text-right">
	<input type="submit" class="btn btn-info" value="支付"/>
	</div>
	</form>
</div>
</div>
</div>
</div>
<s:include value="/WEB-INF/pages/common/footer.jsp"></s:include>
</body>
</html>
