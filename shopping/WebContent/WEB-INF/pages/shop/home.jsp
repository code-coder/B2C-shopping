<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="keywords" content="" />
    <meta charset="utf-8">
   
	<!-- Mobile specific metas
	============================================ -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	
	<!-- Favicon
	============================================ -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="ico/apple-touch-icon-57-precomposed.png">
    <link rel="shortcut icon" href="ico/favicon.png">
	
	<!-- Google web fonts
	============================================ -->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>
	
    <!-- Libs CSS
	============================================ -->
    <link rel="stylesheet" href="${RES}/css/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${RES}/css/style.css">
	<link href="${RES}/css/font-awesome/css/font-awesome.css" rel="stylesheet">
	<link href="${RES}/js/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <link href="${RES}/js/owl-carousel/owl.carousel.css" rel="stylesheet">
	<link href="${RES}/css/themecss/lib.css" rel="stylesheet">
	<link href="${RES}/js/jquery-ui/jquery-ui.min.css" rel="stylesheet">
	
	<!-- Theme CSS
	============================================ -->
   	<link href="${RES}/css/themecss/so_megamenu.css" rel="stylesheet">
    <link href="${RES}/css/themecss/so-categories.css" rel="stylesheet">
	<link href="${RES}/css/themecss/so-listing-tabs.css" rel="stylesheet">
	<link id="color_scheme" href="${RES}/css/theme.css" rel="stylesheet">
	<link href="${RES}/css/responsive.css" rel="stylesheet">
	<script type="text/javascript" src="${RES}/js/jquery-2.2.4.min.js"></script>
	
<title>商城首页</title>
</head>

<body class="common-home res layout-home1">
<input type="hidden" id="cid" value="${cid }">
    <div id="wrapper" class="wrapper-full banners-effect-7">
	<!-- Header Container  -->
	<header id="header" class=" variantleft type_1">
<!-- Header Top -->
<div class="header-top compact-hidden">
	<div class="container">
		<div class="row">
			<div class="header-top-left form-inline col-sm-6 col-xs-12 compact-hidden">
				<div class="form-group languages-block ">
					<form action="#" method="post" enctype="multipart/form-data" id="bt-language">
						<a class="btn btn-xs dropdown-toggle" data-toggle="dropdown">
							<span class="">中文</span>
							<span class="fa fa-angle-down"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="#"><img class="image_flag" src="${RES}/image/demo/flags/gb.png" alt="English" title="English" /> English </a></li>
						</ul>
					</form>
				</div>

				<div class="form-group currencies-block">
					<form action="index.html" method="post" enctype="multipart/form-data" id="currency">
						<a class="btn btn-xs dropdown-toggle" data-toggle="dropdown">
							<span class="icon icon-credit "></span> ￥人民币 <span class="fa fa-angle-down"></span>
						</a>
						<ul class="dropdown-menu btn-xs">
							<li> <a href="#">(€)&nbsp;Euro</a></li>
							<li> <a href="#">(£)&nbsp;Pounds	</a></li>
							<li> <a href="#">($)&nbsp;US Dollar	</a></li>
						</ul>
					</form>
				</div>
			</div>
			<div class="header-top-right collapsed-block text-right  col-sm-6 col-xs-12 compact-hidden">
				<h5 class="tabBlockTitle visible-xs">More<a class="expander " href="#TabBlock-1"><i class="fa fa-angle-down"></i></a></h5>
				<div class="tabBlock" id="TabBlock-1">
					<ul class="top-link list-inline">
					<s:if test="#session.customer != null">
						<li class="account" id="my_account">
							<a href="#" title="My Account" class="btn btn-xs dropdown-toggle" data-toggle="dropdown"> <span ><s:property value="#session.customer.username" /></span> <span class="fa fa-angle-down"></span></a>
							<ul class="dropdown-menu ">
								<li><s:a action="customer_logout" namespace="/customer"><span><i class="fa fa-sign-out"></i>注销</span></s:a></li>
							</ul>
						</li>
					</s:if>
					<s:else>
						<li class="account" id="my_account">
							<a href="#" title="My Account" class="btn btn-xs dropdown-toggle" data-toggle="dropdown"> <span >请登录</span> <span class="fa fa-angle-down"></span></a>
							<ul class="dropdown-menu ">
								<li><s:a action="customer_regist" namespace="/customer"><i class="fa fa-user"></i>免费注册</s:a></li>
								<li><s:a action="customer_toLogin" namespace="/customer"><i class="fa fa-pencil-square-o"></i>登录</s:a></li>
							</ul>
						</li>
					</s:else>
						<li class="wishlist"><s:a cssClass="top-link-wishlist" action="customer_shopping_myShopping" namespace="/customer/shopping">我的商城</s:a></li>
						
						<li class="login"><s:a action="customer_cart_myCart" namespace="/customer/cart">我的购物车</s:a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- //Header Top -->

<!-- Header center -->
<div class="header-center left">
	<div class="container">
		<div class="row">
			<!-- Logo -->
			<div class="navbar-logo col-md-3 col-sm-12 col-xs-12">
				<a href="${RES }"><img src="${RES}/image/demo/logos/theme_logo.png" title="Your Store" alt="Your Store" /></a>
			</div>
			<!-- //end Logo -->

			<!-- Search -->
			<div id="sosearchpro" class="col-sm-6 search-pro">
				<form method="post" action="${RES }/product/product_findBySearchword">
					<div id="search0" class="search input-group">
						<input class="autosearch-input form-control" type="text" value="" size="50" autocomplete="off" placeholder="输入关键字，查找你想要的" name="searchword">
						<span class="input-group-btn">
						<button type="submit" class="button-search btn btn-primary" name="submit_search"><i class="fa fa-search"></i></button>
						</span>
					</div>
					<input type="hidden" name="route" value="product/search" />
				</form>
			</div>
			<!-- //end Search -->

			<!-- Secondary menu -->
			<div class="col-md-3 col-sm-5 col-xs-12 shopping_cart pull-right">
				<!--cart-->
				<div id="cart" class=" btn-group btn-shopping-cart">
					<a data-loading-text="Loading..." class="top_cart dropdown-toggle" data-toggle="dropdown">
						<div class="shopcart">
							<span class="handle pull-left"></span>
							<span class="title">我的购物车</span>
							<p class="text-shopping-cart cart-total-full"><s:if test="#session.customer != null"><span id="count">${ cart.itemAmount}</span>种 -共计 <fmt:formatNumber value="${ cart.totalPrice}" pattern="￥0.00"/></s:if><s:else>0种 -共计 ￥0.00</s:else></p>
						</div>
					</a>

					<ul class="tab-content content dropdown-menu pull-right shoppingcart-box" role="menu">
						<s:if test="#session.cart.itemAmount">
						<li>
							<table class="table table-striped">
								<tbody>
								<s:iterator value="#session.cart.cartitems" var="cartitem">
									<tr>
										<td class="text-center" style="width:70px">
											<a href="${RES }/product/product_select.action?product.id=${cartitem.product.id}"> 
											<s:iterator value="product.uploadfiles" var="uploadfile">
												<s:if test="#uploadfile.isCover ==1">
												   <img src="${RES}/upload/${uploadfile.path }" style="width:70px" alt="${product.name }" title="${product.name }" class="preview">
												</s:if>
											</s:iterator>
											 </a>
										</td>
										<td class="text-left" > <a class="cart_product_name"  href="product.html">${product.name }</a> </td>
										<td class="text-center"> x${cartitem.amount } </td>
										<td class="text-center"> <fmt:formatNumber value="${ cartitem.price}" pattern="￥0.00"/></td>
										<td class="text-right">
											<a href="product.html" class="fa fa-edit"></a>
										</td>
										<td class="text-right">
											<a href='${RES}/customer/cart/customer_cart_removeItem.action?cartitem.id=<s:property 
							value="id"/>' onclick="javascript: return confirm('确定移除该商品？');" class="fa fa-times fa-delete"></a>
										</td>
									</tr>
								</s:iterator>
								
								</tbody>
							</table>
						</li>
						<li>
							<div>
								<table class="table table-bordered">
									<tbody>
										<tr>
											<td class="text-left"><strong>商品总计</strong>
											</td>
											<td class="text-right"> <fmt:formatNumber value="${ cart.totalPrice}" pattern="￥0.00"></fmt:formatNumber></td>
										</tr>
									</tbody>
								</table>
								<p class="text-right"> <a class="btn view-cart" href="${RES }/customer/cart/customer_cart_myCart.action"><i class="fa fa-shopping-cart"></i>进入购物车</a> </p>
							</div>
						</li>
						</s:if>
						<s:else>
						<li>购物车空空的!<a class="te" href="${RES }">去逛逛!</a></li>
						</s:else>
					</ul>
				</div>
				<!--//cart-->
			</div>
		</div>

	</div>
</div>
<!-- //Header center -->

<!-- Header Bottom -->
<div class="header-bottom">
	<div class="container">
		<div class="row">
			<div class="sidebar-menu col-md-3 col-sm-6 col-xs-12 ">
				<div class="responsive so-megamenu ">
					<div class="so-vertical-menu no-gutter compact-hidden">
						<nav class="navbar-default">	
							
							<div class="container-megamenu vertical open">
								<div id="menuHeading">
									<div class="megamenuToogle-wrapper">
										<div class="megamenuToogle-pattern">
											<div class="container">
												<div>
													<span></span>
													<span></span>
													<span></span>
												</div>
												All Categories							
												<i class="fa pull-right arrow-circle fa-chevron-circle-up"></i>
											</div>
										</div>
									</div>
								</div>
								<div class="navbar-header">
									<button type="button" id="show-verticalmenu" data-toggle="collapse" class="navbar-toggle fa fa-list-alt">
										
									</button>
									All Categories		
								</div>
								<div class="vertical-wrapper">
									<span id="remove-verticalmenu" class="fa fa-times"></span>
									<div class="megamenu-pattern">
										<div class="container">
											<ul class="megamenu">
											<s:iterator value="#request.catalogue" var="c">
												<li class="item-vertical style1 with-sub-menu hover">
													<p class="close-menu"></p>
													<a href="${RES }/product/product_findByCategoryId.action?productCategory.id=<s:property value="#c.id"/>" class="clearfix">
														<img src="${RES}/image/theme/icons/9.png" alt="icon">
														<span><s:property value="#c.name"/></span>
														<b class="caret"></b>
													</a>
													<s:if test="#c.secondcategories.size() >0">
													<div class="sub-menu" data-subwidth="60" style="width: 540px; display: none; right: 0px;">
														<div class="content" style="display: none;">
															<div class="row">
																<div class="col-md-12">
																	<div class="row">
																	<s:iterator value="#c.secondcategories" var="sc">
																		<div class="col-md-2 static-menu">
																			<div class="menu">
																				<ul>
																					<li>
																						<a href="#" onclick="window.location = '81';" class="main-menu"><s:property value="#sc.name"/></a>
																						<ul>
																						<s:if test="#sc.productcategories">
																						<s:iterator value="#sc.productcategories" var="pc">
																							<li><a href="${RES }/product/product_findByCategoryId.action?productCategory.id=<s:property value="#pc.id"/>"><s:property value="#pc.name"/></a></li>
																						</s:iterator>
																						</s:if>
																						</ul>
																					</li>
																				
																				</ul>
																			</div>
																		</div>
																		</s:iterator>
																	</div>
																</div>
																</div>
															</div>
														</div>
														</s:if>
												</li>
											</s:iterator>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</nav>
					</div>
				</div>
			</div>
			<!-- Main menu -->
<div class="megamenu-hori header-bottom-right  col-md-9 col-sm-6 col-xs-12 ">
<div class="responsive so-megamenu ">
	<nav class="navbar-default">
		<div class=" container-megamenu  horizontal">
			<div class="navbar-header">
				<button type="button" id="show-megamenu" data-toggle="collapse" class="navbar-toggle">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				Navigation		
			</div>
			
			<div class="megamenu-wrapper">
				<span id="remove-megamenu" class="fa fa-times"></span>
				<div class="megamenu-pattern">
					<div class="container">
						<ul class="megamenu " data-transition="slide" data-animationtime="250">
							<li class="home hover">
								<a href="${RES }">首页</a>
							</li>
							<li class="with-sub-menu hover">
								<p class="close-menu"></p>
								<a href="#" class="clearfix">
									<strong>精选推荐</strong>
									<span class="label"> Hot</span>
									<b class="caret"></b>
								</a>
								<div class="sub-menu" style="width: 100%; right: auto;">
									<div class="content" >
										<div class="row">
											<div class="col-md-3">
												<div class="column">
													<a href="#" class="title-submenu">Listing pages</a>
													<div>
														<ul class="row-list">
															<li><a href="category.html">Category Page 1 </a></li>
															<li><a href="#">Category Page 2</a></li>
															<li><a href="#">Category Page 3</a></li>
														</ul>
														
													</div>
												</div>
											</div>
											<div class="col-md-3">
												<div class="column">
													<a href="#" class="title-submenu">Product pages</a>
													<div>
														<ul class="row-list">
															<li><a href="product.html">Image size - big</a></li>
															<li><a href="#">Image size - medium</a></li>
															<li><a href="#">Image size - small</a></li>
														</ul>
													</div>
												</div>
											</div>
											<div class="col-md-3">
												<div class="column">
													<a href="#" class="title-submenu">Shopping pages</a>
													<div>
														<ul class="row-list">
															<li><a href="#">Shopping Cart Page</a></li>
															<li><a href="#">Checkout Page</a></li>
															<li><a href="#">Compare Page</a></li>
															<li><a href="#">Wishlist Page</a></li>
														
														</ul>
													</div>
												</div>
											</div>
											<div class="col-md-3">
												<div class="column">
													<a href="#" class="title-submenu">My Account pages</a>
													<div>
														<ul class="row-list">
															<li><a href="login.html">Login Page</a></li>
															<li><a href="register.html">Register Page</a></li>
															<li><a href="#">My Account</a></li>
															<li><a href="#">Order History</a></li>
															<li><a href="#">Order Information</a></li>
															<li><a href="#">Product Returns</a></li>
															<li><a href="#">Gift Voucher</a></li>
														</ul>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</li>
<%-- 							<li class="with-sub-menu hover">
								<p class="close-menu"></p>
								<a href="#" class="clearfix">
									<strong>Pages</strong>
									<span class="label"> Hot</span>
									<b class="caret"></b>
								</a>
								<div class="sub-menu" style="width: 40%; ">
									<div class="content" >
										<div class="row">
											<div class="col-md-6">
												<ul class="row-list">
													<li><a class="subcategory_item" href="#">FAQ</a></li>
													<li><a class="subcategory_item" href="#">Typography</a></li>
													<li><a class="subcategory_item" href="#">Site Map</a></li>
													<li><a class="subcategory_item" href="#">Contact us</a></li>
													<li><a class="subcategory_item" href="#">Banner Effect</a></li>
												</ul>
											</div>
											<div class="col-md-6">
												<ul class="row-list">
													<li><a class="subcategory_item" href="#">About Us 1</a></li>
													<li><a class="subcategory_item" href="#">About Us 2</a></li>
													<li><a class="subcategory_item" href="#">About Us 3</a></li>
													<li><a class="subcategory_item" href="#">About Us 4</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="with-sub-menu hover">
								<p class="close-menu"></p>
								<a href="#" class="clearfix">
									<strong>Categories</strong>
									<span class="label"></span>
									<b class="caret"></b>
								</a>
								<div class="sub-menu" style="width: 100%; display: none;">
									<div class="content">
										<div class="row">
											<div class="col-sm-12">
												<div class="row">
													<div class="col-md-3 img img1">
														<a href="#"><img src="${RES}/image/demo/cms/img1.jpg" alt="banner1"></a>
													</div>
													<div class="col-md-3 img img2">
														<a href="#"><img src="${RES}/image/demo/cms/img2.jpg" alt="banner2"></a>
													</div>
													<div class="col-md-3 img img3">
														<a href="#"><img src="${RES}/image/demo/cms/img3.jpg" alt="banner3"></a>
													</div>
													<div class="col-md-3 img img4">
														<a href="#"><img src="${RES}/image/demo/cms/img4.jpg" alt="banner4"></a>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-3">
												<a href="#" class="title-submenu">Automotive</a>
												<div class="row">
													<div class="col-md-12 hover-menu">
														<div class="menu">
															<ul>
																<li><a href="#"  class="main-menu">Car Alarms and Security</a></li>
																<li><a href="#"  class="main-menu">Car Audio &amp; Speakers</a></li>
																<li><a href="#"  class="main-menu">Gadgets &amp; Auto Parts</a></li>
																<li><a href="#"  class="main-menu">More Car Accessories</a></li>
															</ul>
														</div>
													</div>
												</div>
											</div>
											<div class="col-md-3">
												<a href="#" class="title-submenu">Electronics</a>
												<div class="row">
													<div class="col-md-12 hover-menu">
														<div class="menu">
															<ul>
																<li><a href="#"  class="main-menu">Battereries &amp; Chargers</a></li>
																<li><a href="#"  class="main-menu">Headphones, Headsets</a></li>
																<li><a href="#"  class="main-menu">Home Audio</a></li>
																<li><a href="#"  class="main-menu">Mp3 Players &amp; Accessories</a></li>
															</ul>
														</div>
													</div>
												</div>
											</div>
											<div class="col-md-3">
												<a href="#" class="title-submenu">Jewelry &amp; Watches</a>
												<div class="row">
													<div class="col-md-12 hover-menu">
														<div class="menu">
															<ul>
																<li><a href="#"  class="main-menu">Earings</a></li>
																<li><a href="#"  class="main-menu">Wedding Rings</a></li>
																<li><a href="#"  class="main-menu">Men Watches</a></li>
															</ul>
														</div>
													</div>
												</div>
											</div>
											<div class="col-md-3">
												<a href="#" class="title-submenu">Bags, Holiday Supplies</a>
												<div class="row">
													<div class="col-md-12 hover-menu">
														<div class="menu">
															<ul>
																<li><a href="#"  class="main-menu">Gift &amp; Lifestyle Gadgets</a></li>
																<li><a href="#"  class="main-menu">Gift for Man</a></li>
																<li><a href="#"  class="main-menu">Gift for Woman</a></li>
																<li><a href="#"  class="main-menu">Lighter &amp; Cigar Supplies</a></li>
															</ul>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</li>
							
							<li class="with-sub-menu hover">
								<p class="close-menu"></p>
								<a href="#" class="clearfix">
									<strong>Accessories</strong>
									
									<b class="caret"></b>
								</a>
								<div class="sub-menu" style="width: 100%; display: none;">
									<div class="content" style="display: none;">
										<div class="row">
											<div class="col-md-8">
												<div class="row">
													<div class="col-md-6 static-menu">
														<div class="menu">
															<ul>
																<li>
																	<a href="#"  class="main-menu">Automotive</a>
																	<ul>
																		<li><a href="#">Car Alarms and Security</a></li>
																		<li><a href="#" >Car Audio &amp; Speakers</a></li>
																		<li><a href="#" >Gadgets &amp; Auto Parts</a></li>
																	</ul>
																</li>
																<li>
																	<a href="#"  class="main-menu">Smartphone &amp; Tablets</a>
																	<ul>
																		<li><a href="#" >Accessories for i Pad</a></li>
																		<li><a href="#" >Apparel</a></li>
																		<li><a href="#" >Accessories for iPhone</a></li>
																	</ul>
																</li>
															</ul>
														</div>
													</div>
													<div class="col-md-6 static-menu">
														<div class="menu">
															<ul>
																<li>
																	<a href="#" class="main-menu">Sports &amp; Outdoors</a>
																	<ul>
																		<li><a href="#" >Camping &amp; Hiking</a></li>
																		<li><a href="#" >Cameras &amp; Photo</a></li>
																		<li><a href="#" >Cables &amp; Connectors</a></li>
																	</ul>
																</li>
																<li>
																	<a href="#"  class="main-menu">Electronics</a>
																	<ul>
																		<li><a href="#" >Battereries &amp; Chargers</a></li>
																		<li><a href="#" >Bath &amp; Body</a></li>
																		<li><a href="#" >Outdoor &amp; Traveling</a></li>
																	</ul>
																</li>
															</ul>
														</div>
													</div>
												</div>
											</div>
											<div class="col-md-4">
												<span class="title-submenu">Bestseller</span>
												<div class="col-sm-12 list-product">
													<div class="product-thumb">
														<div class="image pull-left">
															<a href="#"><img src="${RES}/image/demo/shop/product/35.jpg" width="80" alt="Filet Mign" title="Filet Mign" class="img-responsive"></a>
														</div>
														<div class="caption">
															<h4><a href="#">Filet Mign</a></h4>
															<div class="rating-box">
																<span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
															   <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
															   <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
															   <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
															   <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
															</div>
															<p class="price">$1,202.00</p>
														</div>
													</div>
												</div>
												<div class="col-sm-12 list-product">
													<div class="product-thumb">
														<div class="image pull-left">
															<a href="#"><img src="${RES}/image/demo/shop/product/W1.jpg" width="80" alt="Dail Lulpa" title="Dail Lulpa" class="img-responsive"></a>
														</div>
														<div class="caption">
															<h4><a href="#">Dail Lulpa</a></h4>
															<div class="rating-box">
																<span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
															   <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
															   <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
															   <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
															   <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
															</div>
															<p class="price">$78.00</p>
														</div>
													</div>
												</div>
												<div class="col-sm-12 list-product">
													<div class="product-thumb">
														<div class="image pull-left">
															<a href="#"><img src="${RES}/image/demo/shop/product/141.jpg" width="80" alt="Canon EOS 5D" title="Canon EOS 5D" class="img-responsive"></a>
														</div>
														<div class="caption">
															<h4><a href="#">Canon EOS 5D</a></h4>
															
															<div class="rating-box">
																<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
																<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
																<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
																<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
																<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
															</div>
															<p class="price">
																<span class="price-new">$60.00</span>
																<span class="price-old">$145.00</span>
																
															</p>
														</div>
													</div>
												</div>
												
											</div>
										</div>
									</div>
								</div>
							</li> --%>
							<li class="">
								<p class="close-menu"></p>
								<a href="#" class="clearfix">
									<strong>论坛</strong>
									<span class="label"></span>
								</a>
							</li>
							
<%-- 							<li class="hidden-md">
								<p class="close-menu"></p>
								<a href="#" class="clearfix">
									<strong>Buy Theme!</strong>
									
								</a>
							</li> --%>
						</ul>
						
					</div>
				</div>
			</div>
		</div>
	</nav>
</div>
</div>
			<!-- //end Main menu -->
		</div>
	</div>

</div>
<!-- Navbar switcher -->
<!-- //end Navbar switcher -->
</header>
		<!-- //Header Container  -->
		<!-- Block Spotlight1  -->
		<section class="so-spotlight1 ">
			<div class="container">
				<div class="row">
					<div id="yt_header_right"
						class="col-lg-offset-3 col-lg-9 col-md-12">
						<div class="slider-container ">

							<div id="so-slideshow"
								class="col-lg-8 col-md-8 col-sm-12 col-xs-12 two-block">
								<div class="module slideshow no-margin">
									<div class="item">
										<a href="#"><img
											src="${RES}/image/demo/slider/slider-1.png" alt="slider1"
											class="img-responsive"></a>
									</div>
									<div class="item">
										<a href="#"><img
											src="${RES}/image/demo/slider/slider-2.png" alt="slider2"
											class="img-responsive"></a>
									</div>
									<div class="item">
										<a href="#"><img
											src="${RES}/image/demo/slider/slider-3.png" alt="slider3"
											class="img-responsive"></a>
									</div>
								</div>
								<div class="loadeding"></div>
							</div>


							<div class="module col-md-4  hidden-sm hidden-xs three-block ">
								<div class="modcontent clearfix">
									<div class="htmlcontent-block">
										<ul class="htmlcontent-home">
											<li>
												<div class="banners">
													<div>
														<a href="#"><img
															src="${RES}/image/demo/cms/banner1.jpg" alt="banner1"></a>
													</div>
												</div>
											</li>
											<li>
												<div class="banners">
													<div>
														<a href="#"><img
															src="${RES}/image/demo/cms/banner2.jpg" alt="banner1"></a>
													</div>
												</div>
											</li>
											<li>
												<div class="banners">
													<div>
														<a href="#"><img
															src="${RES}/image/demo/cms/banner3.jpg" alt="banner1"></a>
													</div>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- //Block Spotlight1  -->
		<!-- Main Container  -->
		<div class="main-container container">

			<div class="row">
				<div id="content" class="col-sm-12">

					<div class="module tab-slider titleLine">
						<h3 class="modtitle">精选商品</h3>
						<div id="so_listing_tabs_1"
							class="so-listing-tabs first-load module">
							<div class="loadeding"></div>
							<div class="ltabs-wrap">
								<div class="ltabs-tabs-container" data-delay="300"
									data-duration="600" data-effect="starwars" data-ajaxurl="#"
									data-type_source="0">
									<!--Begin Tabs-->
									<div class="ltabs-tabs-wrap">
										<span class="ltabs-tab-selected">Jewelry &amp; Watches
										</span> <span class="ltabs-tab-arrow">▼</span>
										<div class="item-sub-cat">
											<ul class="ltabs-tabs cf">
												<li class="ltabs-tab tab-sel" data-category-id="20"
													data-active-content=".items-category-20"><span
													class="ltabs-tab-label">${feturedCategory1.name }</span></li>
												<li class="ltabs-tab " data-category-id="18"
													data-active-content=".items-category-18"><span
													class="ltabs-tab-label">${feturedCategory2.name }</span></li>
											</ul>
										</div>
									</div>
									<!-- End Tabs-->
								</div>
								<div class="ltabs-items-container">
									<!--Begin Items-->
									<div class="ltabs-items ltabs-items-selected items-category-20 grid"
										data-total="10">
										<div class="ltabs-items-inner ltabs-slider ">
										<s:iterator value="#request.featuredProduct1.list" var="productInfo">
										<div class="ltabs-item product-layout">
											<div class="product-item-container">
												<div class="left-block">
													<div class="product-image-container lazy second_img ">
														<s:iterator value="uploadfiles" var="uploadfile">
															<s:if test="#uploadfile.isCover ==1">
																<img data-src="${RES}/upload/<s:property value="#uploadfile.path"/>" src="" class="img-responsive" />
															</s:if>
														</s:iterator>
													</div>
													<!--Sale Label-->
													<span class="label label-sale">HOT</span>
													<!--countdown box-->
													<div class="countdown_box"></div>
													<!--end countdown box-->

													<!--full quick view block-->
													<s:iterator value="uploadfiles" var="uploadfile">
														<s:if test="#uploadfile.isCover ==1">
															<a class="quickview iframe-link  visible-lg"
																title="${productInfo.getName() }"
																data-fancybox-type="iframe"
																href="${RES}/upload/<s:property value="#uploadfile.path"/>">
																Quickview</a>
														</s:if>
													</s:iterator>
													<!--end full quick view block-->
												</div>
												<div class="right-block">
													<div class="caption">
														<h4>
															<a href="${RES }/product/product_select.action?product.id=<s:property value="id"/>"><s:property value="name" /></a>
														</h4>
														<div class="ratings">
															<div class="rating-box">
																<span class="fa fa-stack"><s:if test="#productInfo.star >=1"><i class="fa fa-star fa-stack-1x"></i></s:if><i class="fa fa-star-o fa-stack-1x"></i></span>
																<span class="fa fa-stack"><s:if test="#productInfo.star >=2"><i class="fa fa-star fa-stack-1x"></i></s:if><i class="fa fa-star-o fa-stack-1x"></i></span>
																<span class="fa fa-stack"><s:if test="#productInfo.star >=3"><i class="fa fa-star fa-stack-1x"></i></s:if><i class="fa fa-star-o fa-stack-1x"></i></span>
																<span class="fa fa-stack"><s:if test="#productInfo.star >=4"><i class="fa fa-star fa-stack-1x"></i></s:if><i class="fa fa-star-o fa-stack-1x"></i></span>
																<span class="fa fa-stack"><s:if test="#productInfo.star >=5"><i class="fa fa-star fa-stack-1x"></i></s:if><i class="fa fa-star-o fa-stack-1x"></i></span>
															</div>
														</div>

														<div class="price">
															<span class="price-new"><fmt:formatNumber value="${productInfo.sellprice }" pattern="￥0.00"></fmt:formatNumber></span> <span
																class="price-old"><fmt:formatNumber
																	value="${productInfo.baseprice }" pattern="￥0.00"></fmt:formatNumber></span> <span
																class="label label-percent">-<fmt:formatNumber
																	value="${(productInfo.baseprice-productInfo.sellprice) / productInfo.baseprice *100}"
																	maxFractionDigits="2"></fmt:formatNumber>%
															</span>
														</div>
														<div class="description item-desc hidden">
															<p>
																<s:property value="description" />
															</p>
														</div>
													</div>

													<div class="button-group">
														<button class="addToCart" type="button"
															data-toggle="tooltip" title="Add to Cart"
															onclick="cart.add(<s:property value="id"/>);">
															<i class="fa fa-shopping-cart"></i> <span
																class="hidden-xs">加入购物车</span>
														</button>
														<a style="display:inline-block;padding: 7px 15px;"
															class="compare" type="button" data-toggle="tooltip"
															title="buy now"
															href="${RES }/product/product_select.action?product.id=${productInfo.id}"><i
															class="fa fa-exchange"></i> <span class="hidden-xs">立即购买</span></a>
													</div>
												</div>
												<!-- right block -->

											</div>

										</div>
										</s:iterator>
										</div>
										
										</div>
										<div class="ltabs-items items-category-18 grid"
											data-total="11">
											<div class="ltabs-items-inner ltabs-slider ">
												<s:iterator value="#request.featuredProduct2.list" var="productInfo">
										<div class="ltabs-item product-layout">
											<div class="product-item-container">
												<div class="left-block">
													<div class="product-image-container lazy second_img ">
														<s:iterator value="uploadfiles" var="uploadfile">
															<s:if test="#uploadfile.isCover ==1">
																<img
																	data-src="${RES}/upload/<s:property value="#uploadfile.path"/>"
																	src="" alt="Apple Cinema 30&quot;"
																	class="img-responsive" />
															</s:if>
														</s:iterator>
													</div>
													<!--Sale Label-->
													<span class="label label-sale">HOT</span>
													<!--countdown box-->
													<div class="countdown_box"></div>
													<!--end countdown box-->

													<!--full quick view block-->
													<s:iterator value="uploadfiles" var="uploadfile">
														<s:if test="#uploadfile.isCover ==1">
															<a class="quickview iframe-link  visible-lg"
																title="${productInfo.getName() }"
																data-fancybox-type="iframe"
																href="${RES}/upload/<s:property value="#uploadfile.path"/>">
																Quickview</a>
														</s:if>
													</s:iterator>
													<!--end full quick view block-->
												</div>
												<div class="right-block">
													<div class="caption">
														<h4>
															<a
																href="${RES }/product/product_select.action?product.id=<s:property value="id"/>"><s:property
																	value="name" /></a>
														</h4>
														<div class="ratings">
															<div class="rating-box">
																<span class="fa fa-stack"><s:if test="#productInfo.star >=1"><i class="fa fa-star fa-stack-1x"></i></s:if><i class="fa fa-star-o fa-stack-1x"></i></span>
																<span class="fa fa-stack"><s:if test="#productInfo.star >=2"><i class="fa fa-star fa-stack-1x"></i></s:if><i class="fa fa-star-o fa-stack-1x"></i></span>
																<span class="fa fa-stack"><s:if test="#productInfo.star >=3"><i class="fa fa-star fa-stack-1x"></i></s:if><i class="fa fa-star-o fa-stack-1x"></i></span>
																<span class="fa fa-stack"><s:if test="#productInfo.star >=4"><i class="fa fa-star fa-stack-1x"></i></s:if><i class="fa fa-star-o fa-stack-1x"></i></span>
																<span class="fa fa-stack"><s:if test="#productInfo.star >=5"><i class="fa fa-star fa-stack-1x"></i></s:if><i class="fa fa-star-o fa-stack-1x"></i></span>
															</div>
														</div>

														<div class="price">
															<span class="price-new">￥<fmt:formatNumber value="${productInfo.sellprice }" minFractionDigits="2" maxFractionDigits="2"></fmt:formatNumber></span> <span
																class="price-old">￥<fmt:formatNumber
																	value="${productInfo.baseprice }" minFractionDigits="2"
																	maxFractionDigits="2"></fmt:formatNumber></span> <span
																class="label label-percent">-<fmt:formatNumber
																	value="${(productInfo.baseprice-productInfo.sellprice) / productInfo.baseprice *100}"
																	maxFractionDigits="2"></fmt:formatNumber>%
															</span>
														</div>
														<div class="description item-desc hidden">
															<p>
																<s:property value="description" />
															</p>
														</div>
													</div>

													<div class="button-group">
														<button class="addToCart" type="button"
															data-toggle="tooltip" title="Add to Cart"
															onclick="cart.add(<s:property value="id"/>);">
															<i class="fa fa-shopping-cart"></i> <span
																class="hidden-xs">加入购物车</span>
														</button>
														<a style="display:inline-block;padding: 7px 15px;"
															class="compare" type="button" data-toggle="tooltip"
															title="buy now"
															href="${RES }/product/product_select.action?product.id=${productInfo.id}"><i
															class="fa fa-exchange"></i> <span class="hidden-xs">立即购买</span></a>
													</div>
												</div>
												<!-- right block -->

											</div>

										</div>
										</s:iterator>
										</div>
										</div>
									</div>
									<!--End Items-->
								</div>
							</div>
						</div>
						<div class="module ">
							<div class="modcontent clearfix">
								<div class="banner-wraps ">
									<div class="m-banner row">
										<div
											class="banner htmlconten1 col-lg-4 col-md-4 col-sm-6 col-xs-12">
											<div class="banners">
												<div>
													<a href="#"><img
														src="${RES}/image/demo/cms/banner2-1.png" alt="banner1"></a>
												</div>
											</div>
										</div>
										<div class="htmlconten2 col-lg-4 col-md-4 col-sm-6 col-xs-12">
											<div class="module banners">
												<div>
													<a href="#"><img
														src="${RES}/image/demo/cms/banner2-2.png" alt="banner1"></a>
												</div>
											</div>

											<div class="banners">
												<div>
													<a href="#"><img
														src="${RES}/image/demo/cms/banner2-3.png" alt="banner1"></a>
												</div>
											</div>

										</div>
										<div
											class="banner htmlconten3 hidden-sm col-lg-4 col-md-4 col-sm-6 col-xs-12">
											<div class="banners">
												<div>
													<a href="#"><img
														src="${RES}/image/demo/cms/banner2-4.png" alt="banner1"></a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="module tab-slider titleLine">
							<h3 class="modtitle">新品</h3>
							<div id="so_listing_tabs_2"
								class="so-listing-tabs first-load module">
								<div class="loadeding"></div>
								<div class="ltabs-wrap ">
									<div class="ltabs-tabs-container" data-delay="300"
										data-duration="600" data-effect="starwars" data-ajaxurl="#"
										data-type_source="0">
										<!--Begin Tabs-->
										<div class="ltabs-tabs-wrap">
											<span class="ltabs-tab-selected">Jewelry &amp; Watches
											</span> <span class="ltabs-tab-arrow">▼</span>
											<div class="item-sub-cat">
												<ul class="ltabs-tabs cf">
													<li class="ltabs-tab tab-sel" data-category-id="1"
														data-active-content=".items-category-1"><span
														class="ltabs-tab-label">${newCategory1.name }</span></li>
													<li class="ltabs-tab " data-category-id="2"
														data-active-content=".items-category-2"><span
														class="ltabs-tab-label">Electronics </span></li>
													<li class="ltabs-tab " data-category-id="3"
														data-active-content=".items-category-3"><span
														class="ltabs-tab-label">Sports &amp; Outdoors </span></li>
												</ul>
											</div>
										</div>
										<!-- End Tabs-->
									</div>
									<div class="ltabs-items-container">
										<!--Begin Items-->
										<div
											class="ltabs-items  ltabs-items-selected items-category-1 grid"
											data-total="10">
											<div class="ltabs-items-inner ltabs-slider ">
										<s:iterator value="#request.newProduct.list" var="productInfo">
										<div class="ltabs-item product-layout">
											<div class="product-item-container">
												<div class="left-block">
													<div class="product-image-container lazy second_img ">
														<s:iterator value="uploadfiles" var="uploadfile">
															<s:if test="#uploadfile.isCover ==1">
																<img
																	data-src="${RES}/upload/<s:property value="#uploadfile.path"/>"
																	src="" alt="Apple Cinema 30&quot;"
																	class="img-responsive" />
															</s:if>
														</s:iterator>
													</div>
													<!--Sale Label-->
													<span class="label label-new">NEW</span>
													<!--countdown box-->
													<div class="countdown_box"></div>
													<!--end countdown box-->

													<!--full quick view block-->
													<s:iterator value="uploadfiles" var="uploadfile">
														<s:if test="#uploadfile.isCover ==1">
															<a class="quickview iframe-link  visible-lg"
																title="${productInfo.getName() }"
																data-fancybox-type="iframe"
																href="${RES}/upload/<s:property value="#uploadfile.path"/>">
																Quickview</a>
														</s:if>
													</s:iterator>
													<!--end full quick view block-->
												</div>
												<div class="right-block">
													<div class="caption">
														<h4>
															<a
																href="${RES }/product/product_select.action?product.id=<s:property value="id"/>"><s:property
																	value="name" /></a>
														</h4>
														<div class="ratings">
															<div class="rating-box">
																<span class="fa fa-stack"><s:if test="#productInfo.star >=1"><i class="fa fa-star fa-stack-1x"></i></s:if><i class="fa fa-star-o fa-stack-1x"></i></span>
																<span class="fa fa-stack"><s:if test="#productInfo.star >=2"><i class="fa fa-star fa-stack-1x"></i></s:if><i class="fa fa-star-o fa-stack-1x"></i></span>
																<span class="fa fa-stack"><s:if test="#productInfo.star >=3"><i class="fa fa-star fa-stack-1x"></i></s:if><i class="fa fa-star-o fa-stack-1x"></i></span>
																<span class="fa fa-stack"><s:if test="#productInfo.star >=4"><i class="fa fa-star fa-stack-1x"></i></s:if><i class="fa fa-star-o fa-stack-1x"></i></span>
																<span class="fa fa-stack"><s:if test="#productInfo.star >=5"><i class="fa fa-star fa-stack-1x"></i></s:if><i class="fa fa-star-o fa-stack-1x"></i></span>
															</div>
														</div>

														<div class="price">
															<span class="price-new">￥<fmt:formatNumber value="${productInfo.sellprice }" minFractionDigits="2" maxFractionDigits="2"></fmt:formatNumber></span> <span
																class="price-old">￥<fmt:formatNumber
																	value="${productInfo.baseprice }" minFractionDigits="2"
																	maxFractionDigits="2"></fmt:formatNumber></span> <span
																class="label label-percent">-<fmt:formatNumber
																	value="${(productInfo.baseprice-productInfo.sellprice) / productInfo.baseprice *100}"
																	maxFractionDigits="2"></fmt:formatNumber>%
															</span>
														</div>
														<div class="description item-desc hidden">
															<p>
																<s:property value="description" />
															</p>
														</div>
													</div>

													<div class="button-group">
														<button class="addToCart" type="button"
															data-toggle="tooltip" title="Add to Cart"
															onclick="cart.add(<s:property value="id"/>);">
															<i class="fa fa-shopping-cart"></i> <span
																class="hidden-xs">加入购物车</span>
														</button>
														<a style="display:inline-block;padding: 7px 15px;"
															class="compare" type="button" data-toggle="tooltip"
															title="buy now"
															href="${RES }/product/product_select.action?product.id=${productInfo.id}"><i
															class="fa fa-exchange"></i> <span class="hidden-xs">立即购买</span></a>
													</div>
												</div>
												<!-- right block -->

											</div>

										</div>
										</s:iterator>
										</div>
										</div>
										<div class="ltabs-items  items-category-2 grid"
											data-total="11">

											<div class="ltabs-items-inner ltabs-slider ">
												<div class="ltabs-item product-layout">
													<div class="product-item-container">
														<div class="left-block">
															<div class="product-image-container second_img ">
																<img src="${RES}/image/demo/shop/product/e11.jpg"
																	alt="Apple Cinema 30&quot;" class="img-responsive" />
																<img src="${RES}/image/demo/shop/product/E3.jpg"
																	alt="Apple Cinema 30&quot;"
																	class="img_0 img-responsive" />
															</div>
															<!--Sale Label-->
															<span class="label label-sale">HOT</span>
															<!--full quick view block-->
															<a class="quickview iframe-link visible-lg"
																data-fancybox-type="iframe" href="#"> Quickview</a>
															<!--end full quick view block-->
														</div>
														<div class="right-block">
															<div class="caption">
																<h4>
																	<a href="product.html">Apple Cinema 30"</a>
																</h4>
																<div class="ratings">
																	<div class="rating-box">
																		<span class="fa fa-stack"><i
																			class="fa fa-star fa-stack-1x"></i><i
																			class="fa fa-star-o fa-stack-1x"></i></span> <span
																			class="fa fa-stack"><i
																			class="fa fa-star fa-stack-1x"></i><i
																			class="fa fa-star-o fa-stack-1x"></i></span> <span
																			class="fa fa-stack"><i
																			class="fa fa-star fa-stack-1x"></i><i
																			class="fa fa-star-o fa-stack-1x"></i></span> <span
																			class="fa fa-stack"><i
																			class="fa fa-star fa-stack-1x"></i><i
																			class="fa fa-star-o fa-stack-1x"></i></span> <span
																			class="fa fa-stack"><i
																			class="fa fa-star-o fa-stack-1x"></i></span>
																	</div>
																</div>

																<div class="price">
																	<span class="price-new">$50.00</span> <span
																		class="price-old">$62.00</span>
																</div>
															</div>

															<div class="button-group">
																<button class="addToCart" type="button"
																	data-toggle="tooltip" title="Add to Cart"
																	onclick="cart.add('42', '1');">
																	<i class="fa fa-shopping-cart"></i> <span class="">Add
																		to Cart</span>
																</button>
																<button class="wishlist" type="button"
																	data-toggle="tooltip" title="Add to Wish List"
																	onclick="wishlist.add('42');">
																	<i class="fa fa-heart"></i>
																</button>
																<button class="compare" type="button"
																	data-toggle="tooltip" title="Compare this Product"
																	onclick="compare.add('42');">
																	<i class="fa fa-exchange"></i>
																</button>
															</div>
														</div>
														<!-- right block -->
													</div>
												</div>
												<div class="ltabs-item product-layout">
													<div class="product-item-container">
														<div class="left-block">
															<div class="product-image-container second_img ">
																<img src="${RES}/image/demo/shop/product/141.jpg"
																	alt="Apple Cinema 30&quot;" class="img-responsive" />
																<img src="${RES}/image/demo/shop/product/11.jpg"
																	alt="Apple Cinema 30&quot;"
																	class="img_0 img-responsive" />
															</div>

															<!--full quick view block-->
															<a class="quickview iframe-link visible-lg"
																data-fancybox-type="iframe" href="#"> Quickview</a>
															<!--end full quick view block-->
														</div>
														<div class="right-block">
															<div class="caption">
																<h4>
																	<a href="product.html"> Canon EOS 5D</a>
																</h4>
																<div class="ratings">
																	<div class="rating-box">
																		<span class="fa fa-stack"><i
																			class="fa fa-star fa-stack-1x"></i><i
																			class="fa fa-star-o fa-stack-1x"></i></span> <span
																			class="fa fa-stack"><i
																			class="fa fa-star fa-stack-1x"></i><i
																			class="fa fa-star-o fa-stack-1x"></i></span> <span
																			class="fa fa-stack"><i
																			class="fa fa-star fa-stack-1x"></i><i
																			class="fa fa-star-o fa-stack-1x"></i></span> <span
																			class="fa fa-stack"><i
																			class="fa fa-star fa-stack-1x"></i><i
																			class="fa fa-star-o fa-stack-1x"></i></span> <span
																			class="fa fa-stack"><i
																			class="fa fa-star-o fa-stack-1x"></i></span>
																	</div>
																</div>

																<div class="price">
																	<span class="price-new">$60.00</span>
																</div>
															</div>

															<div class="button-group">
																<button class="addToCart" type="button"
																	data-toggle="tooltip" title="Add to Cart"
																	onclick="cart.add('42', '1');">
																	<i class="fa fa-shopping-cart"></i> <span class="">Add
																		to Cart</span>
																</button>
																<button class="wishlist" type="button"
																	data-toggle="tooltip" title="Add to Wish List"
																	onclick="wishlist.add('42');">
																	<i class="fa fa-heart"></i>
																</button>
																<button class="compare" type="button"
																	data-toggle="tooltip" title="Compare this Product"
																	onclick="compare.add('42');">
																	<i class="fa fa-exchange"></i>
																</button>
															</div>
														</div>
														<!-- right block -->
													</div>
												</div>
												<div class="ltabs-item product-layout">
													<div class="product-item-container">
														<div class="left-block">
															<div class="product-image-container second_img ">
																<img src="${RES}/image/demo/shop/product/35.jpg"
																	alt="Apple Cinema 30&quot;" class="img-responsive" />
																<img src="${RES}/image/demo/shop/product/34.jpg"
																	alt="Apple Cinema 30&quot;"
																	class="img_0 img-responsive" />
															</div>
															<!--Sale Label-->
															<span class="label label-sale">HOT</span>
															<!--full quick view block-->
															<a class="quickview iframe-link visible-lg"
																data-fancybox-type="iframe" href="#"> Quickview</a>
															<!--end full quick view block-->
														</div>
														<div class="right-block">
															<div class="caption">
																<h4>
																	<a href="product.html">Filet Mign</a>
																</h4>
																<div class="ratings">
																	<div class="rating-box">
																		<span class="fa fa-stack"><i
																			class="fa fa-star fa-stack-1x"></i><i
																			class="fa fa-star-o fa-stack-1x"></i></span> <span
																			class="fa fa-stack"><i
																			class="fa fa-star fa-stack-1x"></i><i
																			class="fa fa-star-o fa-stack-1x"></i></span> <span
																			class="fa fa-stack"><i
																			class="fa fa-star fa-stack-1x"></i><i
																			class="fa fa-star-o fa-stack-1x"></i></span> <span
																			class="fa fa-stack"><i
																			class="fa fa-star fa-stack-1x"></i><i
																			class="fa fa-star-o fa-stack-1x"></i></span> <span
																			class="fa fa-stack"><i
																			class="fa fa-star-o fa-stack-1x"></i></span>
																	</div>
																</div>

																<div class="price">
																	<span class="price-new">$97.00</span> <span
																		class="price-old">$122.00</span>
																</div>
															</div>

															<div class="button-group">
																<button class="addToCart" type="button"
																	data-toggle="tooltip" title="Add to Cart"
																	onclick="cart.add('42', '1');">
																	<i class="fa fa-shopping-cart"></i> <span class="">Add
																		to Cart</span>
																</button>
																<button class="wishlist" type="button"
																	data-toggle="tooltip" title="Add to Wish List"
																	onclick="wishlist.add('42');">
																	<i class="fa fa-heart"></i>
																</button>
																<button class="compare" type="button"
																	data-toggle="tooltip" title="Compare this Product"
																	onclick="compare.add('42');">
																	<i class="fa fa-exchange"></i>
																</button>
															</div>
														</div>
														<!-- right block -->
													</div>
												</div>
												<div class="ltabs-item product-layout">
													<div class="product-item-container">
														<div class="left-block">
															<div class="product-image-container second_img ">
																<img src="${RES}/image/demo/shop/product/E3_1.jpg"
																	alt="Apple Cinema 30&quot;" class="img-responsive" />
																<img src="${RES}/image/demo/shop/product/E3_3.jpg"
																	alt="Apple Cinema 30&quot;"
																	class="img_0 img-responsive" />
															</div>
															<!--Sale Label-->
															<span class="label label-sale">HOT</span>
															<!--full quick view block-->
															<a class="quickview iframe-link visible-lg"
																data-fancybox-type="iframe" href="#"> Quickview</a>
															<!--end full quick view block-->
														</div>
														<div class="right-block">
															<div class="caption">
																<h4>
																	<a href="product.html">HP LP3065</a>
																</h4>
																<div class="ratings">
																	<div class="rating-box">
																		<span class="fa fa-stack"><i
																			class="fa fa-star fa-stack-1x"></i><i
																			class="fa fa-star-o fa-stack-1x"></i></span> <span
																			class="fa fa-stack"><i
																			class="fa fa-star fa-stack-1x"></i><i
																			class="fa fa-star-o fa-stack-1x"></i></span> <span
																			class="fa fa-stack"><i
																			class="fa fa-star fa-stack-1x"></i><i
																			class="fa fa-star-o fa-stack-1x"></i></span> <span
																			class="fa fa-stack"><i
																			class="fa fa-star fa-stack-1x"></i><i
																			class="fa fa-star-o fa-stack-1x"></i></span> <span
																			class="fa fa-stack"><i
																			class="fa fa-star-o fa-stack-1x"></i></span>
																	</div>
																</div>

																<div class="price">
																	<span class="price-new">$60.00</span> <span
																		class="price-old">$100.00</span>
																</div>
															</div>

															<div class="button-group">
																<button class="addToCart" type="button"
																	data-toggle="tooltip" title="Add to Cart"
																	onclick="cart.add('42', '1');">
																	<i class="fa fa-shopping-cart"></i> <span class="">Add
																		to Cart</span>
																</button>
																<button class="wishlist" type="button"
																	data-toggle="tooltip" title="Add to Wish List"
																	onclick="wishlist.add('42');">
																	<i class="fa fa-heart"></i>
																</button>
																<button class="compare" type="button"
																	data-toggle="tooltip" title="Compare this Product"
																	onclick="compare.add('42');">
																	<i class="fa fa-exchange"></i>
																</button>
															</div>
														</div>
														<!-- right block -->
													</div>
												</div>

											</div>

										</div>
										<div class="ltabs-items items-category-3 grid" data-total="11">
											<div class="ltabs-items-inner ltabs-slider ">

												<div class="ltabs-item product-layout">
													<div class="product-item-container">
														<div class="left-block">
															<div class="product-image-container second_img ">
																<img src="${RES}/image/demo/shop/product/141.jpg"
																	alt="Apple Cinema 30&quot;" class="img-responsive" />
																<img src="${RES}/image/demo/shop/product/11.jpg"
																	alt="Apple Cinema 30&quot;"
																	class="img_0 img-responsive" />
															</div>

															<!--full quick view block-->
															<a class="quickview iframe-link visible-lg"
																data-fancybox-type="iframe" href="#"> Quickview</a>
															<!--end full quick view block-->
														</div>
														<div class="right-block">
															<div class="caption">
																<h4>
																	<a href="product.html"> Dail Lulpa</a>
																</h4>
																<div class="ratings">
																	<div class="rating-box">
																		<span class="fa fa-stack"><i
																			class="fa fa-star fa-stack-1x"></i><i
																			class="fa fa-star-o fa-stack-1x"></i></span> <span
																			class="fa fa-stack"><i
																			class="fa fa-star fa-stack-1x"></i><i
																			class="fa fa-star-o fa-stack-1x"></i></span> <span
																			class="fa fa-stack"><i
																			class="fa fa-star fa-stack-1x"></i><i
																			class="fa fa-star-o fa-stack-1x"></i></span> <span
																			class="fa fa-stack"><i
																			class="fa fa-star fa-stack-1x"></i><i
																			class="fa fa-star-o fa-stack-1x"></i></span> <span
																			class="fa fa-stack"><i
																			class="fa fa-star-o fa-stack-1x"></i></span>
																	</div>
																</div>

																<div class="price">
																	<span class="price-new">$78.00</span>
																</div>
															</div>

															<div class="button-group">
																<button class="addToCart" type="button"
																	data-toggle="tooltip" title="Add to Cart"
																	onclick="cart.add('42', '1');">
																	<i class="fa fa-shopping-cart"></i> <span class="">Add
																		to Cart</span>
																</button>
																<button class="wishlist" type="button"
																	data-toggle="tooltip" title="Add to Wish List"
																	onclick="wishlist.add('42');">
																	<i class="fa fa-heart"></i>
																</button>
																<button class="compare" type="button"
																	data-toggle="tooltip" title="Compare this Product"
																	onclick="compare.add('42');">
																	<i class="fa fa-exchange"></i>
																</button>
															</div>
														</div>
														<!-- right block -->
													</div>
												</div>
												<div class="ltabs-item product-layout">
													<div class="product-item-container">
														<div class="left-block">
															<div class="product-image-container second_img ">
																<img src="${RES}/image/demo/shop/product/B10.jpg"
																	alt="Apple Cinema 30&quot;" class="img-responsive" />
																<img src="${RES}/image/demo/shop/product/B9.jpg"
																	alt="Apple Cinema 30&quot;"
																	class="img_0 img-responsive" />
															</div>
															<!--Sale Label-->
															<span class="label label-sale">HOT</span>
															<!--full quick view block-->
															<a class="quickview iframe-link visible-lg"
																data-fancybox-type="iframe" href="#"> Quickview</a>
															<!--end full quick view block-->
														</div>
														<div class="right-block">
															<div class="caption">
																<h4>
																	<a href="product.html">Bint Beef</a>
																</h4>
																<div class="ratings">
																	<div class="rating-box">
																		<span class="fa fa-stack"><i
																			class="fa fa-star fa-stack-1x"></i><i
																			class="fa fa-star-o fa-stack-1x"></i></span> <span
																			class="fa fa-stack"><i
																			class="fa fa-star fa-stack-1x"></i><i
																			class="fa fa-star-o fa-stack-1x"></i></span> <span
																			class="fa fa-stack"><i
																			class="fa fa-star fa-stack-1x"></i><i
																			class="fa fa-star-o fa-stack-1x"></i></span> <span
																			class="fa fa-stack"><i
																			class="fa fa-star fa-stack-1x"></i><i
																			class="fa fa-star-o fa-stack-1x"></i></span> <span
																			class="fa fa-stack"><i
																			class="fa fa-star-o fa-stack-1x"></i></span>
																	</div>
																</div>

																<div class="price">
																	<span class="price-new">$97.00</span> <span
																		class="price-old">$122.00</span>
																</div>
															</div>

															<div class="button-group">
																<button class="addToCart" type="button"
																	data-toggle="tooltip" title="Add to Cart"
																	onclick="cart.add('42', '1');">
																	<i class="fa fa-shopping-cart"></i> <span class="">Add
																		to Cart</span>
																</button>
																<button class="wishlist" type="button"
																	data-toggle="tooltip" title="Add to Wish List"
																	onclick="wishlist.add('42');">
																	<i class="fa fa-heart"></i>
																</button>
																<button class="compare" type="button"
																	data-toggle="tooltip" title="Compare this Product"
																	onclick="compare.add('42');">
																	<i class="fa fa-exchange"></i>
																</button>
															</div>
														</div>
														<!-- right block -->
													</div>
												</div>
												<div class="ltabs-item product-layout">
													<div class="product-item-container">
														<div class="left-block">
															<div class="product-image-container second_img ">
																<img src="${RES}/image/demo/shop/product/w1.jpg"
																	alt="Apple Cinema 30&quot;" class="img-responsive" />
																<img src="${RES}/image/demo/shop/product/w10.jpg"
																	alt="Apple Cinema 30&quot;"
																	class="img_0 img-responsive" />
															</div>
															<!--Sale Label-->
															<span class="label label-sale">HOT</span>
															<!--full quick view block-->
															<a class="quickview iframe-link visible-lg"
																data-fancybox-type="iframe" href="#"> Quickview</a>
															<!--end full quick view block-->
														</div>
														<div class="right-block">
															<div class="caption">
																<h4>
																	<a href="product.html">Beef Bint</a>
																</h4>
																<div class="ratings">
																	<div class="rating-box">
																		<span class="fa fa-stack"><i
																			class="fa fa-star fa-stack-1x"></i><i
																			class="fa fa-star-o fa-stack-1x"></i></span> <span
																			class="fa fa-stack"><i
																			class="fa fa-star fa-stack-1x"></i><i
																			class="fa fa-star-o fa-stack-1x"></i></span> <span
																			class="fa fa-stack"><i
																			class="fa fa-star fa-stack-1x"></i><i
																			class="fa fa-star-o fa-stack-1x"></i></span> <span
																			class="fa fa-stack"><i
																			class="fa fa-star fa-stack-1x"></i><i
																			class="fa fa-star-o fa-stack-1x"></i></span> <span
																			class="fa fa-stack"><i
																			class="fa fa-star-o fa-stack-1x"></i></span>
																	</div>
																</div>

																<div class="price">
																	<span class="price-new">$90.00</span> <span
																		class="price-old">$100.00</span>
																</div>
															</div>

															<div class="button-group">
																<button class="addToCart" type="button"
																	data-toggle="tooltip" title="Add to Cart"
																	onclick="cart.add('42', '1');">
																	<i class="fa fa-shopping-cart"></i> <span class="">Add
																		to Cart</span>
																</button>
																<button class="wishlist" type="button"
																	data-toggle="tooltip" title="Add to Wish List"
																	onclick="wishlist.add('42');">
																	<i class="fa fa-heart"></i>
																</button>
																<button class="compare" type="button"
																	data-toggle="tooltip" title="Compare this Product"
																	onclick="compare.add('42');">
																	<i class="fa fa-exchange"></i>
																</button>
															</div>
														</div>
														<!-- right block -->
													</div>
												</div>
												<div class="ltabs-item product-layout">
													<div class="product-item-container">
														<div class="left-block">
															<div class="product-image-container second_img ">
																<img src="${RES}/image/demo/shop/product/B5.jpg"
																	alt="Apple Cinema 30&quot;" class="img-responsive" />
																<img src="${RES}/image/demo/shop/product/B10.jpg"
																	alt="Apple Cinema 30&quot;"
																	class="img_0 img-responsive" />
															</div>

															<!--full quick view block-->
															<a class="quickview iframe-link visible-lg"
																data-fancybox-type="iframe" href="#"> Quickview</a>
															<!--end full quick view block-->
														</div>
														<div class="right-block">
															<div class="caption">
																<h4>
																	<a href="product.html">Bint Beef</a>
																</h4>
																<div class="ratings">
																	<div class="rating-box">
																		<span class="fa fa-stack"><i
																			class="fa fa-star fa-stack-1x"></i><i
																			class="fa fa-star-o fa-stack-1x"></i></span> <span
																			class="fa fa-stack"><i
																			class="fa fa-star fa-stack-1x"></i><i
																			class="fa fa-star-o fa-stack-1x"></i></span> <span
																			class="fa fa-stack"><i
																			class="fa fa-star fa-stack-1x"></i><i
																			class="fa fa-star-o fa-stack-1x"></i></span> <span
																			class="fa fa-stack"><i
																			class="fa fa-star fa-stack-1x"></i><i
																			class="fa fa-star-o fa-stack-1x"></i></span> <span
																			class="fa fa-stack"><i
																			class="fa fa-star-o fa-stack-1x"></i></span>
																	</div>
																</div>

																<div class="price">
																	<span class="price-new">$97.00</span>
																</div>
															</div>

															<div class="button-group">
																<button class="addToCart" type="button"
																	data-toggle="tooltip" title="Add to Cart"
																	onclick="cart.add('42', '1');">
																	<i class="fa fa-shopping-cart"></i> <span class="">Add
																		to Cart</span>
																</button>
																<button class="wishlist" type="button"
																	data-toggle="tooltip" title="Add to Wish List"
																	onclick="wishlist.add('42');">
																	<i class="fa fa-heart"></i>
																</button>
																<button class="compare" type="button"
																	data-toggle="tooltip" title="Compare this Product"
																	onclick="compare.add('42');">
																	<i class="fa fa-exchange"></i>
																</button>
															</div>
														</div>
														<!-- right block -->
													</div>
												</div>
											</div>

										</div>
									</div>
									<!--End Items-->


								</div>

							</div>
						</div>

						<div class="module no-margin titleLine ">
							<h3 class="modtitle">COLLECTIONS</h3>
							<div class="modcontent clearfix">
								<div id="collections_block" class="clearfix  block">
									<ul class="width6">
										<li class="collect collection_0">
											<div class="color_co">
												<a href="#">Furniture</a>
											</div>
										</li>
										<li class="collect collection_1">
											<div class="color_co">
												<a href="#">Gift idea</a>
											</div>
										</li>
										<li class="collect collection_2">
											<div class="color_co">
												<a href="#">Cool gadgets</a>
											</div>
										</li>
										<li class="collect collection_3">
											<div class="color_co">
												<a href="#">Outdoor activities</a>
											</div>
										</li>
										<li class="collect collection_4">
											<div class="color_co">
												<a href="#">Accessories for</a>
											</div>
										</li>
										<li class="collect collection_5">
											<div class="color_co">
												<a href="#">Women world</a>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
			<!-- //Main Container -->
			<!-- Block Spotlight3  -->
			<section class="so-spotlight3">
				<div class="container">
					<div class="row">

						<div id="so_categories_173761471880018"
							class="so-categories module titleLine preset01-4 preset02-3 preset03-3 preset04-1 preset05-1">
							<h3 class="modtitle">Hot Categories</h3>

							<div class="wrap-categories">
								<div class="cat-wrap theme3">
									<div class="content-box">
										<div class="image-cat">
											<a href="#" title="Automotive" target="_blank"> <img
												src="${RES}/image/demo/shop/category/automotive-motocrycle.jpg"
												title="Automotive" alt="Automotive">
											</a> <a class="btn-viewmore hidden-xs" href="#" title="View more">View
												more</a>
										</div>
										<div class="inner">
											<div class="title-cat">
												<a href="#" title="Automotive " target="_blank">Automotive</a>
											</div>
											<div class="child-cat">
												<div class="child-cat-title">
													<a title="More Car Accessories" href="#" target="_blank">More
														Car Accessories </a>
												</div>
												<div class="child-cat-title">
													<a title="Car Alarms and Security" href="#" target="_blank">Car
														Alarms and Security </a>
												</div>
												<div class="child-cat-title">
													<a title="Car Audio &amp; Speakers" href="#"
														target="_blank">Car Audio &amp; Speakers </a>
												</div>
												<div class="child-cat-title">
													<a title="Gadgets &amp; Auto Parts" href="#"
														target="_blank">Gadgets &amp; Auto Parts </a>
												</div>
											</div>
										</div>
									</div>
									<div class="clr1"></div>
									<div class="content-box">
										<div class="image-cat">
											<a href="#" title="Automotive" target="_blank"> <img
												src="${RES}/image/demo/shop/category/health-beauty.jpg"
												title="Automotive" alt="Automotive">
											</a> <a class="btn-viewmore hidden-xs" href="#" title="View more">View
												more</a>
										</div>

										<div class="inner">
											<div class="title-cat">
												<a href="#" title="Health & Beauty" target="_blank">Health
													& Beauty</a>
											</div>
											<div class="child-cat">
												<div class="child-cat-title">
													<a title="More Car Accessories" href="#" target="_blank">Salon
														& Spa Equipment </a>
												</div>
												<div class="child-cat-title">
													<a title="Car Alarms and Security" href="#" target="_blank">Fragrances
													</a>
												</div>
												<div class="child-cat-title">
													<a title="Car Audio &amp; Speakers" href="#"
														target="_blank">Shaving & Hair Removal.. </a>
												</div>
												<div class="child-cat-title">
													<a title="Gadgets &amp; Auto Parts" href="#"
														target="_blank">Bath & Body </a>
												</div>
											</div>
										</div>
									</div>
									<div class="clr1 clr2"></div>
									<div class="content-box">
										<div class="image-cat">
											<a href="#" title="Automotive" target="_blank"> <img
												src="${RES}/image/demo/shop/category/bags-holiday-supplies-gifts.jpg"
												title="Automotive" alt="Automotive">
											</a> <a class="btn-viewmore hidden-xs" href="#" title="View more">View
												more</a>
										</div>

										<div class="inner">
											<div class="title-cat">
												<a href="#" title="Health & Beauty" target="_blank">Bags,
													Holiday Supplies</a>
											</div>
											<div class="child-cat">
												<div class="child-cat-title">
													<a title="More Car Accessories" href="#" target="_blank">Gift
														& Lifestyle Gadgets.. </a>
												</div>
												<div class="child-cat-title">
													<a title="Car Alarms and Security" href="#" target="_blank">Lighter
														& Cigar Supplies.. </a>
												</div>
												<div class="child-cat-title">
													<a title="Car Audio &amp; Speakers" href="#"
														target="_blank">Gift for Woman </a>
												</div>
												<div class="child-cat-title">
													<a title="Gadgets &amp; Auto Parts" href="#"
														target="_blank">Gift for Man </a>
												</div>
											</div>
										</div>
									</div>
									<div class="clr1 clr3"></div>
									<div class="content-box">
										<div class="image-cat">
											<a href="#" title="Automotive" target="_blank"> <img
												src="${RES}/image/demo/shop/category/toys-hobbies.jpg"
												title="Automotive" alt="Automotive">
											</a> <a class="btn-viewmore hidden-xs" href="#" title="View more">View
												more</a>
										</div>

										<div class="inner">
											<div class="title-cat">
												<a href="#" title="Health & Beauty" target="_blank">Toys
													& Hobbies</a>
											</div>
											<div class="child-cat">
												<div class="child-cat-title">
													<a title="More Car Accessories" href="#" target="_blank">Helicopters
														& Parts </a>
												</div>
												<div class="child-cat-title">
													<a title="Car Alarms and Security" href="#" target="_blank">RC
														Cars & Parts </a>
												</div>
												<div class="child-cat-title">
													<a title="Car Audio &amp; Speakers" href="#"
														target="_blank">FPV System & Parts </a>
												</div>
												<div class="child-cat-title">
													<a title="Gadgets &amp; Auto Parts" href="#"
														target="_blank">Walkera </a>
												</div>
											</div>
										</div>
									</div>
									<div class="clr1 clr2 clr4"></div>
									<div class="content-box">
										<div class="image-cat">
											<a href="#" title="Automotive" target="_blank"> <img
												src="${RES}/image/demo/shop/category/electronics.jpg"
												title="Automotive" alt="Automotive">
											</a> <a class="btn-viewmore hidden-xs" href="#" title="View more">View
												more</a>
										</div>

										<div class="inner">
											<div class="title-cat">
												<a href="#" title="Health & Beauty" target="_blank">Electronics</a>
											</div>
											<div class="child-cat">
												<div class="child-cat-title">
													<a title="More Car Accessories" href="#" target="_blank">Home
														Audio</a>
												</div>
												<div class="child-cat-title">
													<a title="Car Alarms and Security" href="#" target="_blank">Mp3
														Players & Accessories.. </a>
												</div>
												<div class="child-cat-title">
													<a title="Car Audio &amp; Speakers" href="#"
														target="_blank">Headphones, Headsets</a>
												</div>
												<div class="child-cat-title">
													<a title="Gadgets &amp; Auto Parts" href="#"
														target="_blank">Battereries & Chargers.. </a>
												</div>
											</div>
										</div>
									</div>
									<div class="clr1 clr5"></div>
									<div class="content-box">
										<div class="image-cat">
											<a href="#" title="Automotive" target="_blank"> <img
												src="${RES}/image/demo/shop/category/jewelry-watches.jpg"
												title="Automotive" alt="Automotive">
											</a> <a class="btn-viewmore hidden-xs" href="#" title="View more">View
												more</a>
										</div>

										<div class="inner">
											<div class="title-cat">
												<a href="#" title="Health & Beauty" target="_blank">Jewelry
													& Watches</a>
											</div>
											<div class="child-cat">
												<div class="child-cat-title">
													<a title="More Car Accessories" href="#" target="_blank">Men
														Watches </a>
												</div>
												<div class="child-cat-title">
													<a title="Car Alarms and Security" href="#" target="_blank">Wedding
														Rings </a>
												</div>
												<div class="child-cat-title">
													<a title="Car Audio &amp; Speakers" href="#"
														target="_blank">Earings </a>
												</div>
											</div>
										</div>
									</div>
									<div class="clr1 clr2 clr3 clr6"></div>
									<div class="content-box">
										<div class="image-cat">
											<a href="#" title="Automotive" target="_blank"> <img
												src="${RES}/image/demo/shop/category/sports-outdoors.jpg"
												title="Automotive" alt="Automotive">
											</a> <a class="btn-viewmore hidden-xs" href="#" title="View more">View
												more</a>
										</div>

										<div class="inner">
											<div class="title-cat">
												<a href="#" title="Health & Beauty" target="_blank">Sports
													& Outdoors</a>
											</div>
											<div class="child-cat">
												<div class="child-cat-title">
													<a title="More Car Accessories" href="#" target="_blank">Outdoor
														& Traveling </a>
												</div>
												<div class="child-cat-title">
													<a title="Car Alarms and Security" href="#" target="_blank">Camping
														& Hiking </a>
												</div>
												<div class="child-cat-title">
													<a title="Car Audio &amp; Speakers" href="#"
														target="_blank">Golf Supplies </a>
												</div>
												<div class="child-cat-title">
													<a title="Gadgets &amp; Auto Parts" href="#"
														target="_blank">Fishing </a>
												</div>
											</div>
										</div>
									</div>
									<div class="clr1"></div>
									<div class="content-box">
										<div class="image-cat">
											<a href="#" title="Automotive" target="_blank"> <img
												src="${RES}/image/demo/shop/category/smartphone-tablets.jpg"
												title="Automotive" alt="Automotive">
											</a> <a class="btn-viewmore hidden-xs" href="#" title="View more">View
												more</a>
										</div>

										<div class="inner">
											<div class="title-cat">
												<a href="#" title="Health & Beauty" target="_blank">Smartphone
													& Tablets</a>
											</div>
											<div class="child-cat">
												<div class="child-cat-title">
													<a title="More Car Accessories" href="#" target="_blank">Accessories
														for iPhone </a>
												</div>
												<div class="child-cat-title">
													<a title="Car Audio &amp; Speakers" href="#"
														target="_blank">Accessories for i Pad </a>
												</div>
												<div class="child-cat-title">
													<a title="Gadgets &amp; Auto Parts" href="#"
														target="_blank">Accessories for Tablet PC </a>
												</div>
											</div>
										</div>
									</div>
									<div class="clr1 clr2 clr4"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- //Block Spotlight3  -->
			<script type="text/javascript"><!--
	var $typeheader = 'header-home1';
	//-->
</script>

			<!-- Footer Container -->
			<footer class="footer-container">
				<!-- Footer Top Container -->
				<section class="footer-top">
					<div class="container content">
						<div class="row">
							<div class="col-sm-6 col-md-3 box-information">
								<div class="module clearfix">
									<h3 class="modtitle">Information</h3>
									<div class="modcontent">
										<ul class="menu">
											<li><a href="#">About Us</a></li>
											<li><a href="#">FAQ</a></li>
											<li><a href="#">Order history</a></li>
											<li><a href="#">Order information</a></li>
										</ul>
									</div>
								</div>
							</div>

							<div class="col-sm-6 col-md-3 box-service">
								<div class="module clearfix">
									<h3 class="modtitle">Customer Service</h3>
									<div class="modcontent">
										<ul class="menu">
											<li><a href="#">Contact Us</a></li>
											<li><a href="#">Returns</a></li>
											<li><a href="#">Site Map</a></li>
											<li><a href="#">My Account</a></li>
										</ul>
									</div>
								</div>
							</div>

							<div class="col-sm-6 col-md-3 box-account">
								<div class="module clearfix">
									<h3 class="modtitle">My Account</h3>
									<div class="modcontent">
										<ul class="menu">
											<li><a href="#">Brands</a></li>
											<li><a href="#">Gift Vouchers</a></li>
											<li><a href="#">Affiliates</a></li>
											<li><a href="#">Specials</a></li>
											<li><a href="#" target="_blank">Our Blog</a></li>
										</ul>
									</div>
								</div>
							</div>

							<div class="col-sm-6 col-md-3 collapsed-block ">
								<div class="module clearfix">
									<h3 class="modtitle">Contact Us</h3>
									<div class="modcontent">
										<ul class="contact-address">
											<li><span class="fa fa-map-marker"></span> My Company,
												42 avenue des Champs Elysées 75000 Paris France</li>
											<li><span class="fa fa-envelope-o"></span> Email: <a
												href="#"> sales@yourcompany.com</a></li>
											<li><span class="fa fa-phone">&nbsp;</span> Phone 1:
												0123456789 <br>Phone 2: (123) 4567890</li>
										</ul>
									</div>
								</div>
							</div>

							<div class="col-sm-12 collapsed-block footer-links">
								<div class="module clearfix">
									<div class="modcontent">
										<hr class="footer-lines">
										<div class="footer-directory-title">
											<h4 class="label-link">Top Stores : Brand Directory |
												Store Directory</h4>
											<ul class="footer-directory">
												<li>
													<h4>MOST SEARCHED KEYWORDS MARKET:</h4> <a href="#">Xiaomi
														Mi3</a> | <a href="#">Digiflip Pro XT 712 Tablet</a> | <a
													href="#">Mi 3 Phones</a> | <a href="#">View all</a>
												</li>
												<li>
													<h4>MOBILES:</h4> <a href="#">Moto E</a> | <a href="#">Samsung
														Mobile</a> | <a href="#">Micromax Mobile</a> | <a href="#">Nokia
														Mobile</a> | <a href="#">HTC Mobile</a> | <a href="#">Sony
														Mobile</a> | <a href="#">Apple Mobile</a> | <a href="#">LG
														Mobile</a> | <a href="#">Karbonn Mobile</a> | <a href="#">View
														all</a>
												</li>
												<li>
													<h4>CAMERA:</h4> <a href="#">Nikon Camera</a> | <a href="#">Canon
														Camera</a> | <a href="#">Sony Camera</a> | <a href="#">Samsung
														Camera</a> | <a href="#">Point shoot camera</a> | <a href="#">Camera
														Lens</a> | <a href="#">Camera Tripod</a> | <a href="#">Camera
														Bag</a> | <a href="#">View all</a>
												</li>
												<li>
													<h4>LAPTOPS:</h4> <a href="#">Apple Laptop</a> | <a
													href="#">Acer Laptop</a> | <a href="#">Sony Laptop</a> | <a
													href="#">Dell Laptop</a> | <a href="#">Asus Laptop</a> | <a
													href="#">Toshiba Laptop</a> | <a href="#">LG Laptop</a> | <a
													href="#">HP Laptop</a> | <a href="#">Notebook</a> | <a
													href="#">View all</a>
												</li>
												<li>
													<h4>TVS:</h4> <a href="#">Sony TV</a> | <a href="#">Samsung
														TV</a> | <a href="#">LG TV</a> | <a href="#">Panasonic TV</a>
													| <a href="#">Onida TV</a> | <a href="#">Toshiba TV</a> | <a
													href="#">Philips TV</a> | <a href="#">Micromax TV</a> | <a
													href="#">LED TV</a> | <a href="#">LCD TV</a> | <a href="#">Plasma
														TV</a> | <a href="#">3D TV</a> | <a href="#">Smart TV</a> | <a
													href="#">View all</a>
												</li>
												<li>
													<h4>TABLETS:</h4> <a href="#">Micromax Tablets</a> | <a
													href="#">HCL Tablets</a> | <a href="#">Samsung Tablets</a>
													| <a href="#">Lenovo Tablets</a> | <a href="#">Karbonn
														Tablets</a> | <a href="#">Asus Tablets</a> | <a href="#">Apple
														Tablets</a> | <a href="#">View all</a>
												</li>
												<li>
													<h4>WATCHES:</h4> <a href="#">FCUK Watches</a> | <a
													href="#">Titan Watches</a> | <a href="#">Casio Watches</a>
													| <a href="#">Fastrack Watches</a> | <a href="#">Timex
														Watches</a> | <a href="#">Fossil Watches</a> | <a href="#">Diesel
														Watches</a> | <a href="#">Luxury Watches</a> | <a href="#">View
														all</a>
												</li>
												<li>
													<h4>CLOTHING:</h4> <a href="#">Shirts</a> | <a href="#">Jeans</a>
													| <a href="#">T shirts</a> | <a href="#">Kurtis</a> | <a
													href="#">Sarees</a> | <a href="#">Levis Jeans</a> | <a
													href="#">Killer Jeans</a> | <a href="#">Pepe Jeans</a> | <a
													href="#">Arrow Shirts</a> | <a href="#">Ethnic Wear</a> | <a
													href="#">Formal Shirts</a> | <a href="#">Peter England
														Shirts</a> | <a href="#">View all</a>
												</li>
												<li>
													<h4>FOOTWEAR:</h4> <a href="#">Shoes</a> | <a href="#">Casual
														Shoes</a> | <a href="#">Adidas Shoes</a> | <a href="#">Gas
														Shoes</a> | <a href="#">Puma Shoes</a> | <a href="#">Reebok
														Shoes</a> | <a href="#">Woodland Shoes</a> | <a href="#">Red
														tape Shoes</a> | <a href="#">Nike Shoes</a> | <a href="#">View
														all</a>
												</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
				<!-- /Footer Top Container -->

				<!-- Footer Bottom Container -->
				<div class="footer-bottom-block ">
					<div class=" container">
						<div class="row">
							<div class="col-sm-5 copyright-text">
								Copyright &copy; 2017.Company name All rights reserved.<a
									target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a>
							</div>
							<div class="col-sm-7">
								<div class="block-payment text-right">
									<img src="${RES}/image/demo/content/payment.png" alt="payment"
										title="payment">
								</div>
							</div>
							<!--Back To Top-->
							<div class="back-to-top">
								<i class="fa fa-angle-up"></i><span> Top </span>
							</div>

						</div>
					</div>
				</div>
				<!-- /Footer Bottom Container -->


			</footer>
			<!-- //end Footer Container -->

		</div>

		<link rel='stylesheet' property='stylesheet'
			href='${RES }/css/themecss/cpanel.css' type='text/css' media='all' />

		<!-- Preloading Screen -->
		<div id="loader-wrapper">
			<div id="loader"></div>
			<div class="loader-section section-left"></div>
			<div class="loader-section section-right"></div>
		</div>
		<!-- End Preloading Screen -->

		<!-- Include Libs & Plugins
============================================ -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script type="text/javascript" src="${RES}/js/jquery-2.2.4.min.js"></script>
		<script type="text/javascript" src="${RES}/js/bootstrap.min.js"></script>
		<script type="text/javascript"
			src="${RES}/js/owl-carousel/owl.carousel.js"></script>
		<script type="text/javascript" src="${RES}/js/themejs/libs.js"></script>
		<script type="text/javascript" src="${RES}/js/unveil/jquery.unveil.js"></script>
		<script type="text/javascript"
			src="${RES}/js/countdown/jquery.countdown.min.js"></script>
		<script type="text/javascript"
			src="${RES}/js/dcjqaccordion/jquery.dcjqaccordion.2.8.min.js"></script>
		<script type="text/javascript"
			src="${RES}/js/datetimepicker/moment.js"></script>
		<script type="text/javascript"
			src="${RES}/js/datetimepicker/bootstrap-datetimepicker.min.js"></script>
		<script type="text/javascript"
			src="${RES}/js/jquery-ui/jquery-ui.min.js"></script>


		<!-- Theme files
============================================ -->
		<script type="text/javascript" src="${RES}/js/themejs/application.js"></script>
		<script type="text/javascript" src="${RES}/js/themejs/toppanel.js"></script>
		<script type="text/javascript" src="${RES}/js/themejs/so_megamenu.js"></script>
		<script type="text/javascript" src="${RES}/js/themejs/addtocart.js"></script>
		<script type="text/javascript" src="${RES}/js/themejs/cpanel.js"></script>
</body>
</html>

