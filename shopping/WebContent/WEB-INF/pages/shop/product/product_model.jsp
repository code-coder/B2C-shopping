<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="products-list row grid">
<s:iterator value="pageModel.list" var="productInfo">
	<div class="product-layout col-md-4 col-sm-6 col-xs-12 ">
		<div class="product-item-container">
			<div class="left-block">
				<div class="product-image-container second_img ">
				<s:iterator value="uploadfiles" var="uploadfile">
					<s:if test="#uploadfile.isCover ==1">
					<img data-src="${RES}/upload/<s:property value="#uploadfile.path"/>" src="${RES}/upload/<s:property value="#uploadfile.path"/>"  alt="Apple Cinema 30&quot;" class="img-responsive" />
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
<s:url var="first">
        <s:param name="pageNo" value="1"></s:param>
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

      <s:include value="/WEB-INF/pages/common/page.jsp"></s:include>
      
      <script type="text/javascript" src="${RES}/js/themejs/application.js"></script>
