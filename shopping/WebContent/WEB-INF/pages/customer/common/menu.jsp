<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">

<link href="${RES}/css/accordion-menu.css" rel="stylesheet" type="text/css" />
<link href="${RES}/css/font-awesome/css/font-awesome.css" rel="stylesheet">


<style type="text/css">
*{box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;}
.menu-content{max-width:260px;}
.filterinput{
	background-color:rgba(249, 244, 244, 0);
	border-radius:15px;
	width:90%;
	height:30px;
	border:thin solid #FFF;
	text-indent:0.5em;
	font-weight:bold;
	color:#FFF;
}
#demo-list a{
	overflow:hidden;
	text-overflow:ellipsis;
	-o-text-overflow:ellipsis;
	white-space:nowrap;
	width:100%;
}
</style>

<script src="/shopping/js/jquery-accordion-menu.js" type="text/javascript"></script>
<script type="text/javascript">
jQuery(document).ready(function () {
	jQuery("#jquery-accordion-menu").jqueryAccordionMenu();
	
});

$(function(){	
	//顶部导航切换
	$("#demo-list li").click(function(){
		$("#demo-list li.active").removeClass("active")
		$(this).addClass("active");
	})	
})	
</script>

<div class="menu-content">
	<div id="jquery-accordion-menu" class="jquery-accordion-menu red">
		<ul id="demo-list">
		<li class="active"></li>
		   <li><a href="${RES}"><i class="fa fa-home"></i>商城首页</a></li>
		   <li>
		   <s:a action="customer_shopping_myShopping" namespace="/customer/shopping"><i class="fa fa-suitcase"></i>我的商城</s:a>
		   </li>
			<li><a href="#"><i class="fa fa-user"></i>个人管理</a>
			<ul class="submenu">
					<li><s:a action="customer_shopping_modifyInfo"
					namespace="/customer/shopping">个人资料</s:a></li>
					<li><s:a action="customer_shopping_account"
					namespace="/customer/shopping">个人账户</s:a></li>
					<li><s:a action="customer_shopping_modifyPassword"
					namespace="/customer/shopping">修改密码</s:a></li>
					<li><s:a action="customer_shopping_shoppingAddress"
					namespace="/customer/shopping">管理收货地址</s:a></li>
			</ul>
			</li>
			
			<li><s:a action="customer_cart_myCart" namespace="/customer/cart"><i class="fa fa-file-image-o"></i>购物车</s:a><span class="jquery-accordion-menu-label">
				<s:property value="#session.cart.itemAmount"/> </span></li>
			<li><s:a action="customer_order_myOrder" namespace="/customer/order"><i class="fa fa-cog"></i>我的订单</s:a>
				
			</li>
			<li><a href="#"><i class="fa fa-envelope"></i>Contact </a></li>
		   
		</ul>
		<div class="jquery-accordion-menu-footer">
			Footer
		</div>
	</div>
</div>


<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';clear:both;"></div>
</html>

