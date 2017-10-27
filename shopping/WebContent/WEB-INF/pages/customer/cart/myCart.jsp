<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的购物车</title>
 <link href="${RES }/css/user-style.css" rel="stylesheet" type="text/css" media="all" />

</head>

<body>
<s:include value="/WEB-INF/pages/common/header.jsp"/>
<div class="container container-fluid margin-20">
	<ul class="breadcrumb">
		<li><a href="${RES }"><i class="fa fa-home"></i></a></li>
		<li><a href="${RES }/customer/shopping/customer_shopping_myShopping.action">我的商城</a></li>
		<li><a href="#">购物车</a></li>
	</ul>
<div class="row">
<div class="col-md-3">
<s:include value="/WEB-INF/pages/customer/common/menu.jsp"></s:include>
</div>
<!-- start main -->
         <div class="main-content col-md-9">
         
         <div><h3>我的购物车</h3></div>
         <hr>
			<p>
				<span style="color: red;"><strong>全部商品：<s:property value="cart.itemAmount" /></strong></span>
				<span style="font-size: 14px;float: right;margin-right: 5px;"><a 
					  href="${RES }/customer/cart/customer_cart_clearCart.action" onclick="javascript: return confirm('您确定清空购物车吗？');">清空购物车</a></span>
		<div class="catbox">
		<s:if test="cart.itemAmount != 0">
		<div class="cart-mainBody">
			<form action="${RES}/customer/order/customer_order_checkOrderFromCart.action" method="post">
				<table id="cartTable">
					<thead>
                        <tr>
                            <th>
                                <label>
                                    <input type="checkbox" class="check-all check" >全选
                                </label>
                            </th>
                            <th>商品信息</th>
                            <th>单价（元）</th>
                            <th>数量</th>
                            <th>小计（元）</th>
                            <th>操作</th>
                        </tr>
                    </thead>
					<!-- 遍历购物车 -->
					<s:iterator value="cart.cartitems" var="cartitem">
						<tr>
							<td class="ckbox">
                                <input type="checkbox" name="cartId" class="check-one check" value='<s:property value="id"/>'>
                            </td>
							<td class="goods">
							<a href="${RES }/product/product_select.action?product.id=<s:property value="product.id"/>">
							<s:iterator value="product.uploadfiles" var="uploadfile">
								<s:if test="#uploadfile.isCover ==1">
								   <img src='${RES}/upload/${uploadfile.path }' >
								</s:if>
							</s:iterator>
								   <span ><s:property  value="product.name" />商品描述</span>
							</a>
							</td>
							<td class="unit-price"><fmt:formatNumber value="${ product.sellprice}" pattern=".00"/></td>
							
							<td class="count">
							<span style="display:none;" class="reduce"></span>
							<input type="text" style="border:0" disabled data-id="${cartitem.id }" name="amount" class="count-input" value="<s:property value="amount" />"/>
							<span style="display:none;" class="add">+</span>
							
							</td>
							<td class="subtotal"><fmt:formatNumber value="${ price}" pattern=".00"/></td>
							<td class="operation">
							<a href="javascript:;"  class="edit">编辑</a>
							<a href="javascript:;" style="display:none;" class="finish">完成</a>
							<a href='${RES}/customer/cart/customer_cart_removeItem.action?cartitem.id=<s:property 
							value="id"/>' onclick="javascript: return confirm('确定移除该商品？');">移除</a></td>
						</tr>
					</s:iterator>
				</table>
				<div id="foot" class="foot">
                    <label class="fl select-all">
                        <input type="checkbox" class="check-all check " name="">全选
                    </label>
                    <a class="fl delete" id="deleteAll" href="javascript:;" style="display:none">删除</a>
                    <div class="fr closing">
                    <input id="jiesuan" class="btn btn-primary" type="submit" value="结算">
					</div>
                    <input type="hidden" id="cartTotalPrice" name="">
                    <div class="fr total">合计：￥<span id="priceTotal">0.00</span>
                        <input type="text" id="priceTotalInput" name="priceTotal" class="hidden">
                    </div>
                    <div class="fr selected" id="selected">
                    	已选商品数
                        <span id="selectedTotal">0</span>
                        <span class="arrow up">︽</span>
                    </div>
                    </div>
                    </form>
                </div>
                
		</s:if>
		</div>
	</div>
	</div>
</div>
<script type="text/javascript" src="${RES }/js/cart.js"></script>
<s:include value="/WEB-INF/pages/common/footer.jsp"></s:include>
</body>
</html>
