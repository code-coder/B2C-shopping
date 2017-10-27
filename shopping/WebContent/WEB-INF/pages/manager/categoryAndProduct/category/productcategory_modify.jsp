<%@page language="java" import="java.util.*"
		contentType="text/html; charset=utf-8"%> <%@taglib
		prefix="s" uri="/struts-tags"%> <%
 	String path = request.getContextPath();
 	String basePath = request.getScheme() + "://"
 			+ request.getServerName() + ":" + request.getServerPort()
 			+ path + "/";
 %> 


<link rel="stylesheet" type="text/css" href="../../css/default.css">
<style type="text/css">
* {
	background: none repeat scroll 0 0 transparent;
	border: 1 none;
	margin: 0;
	padding: 0;
	vertical-align: baseline;
	font-family: 微软雅黑;
	overflow: hidden;
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
	height: 40px;
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
	padding-left: 10px;
	padding-right: 10px;
	text-align: left;
	width: 98%;
	font-size: 16px;
}
</style>

<body>
	<script type="text/javascript" src="../../js/Calendar3.js"></script>

	<div id="navi">
		<div id="naviDiv">
			<span><img src="../../images/arror.gif" width="7" height="11"
				border="0" alt="">&nbsp;商品管理&nbsp; 
			</span>
			<span><img src="../../images/arror.gif" width="7" height="11" border="0"/>&nbsp;
				<a href="<%=path%>/manager/product/category_list.action">一级商品类列表</a>
			</span>
			<span><img src="../../images/arror.gif" width="7" height="11" border="0"/>&nbsp;
				<a href="<%=path%>/manager/product/category_modify.action?category.id=${category.id }">一级商品类管理</a>
			</span>
			<span><img src="../../images/arror.gif" width="7" height="11"border="0" alt="">
			<a href="<%=path%>/manager/product/category_secondcategoryModify.action?category.id=${category.id }&secondcategory.id=${productcategory.secondcategory.id }">&nbsp;二级商品类管理&nbsp;</a> 
			</span>
			<span><img src="../../images/arror.gif" width="7" height="11"
				border="0" alt="">&nbsp;三级商品类管理&nbsp; 
			</span>
		</div>
	</div>
	<div id="tips"></div>
	<div id="mainContainer">
		<strong>三级商品类管理</strong> <br> <br>

		<s:form action="category_productcategoryModify_save" namespace="/manager/product" method="post">
			<s:hidden name="pageNo"></s:hidden>
			<input type="hidden" name="productcategory.id" value="${productcategory.id }">
			<s:fielderror></s:fielderror>
			<tr></tr>
			<tr></tr>
			<table>
				<tr>
					<td>二级商品类名称：</td>
					<td><select name="secondcategory.id">
						<s:iterator value="secondcategoryList.list" var="secondcategory">
						<s:if test="#secondcategory.name==productcategory.secondcategory.name"><option selected="selected" value='<s:property value="id"/>'><s:property value="name"/></option></s:if>
						<s:else><option value='<s:property value="id"/>'><s:property value="name"/></option></s:else>
						</s:iterator>
					</select></td>
				</tr>
				<tr>
				<tr>
					<td>二级商品类名称：</td>
					<td><input type="text" name="productcategory.name"  value="${productcategory.name}"/></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input class="button"
						type="submit" value="修改"></td>
				</tr>
			</table>
			</s:form>
	</div>
</body>
