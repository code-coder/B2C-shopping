<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:if test="productCategory.name !=null">${productCategory.getName()}</s:if><s:else>搜索结果</s:else></title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
	<!-- 设置分页的url -->
	<s:url var="first">
        <s:param name="pageNo" value="1"></s:param>
        <s:param name="productCategory.id" value="productCategory.id"></s:param>
        <s:param name="Searchword" value="Searchword"></s:param>
        <s:param name="minPrice" value="minPrice"></s:param>
        <s:param name="maxPrice" value="maxPrice"></s:param>
      </s:url>
      <s:url var="page2">
        <s:param name="pageNo" value="2"></s:param>
        <s:param name="productCategory.id" value="productCategory.id"></s:param>
        <s:param name="Searchword" value="Searchword"></s:param>
        <s:param name="minPrice" value="minPrice"></s:param>
        <s:param name="maxPrice" value="maxPrice"></s:param>
      </s:url>
      <s:url var="previous">
        <s:param name="pageNo" value="pageModel.pageNo-1"></s:param>
        <s:param name="productCategory.id" value="productCategory.id"></s:param>
        <s:param name="Searchword" value="Searchword"></s:param>
        <s:param name="minPrice" value="minPrice"></s:param>
        <s:param name="maxPrice" value="maxPrice"></s:param>
      </s:url>
      <s:url var="last">
        <s:param name="pageNo" value="pageModel.bottomPageNo"></s:param>
        <s:param name="productCategory.id" value="productCategory.id"></s:param>
        <s:param name="Searchword" value="Searchword"></s:param>
        <s:param name="minPrice" value="minPrice"></s:param>
        <s:param name="maxPrice" value="maxPrice"></s:param>
      </s:url>
      <s:url var="next">
        <s:param name="pageNo" value="pageModel.pageNo+1"></s:param>
        <s:param name="productCategory.id" value="productCategory.id"></s:param>
        <s:param name="Searchword" value="Searchword"></s:param>
        <s:param name="minPrice" value="minPrice"></s:param>
        <s:param name="maxPrice" value="maxPrice"></s:param>
      </s:url>
<body class="res layout-subpage banners-effect-6">

	<s:include value="../../common/header.jsp"></s:include>

<!-- Navbar switcher -->
<!-- //end Navbar switcher -->
	</header>
	<!-- //Header Container  -->
	<!-- Main Container  -->
	<div class="main-container container">
		<ul class="breadcrumb">
			<li><a href="${RES }/"><i class="fa fa-home"></i></a></li>
			<s:if test="productCategory.name !=null">
			<li><a href="javascript:;">${productCategory.getSecondcategory().getCategory().getName() }</a></li>
			<li><a href="javascript:;">${productCategory.getSecondcategory().getName() }</a></li>
			<li><a href="#">${productCategory.getName() }</a></li>
			</s:if>
			<s:else>
			<li><a href="#">搜索结果</a></li>
			</s:else>
		</ul>
		
		<input type="hidden" id="productCategoryId" value="${productCategory.getId() }">
		<input type="hidden" id="pageNo" value="${pageNo}">
		<div class="row">
<!--Left Part Start -->
<s:include value="../common/menu.jsp"></s:include>

			<!--Middle Part Start-->
			<div id="content" class="col-md-9 col-sm-8">
				<div class="products-category">
					<div class="category-derc">
						<div class="row">
							<div class="col-sm-12">
								<div class="banners">
									<div>
										<a  href="#"><img src="${RES}/image/demo/shop/category/electronic-cat.png" alt="Apple Cinema 30&quot;"><br></a>
									</div>
								</div>
							
							</div>
						</div>
					</div>
					<!-- Filters -->
					<div class="product-filter filters-panel">
						<div class="row">
							<div class="col-md-2 visible-lg">
								<div class="view-mode">
									<div class="list-view">
										<button class="btn btn-default grid active" data-view="grid" data-toggle="tooltip"  data-original-title="Grid"><i class="fa fa-th"></i></button>
										<button class="btn btn-default list" data-view="list" data-toggle="tooltip" data-original-title="List"><i class="fa fa-th-list"></i></button>
									</div>
								</div>
							</div>
							<div class="short-by-show form-inline text-right col-md-7 col-sm-8 col-xs-12">
								<div class="form-group short-by">
									<label class="control-label" for="input-sort">选择排序:</label>
									<select id="input-sort" name="sort" class="form-control" onchange="sortByCondition()">
										<option value="综合推荐" selected="selected">综合推荐 </option>
										<option value="价格低">价格 (低 &gt; 高)</option>
										<option value="销量高 ">销量 (高 &gt; 低)</option>
										<option value="点击量高">评价(高 &gt; 低)</option>
									</select>
								</div>
								<div class="form-group">
									<label class="control-label" for="input-limit">显示:</label>
									<select id="input-limit" name="limit" class="form-control" onchange="sortByCondition()">
										<option value="9" selected="selected">9</option>
										<option value="18">18</option>
										<option value="27">27</option>
										<option value="54">54</option>
										<option value="108">108</option>
									</select>
								</div>
							</div>
							<div class="box-pagination col-md-3 col-sm-4 col-xs-12 text-right">
								<ul class="pagination">
									<li><a href="${first }">1</a></li>
									<li><a href="${page2 }">2</a></li>
									<li><a href="${next }">&gt;</a></li>
									<li><a href="${last }">&gt;|</a></li>
								</ul>
							</div>
						</div>
					</div>
					<!-- //end Filters -->
					<!--changed listings-->
<div id="products-list">
<div class="products-list row grid">
<s:iterator value="pageModel.list" var="productInfo">
	<div class="product-layout col-md-4 col-sm-6 col-xs-12 ">
		<div class="product-item-container">
			<div class="left-block">
				<div class="product-image-container lazy second_img ">
				<s:iterator value="uploadfiles" var="uploadfile">
					<s:if test="#uploadfile.isCover ==1">
					<img data-src="${RES}/upload/<s:property value="#uploadfile.path"/>" src=""  alt="Apple Cinema 30&quot;" class="img-responsive" />
					</s:if>
				</s:iterator>
				</div>
				<!--Sale Label-->
				<span class="label label-sale">Sale</span>
				<!--countdown box-->
				<div class="countdown_box">

</div>
				<!--end countdown box-->
				
				<!--full quick view block-->
				<s:iterator value="uploadfiles" var="uploadfile">
					<s:if test="#uploadfile.isCover ==1">
						<a class="quickview iframe-link  visible-lg" title="${productInfo.getName() }" data-fancybox-type="iframe"  href="${RES}/upload/<s:property value="#uploadfile.path"/>">  Quickview</a>
					</s:if>
					</s:iterator>
				<!--end full quick view block-->
			</div>
			<div class="right-block">
				<div class="caption">
					<h4><a href="${RES }/product/product_select.action?product.id=<s:property value="id"/>"><s:property value="name" /></a></h4>		
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
						<span class="price-new">￥<fmt:formatNumber value="${productInfo.sellprice }" minFractionDigits="2" maxFractionDigits="2"></fmt:formatNumber></span> 
						<span class="price-old">￥<fmt:formatNumber value="${productInfo.baseprice }" minFractionDigits="2" maxFractionDigits="2"></fmt:formatNumber></span>		 
						<span class="label label-percent">-<fmt:formatNumber value="${(productInfo.baseprice-productInfo.sellprice) / productInfo.baseprice *100}" maxFractionDigits="2"></fmt:formatNumber>%</span>    
					</div>
					<div class="description item-desc hidden">
						<p><s:property value="description" /></p>
					</div>
				</div>
				
				  <div class="button-group">
					<button class="addToCart" type="button" data-toggle="tooltip" title="Add to Cart" onclick="cart.add(<s:property value="id"/>);"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs">加入购物车</span></button>
					<a style="display:inline-block;padding: 7px 15px;" class="compare" type="button" data-toggle="tooltip" title="buy now" href="${RES }/product/product_select.action?product.id=${productInfo.id}"><i class="fa fa-exchange"></i> <span class="hidden-xs">立即购买</span></a>
				  </div>
			</div><!-- right block -->

		</div>
	</div>
	<div class="clearfix visible-xs-block"></div>
	</s:iterator>
	
	
</div>					
<!--// End Changed listings-->
					
<!-- Filters -->
<%-- 					<div class="product-filter product-filter-bottom filters-panel" >
						<div class="row">
							<div class="col-md-2 hidden-sm hidden-xs">
							</div>
						   <div class="short-by-show text-center col-md-7 col-sm-8 col-xs-12">
								<div class="form-group" style="margin: 7px 10px">Showing 1 to 9 of 10 (2 Pages)</div>
							</div>
							<div class="box-pagination col-md-3 col-sm-4 text-right"><ul class="pagination"><li class="active"><span>1</span></li><li><a href="#">2</a></li><li><a href="#">&gt;</a></li><li><a href="#">&gt;|</a></li></ul></div>		
						 </div>
					</div> --%>


      <s:include value="/WEB-INF/pages/common/page.jsp"></s:include>
      </div>
<!-- //end Filters -->
				</div>
			</div>
		</div>
		<!--Middle Part End-->
	</div>
	<!-- //Main Container -->
<s:include value="../../common/footer.jsp"></s:include>

</body>
</html>
