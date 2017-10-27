<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<aside class="col-sm-4 col-md-3" id="column-left">
<s:if test="category != null">
	<div class="module menu-category titleLine">
		<h3 class="modtitle">${category.getName() }</h3>
		<div class="modcontent">
			<div class="box-category">
				<ul id="cat_accordion" class="list-group">
				<s:iterator value="category.secondcategories" var="secondcategory">
					<li class="hadchild" style="display:block">
						<a href="javascript:;"class="cutom-parent">${secondcategory.getName()}</a> 
						<s:if test="#secondcategory.productcategories.size()>0">
						<span class="button-view  fa fa-plus-square-o"></span>
						</s:if>
						<ul >
							<s:iterator value="#secondcategory.productcategories" var="productcategory">
							<li><a href="${RES }/product/product_findByCategoryId.action?productCategory.id=${productcategory.getId()}">${productcategory.getName() }</a></li>
							</s:iterator>
						</ul>
					</li>
				</s:iterator>
				</ul>
			</div>
		</div>
	</div>
	</s:if>
	<div class="module latest-product titleLine">
		<h3 class="modtitle">最新上架</h3>
		<div class="modcontent ">
		<s:iterator value="#request.newProduct.list" var="productInfo">
			<div class="product-latest-item">
				<div class="media">
					<div class="media-left">
					<s:iterator value="uploadfiles" var="uploadfile">
						<s:if test="#uploadfile.isCover ==1">
						<a href="#"><img src="${RES}/upload/${ uploadfile.path}"
							alt="${productInfo.name }" title="${productInfo.name }" class="img-responsive"
							style="width: 98px; height: 100px;"></a>
						</s:if>
					</s:iterator>
					</div>
					<div class="media-body">
						<div class="caption">
							<h4>
								<a href="${RES }/product/product_select.action?product.id=${productInfo.id}">${productInfo.name }</a>
							</h4>
							<div class="price">
								<span class="price-new"><fmt:formatNumber value="${productInfo.sellprice }" pattern="￥0.00"></fmt:formatNumber></span>
							</div>
							<div class="ratings">
								<div class="rating-box">
									<span class="fa fa-stack"><s:if test="#productInfo.star >=1"><i class="fa fa-star fa-stack-1x"></i></s:if><i class="fa fa-star-o fa-stack-1x"></i></span>
									<span class="fa fa-stack"><s:if test="#productInfo.star >=2"><i class="fa fa-star fa-stack-1x"></i></s:if><i class="fa fa-star-o fa-stack-1x"></i></span>
									<span class="fa fa-stack"><s:if test="#productInfo.star >=3"><i class="fa fa-star fa-stack-1x"></i></s:if><i class="fa fa-star-o fa-stack-1x"></i></span>
									<span class="fa fa-stack"><s:if test="#productInfo.star >=4"><i class="fa fa-star fa-stack-1x"></i></s:if><i class="fa fa-star-o fa-stack-1x"></i></span>
									<span class="fa fa-stack"><s:if test="#productInfo.star >=5"><i class="fa fa-star fa-stack-1x"></i></s:if><i class="fa fa-star-o fa-stack-1x"></i></span>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</s:iterator>
		</div>

	</div>
	<div class="module">
		<div class="modcontent clearfix">
			<div class="banners">
				<div>
					<a href="#"><img src="${RES }/image/demo/cms/left-image-static.png"
						alt="left-image"></a>
				</div>
			</div>

		</div>
	</div>
</aside>
<!--Left Part End -->



