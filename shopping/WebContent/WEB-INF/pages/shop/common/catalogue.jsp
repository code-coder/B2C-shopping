<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
 	String path = request.getContextPath();
 	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
 %> <!DOCTYPE html>
<s:set var="context_path" value="#request.get('javax.servlet.forward.context_path')"></s:set>
<link href="${context_path}/css/shop.css" rel="stylesheet" type="text/css">

<div id="box">
	<div id="left">
		<div id="left_c1">
			<span style="color:'#010101';"><strong>全部商品分类</strong></span>
		</div>
		<div id="left_c2">
		<!-- 类别 -->
			<!-- 遍历开始 -->
			<s:iterator value="catalogue">
		
			<a href="<%=path%>/product/product_findByCategoryId.action?category.id=<s:property value="id"/>" style="color: white;"> 
					<s:property value="name"/></a><br>			
			</s:iterator>
			<!-- 遍历结束 -->
		
		</div>
	</div>
</div>
