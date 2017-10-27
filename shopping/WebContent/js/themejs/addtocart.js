/* -------------------------------------------------------------------------------- /
	
	Magentech jQuery
	Created by Magentech
	v1.0 - 20.9.2016
	All rights reserved.
	
/ -------------------------------------------------------------------------------- */

// Cart add remove functions
var cart = {
	'add' : function(product_id) {
		var cid = $("#cid").val();
		var amount = $("#amount").val();
		if(amount==null || amount==0)
			amount =1;
		var isValiable = $("#isValiable").val();
		console.log(cid);
		if (cid == 0 || cid == null) {
			addProductNotice(
					'加入购物车失败',
					'请登录！',
					'<a href="/shopping/customer/customer_toLogin.action">点此登录</a></br>',
					'error');
		} else {
			if (isValiable == "no") {
				addProductNotice(
						'加入购物车失败',
						'商品库存不够',
						'',
						'error');
			} else {
				$.ajax({
					type : "GET",
					url : '/shopping/customer/cart/customer_cart_addItem',
					data : {
						"cartitem.product.id" : product_id,
						"cartitem.amount" : amount
					},
					error : errorFunction, // 错误执行方法
					success : succFunction
				// 成功执行方法
				});
				function errorFunction() {

				}
				function succFunction(info) {
					addProductNotice('成功加入购物车',
							'<img src="/shopping/upload/file1.jpg" alt="">',
							'成功加入购物车！', 'success');
				}
			}
		}
	}
}

var wishlist = {
	'add' : function(product_id) {
		addProductNotice(
				'Product added to Wishlist',
				'<img src="image/demo/shop/product/e11.jpg" alt="">',
				'<h3>You must <a href="#">login</a>  to save <a href="#">Apple Cinema 30"</a> to your <a href="#">wish list</a>!</h3>',
				'success');
	}
}

/*
 * --------------------------------------------------- jGrowl jQuery alerts and
 * message box --------------------------------------------------
 */
function addProductNotice(title, thumb, text, type) {
	$.jGrowl.defaults.closer = false;
	// Stop jGrowl
	// $.jGrowl.defaults.sticky = true;
	var tpl = thumb + '<h3>' + text + '</h3>';
	$.jGrowl(tpl, {
		life : 4000,
		header : title,
		speed : 'slow',
		theme : type
	});
}

function limitPageSize(obj) {
	var productCategoryId = $("#productCategoryId").val();
	var pageNo = $("#pageNo").val();
	var pageSize = $("#input-limit option:selected").val();
	var url = "/shopping/product/product_findByCategoryId.action";
	$.ajax({
		type : "GET",
		url : url,
		data : {
			"productCategory.id" : productCategoryId,
			"pageNo" : pageNo,
			"pageSize" : pageSize
		},
		error : errorFunction, // 错误执行方法
		success : succFunction
	// 成功执行方法
	});
	function errorFunction() {

	}
	function succFunction(info) {
		var productListElement = $("#products-list");
		productListElement.empty();
		productListElement.append(info);
	}
}

function sortByCondition() {
	var productCategoryId = $("#productCategoryId").val();
	var pageNo = $("#pageNo").val();
	var condition = $("#input-sort option:selected").val();
	var pageSize = $("#input-limit option:selected").val();
	var url = "/shopping/product/product_";
	switch (condition) {
	case "综合推荐":
		url += "orderByDefault.action";
		break;
	case "价格低":
		url += "orderBySellprice.action";
		break;
	case "点击量高":
		url += "orderByClickcount.action";
		break;
	case "销量高":
		url += "orderBySellcount.action";
		break;
	}
	$.ajax({
		type : "GET",
		url : url,
		data : {
			"productCategory.id" : productCategoryId,
			"pageNo" : pageNo,
			"pageSize" : pageSize
		},
		error : errorFunction, // 错误执行方法
		success : succFunction
	// 成功执行方法
	});
	function errorFunction() {

	}
	function succFunction(info) {
		var productListElement = $("#products-list");
		productListElement.empty();
		productListElement.append(info);
	}
}

function buy(product_id) {
	var cid = $("#cid").val();
	var amount = $("#amount").val();
	if (cid == 0 || cid == null) {
		addProductNotice(
				'购买失败',
				'请登录！',
				'<a href="/shopping/customer/customer_toLogin.action">点此登录</a></br>',
				'error');
	} else {
		var url = '/shopping/customer/order/customer_order_checkOrderFromDirectBuy.action';
		url += "?orderitem.product.id=" + product_id;
		url += "&orderitem.amount=" + amount;
		window.location.href = url;
	}
}
