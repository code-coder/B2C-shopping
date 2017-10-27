<%@page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<s:set var="context_path"
	value="#request.get('javax.servlet.forward.context_path')"></s:set>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../../css/default.css">
<style type="text/css">
* {
	background: none repeat scroll 0 0 transparent;
	border: 1 none;
	margin: 0;
	padding: 0;
	vertical-align: baseline;
	/* font-family: 微软雅黑; */
}

#navi {
	width: 100%;
	position: relative;
	word-wrap: break-word;
	border-bottom: 1px solid #065FB9;
	margin: 0;
	padding: 0;
	height: 40px;
	line-height: 40px;
	vertical-align: middle;
	background-image: -moz-linear-gradient(top, #EBEBEB, #BFBFBF);
	background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #EBEBEB),
		color-stop(1, #BFBFBF));
}

#naviDiv {
	font-size: 14px;
	color: #333;
	padding-left: 10px;
}

#tips {
	margin-top: 10px;
	width: 100%;
	height: 20px;
}

#buttonGroup {
	padding-left: 10px;
	float: left;
	height: 35px;
}

.button {
	margin-top: 20px;
	padding-left: 10px;
	padding-right: 10px;
	font-size: 14px;
	width: 70px;
	height: 30px;
	line-height: 30px;
	vertical-align: middle;
	text-align: center;
	cursor: pointer;
	border-color: #77D1F6;
	border-width: 1px;
	border-style: solid;
	border-radius: 6px 6px;
	-moz-box-shadow: 2px 2px 4px #282828;
	-webkit-box-shadow: 2px 2px 4px #282828;
	background-image: -moz-linear-gradient(top, #EBEBEB, #BFBFBF);
	background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #EBEBEB),
		color-stop(1, #BFBFBF));
}

#mainContainer {
	float: left;
	padding-left: 10px;
	padding-right: 10px;
	text-align: left;
	width: 98%;
	font-size: 16px;
}
#part1{
	float: left;
	width:60%;
}
#part2{
	float: left;
	width:38%;
}
</style>
<body>
	<script type="text/javascript" src="../../js/Calendar3.js"></script>

	<div id="navi">
		<div id="naviDiv">
			<span><img src="../../images/arror.gif" width="7" height="11"
				border="0" alt=""></span>&nbsp;商品管理<span>&nbsp; <span><img
					src="../../images/arror.gif" width="7" height="11" border="0"
					alt=""></span>&nbsp;<a
				href="<%=path%>/manager/product/product_list.action">商品列表</a><span>&nbsp;
			</span></span>
		</div>
	</div>
	<div id="tips"></div>
	<div id="mainContainer">
	<div id="part1">
		<strong>修改商品信息</strong> <br> <br>
		<form name="modifyForm"
			action="<%=path%>/manager/product/product_saveModify.action" method="post"
			enctype="multipart/form-data">
			<s:hidden name="product.id"></s:hidden>
			<s:hidden name="product.clickcount"></s:hidden>
			<s:hidden name="product.sellcount"></s:hidden>
			<s:hidden name="product.star"></s:hidden>
			<s:hidden name="product.homeIndex"></s:hidden>
			<s:hidden name="product.isNew"></s:hidden>
			<s:hidden name="product.isHot"></s:hidden>
			<s:hidden name="product.description"></s:hidden>
			<s:hidden name="product.subName"></s:hidden>
			<s:hidden name="product.sellTime"></s:hidden>
			<s:hidden name="product.sellOutTime"></s:hidden>
			<s:hidden name="pageNo"></s:hidden>
			<table>
				<tr>
					<td colspan="2"><span style="color: red; font-size:12px;">
							<s:fielderror></s:fielderror>
					</span></td>
				</tr>
				<tr>
					<td width="18%">商品名称：</td>
					<td><input type="text" name="product.name"
						value='<s:property value="product.name"/>'></td>
				</tr>
				<tr>
					<td>所属类别：</td>
					<td><select name="product.productCategory.id">
						<s:iterator value="productcategoryList.list">
							<s:if test="product.productCategory.id == id">
								<option value='<s:property value="id"/>' selected="selected"><s:property value="name"/></option>
							</s:if>
							<option value='<s:property value="id"/>'><s:property value="name"/></option>
						</s:iterator>
					</select></td>
				</tr>
				<tr>
					<td>采购价格：</td>
					<td><input type="text" name="product.baseprice"
						value='<s:property value="product.baseprice"/>'></td>
				</tr>
				<tr>
					<td>销售价格：</td>
					<td><input type="text" name="product.sellprice"
						value='<s:property value="product.sellprice"/>'></td>
				</tr>
				<tr>
					<td>上传图片：</td>
					<td><input type="file" name="file"></td>
				</tr>
				<tr>
					<td>商品说明：</td>
					<td><textarea rows="5" cols="60" name="product.description"><s:property
								value="product.description" /></textarea></td>
				</tr>

				<tr>
					<td colspan="2" align="center"><input class="button"
						type="submit" value="修改"></td>
				</tr>
			</table>
		</form>
		</div>
		<div id="part2">
			<strong>商品封面</strong><br><br>
			<s:if test="product.uploadfile==null || product.uploadfile.path==null">
				<span style="color:#666666">该商品没有上传照片</span>
			</s:if>
			<s:else>
				<s:iterator value="product.uploadfiles" var="uploadfile">
					<s:if test="#uploadfile.isCover ==1">
					   <img src='${RES}/upload/${uploadfile.path }' width="200px" border="0">
					</s:if>
				</s:iterator>
			</s:else>
		</div>
	</div>
</body>
</html>
