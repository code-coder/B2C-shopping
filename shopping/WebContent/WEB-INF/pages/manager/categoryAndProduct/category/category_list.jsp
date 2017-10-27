<%@page language="java" import="java.util.*"
		contentType="text/html; charset=utf-8"%> <%@taglib
		prefix="s" uri="/struts-tags"%> <%
 	String path = request.getContextPath();
 	String basePath = request.getScheme() + "://"
 			+ request.getServerName() + ":" + request.getServerPort()
 			+ path + "/";
 %> <!DOCTYPE html>
	<html>
<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../../css/default.css">
<style type="text/css">
* {
    background: none repeat scroll 0 0 transparent;
    border: 0 none;
    margin: 0;
    padding: 0;
    vertical-align: baseline;
	font-family:微软雅黑;
}
#navi{
	width:100%;
	position:relative;
	word-wrap:break-word;
	border-bottom:1px solid #065FB9;
	margin:0;
	padding:0;
	height:40px;
	line-height:40px;
	vertical-align:middle;
    background-image: -moz-linear-gradient(top,#EBEBEB, #BFBFBF);
    background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #EBEBEB),color-stop(1, 
#BFBFBF));
}
#naviDiv{
	font-size:14px;
	color:#333;
	padding-left:10px;
}
#tips{
	margin-top:10px;
	width:100%;
	height:40px;
}
#buttonGroup{
	padding-left:10px;
	float:left;
	height:35px;
}
.button{
	float:left;
	margin-right:10px;
	padding-left:10px;
	padding-right:10px;
	font-size:14px;
	width:70px;
	height:30px;
	line-height:30px;
	vertical-align:middle;
	text-align:center;
	cursor:pointer;
    border-color: #77D1F6;
    border-width: 1px;
    border-style: solid;
    border-radius: 6px 6px;
    -moz-box-shadow: 2px 2px 4px #282828;
    -webkit-box-shadow: 2px 2px 4px #282828;
    background-image: -moz-linear-gradient(top,#EBEBEB, #BFBFBF);
    background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #EBEBEB),color-stop(1, #BFBFBF));
}
#mainContainer{
	padding-left:10px;
	padding-right:10px;
	text-align:center;
	width:98%;
	font-size:16px;
}
</style>
<body>
	<div id="navi">
		<div id="naviDiv">
			<span><img src="../../images/arror.gif" width="7" height="11"
				border="0" alt=""></span>&nbsp;商品管理<span>&nbsp; <span><img
					src="../../images/arror.gif" width="7" height="11" border="0"
					alt=""></span>&nbsp;<a
				href="<%=path%>/manager/product/category_list.action">商品类列表</a><span>&nbsp;
			</span></span>
		</div>
	</div>
	<div id="tips">
		<div id="buttonGroup">
			<div class="button" style="width:100px"
				onmouseout="this.style.backgroundColor='';this.style.fontWeight='normal'"
				onmouseover="this.style.backgroundColor='#77D1F6';">
				<a href="<%=path%>/manager/product/category_add.action">添加一级商品类</a>
			</div>
			<div class="button"
				onmouseout="this.style.backgroundColor='';this.style.fontWeight='normal'"
				onmouseover="this.style.backgroundColor='#77D1F6';">
				<a href="<%=path%>/manager/product/category_query.action">查找商品类</a>
			</div>
		</div>
	</div>
	<s:fielderror></s:fielderror>
	<div id="mainContainer" >
		<table class="default" width="100%">		
			<tr class="title">
				<td>序号</td>
				<td>商品类名称</td>
				<td>操作</td>
			</tr>
			<s:if test="pageModel.totalRecords > 0">
			<!-- 遍历开始 -->
			<s:iterator value="pageModel.list" status="st">
				<tr class="list">
					<td><s:property value="#st.index+1" /></td>
					<s:url var="modify" action="category_modify" namespace="/manager/product">
						<s:param name="pageNo" value="pageModel.pageNo"></s:param>
						<s:param name="category.id" value="id"></s:param>
					</s:url>
					<s:url var="delect" action="category_delect" namespace="/manager/product">
						<s:param name="pageNo" value="pageModel.pageNo"></s:param>
						<s:param name="category.id" value="id"></s:param>
					</s:url>
					<td><a href="${modify}"><s:property value="name"/></a></td>	
					<td><a href="${delect}" onclick="javascript: return confirm('确定删除该商品种类？');">删除</a></td>
				</tr>
			</s:iterator>
			<!-- 遍历结束 -->
			</s:if>
		</table>
	</div>
	<div></div>
	<div id="right_foot01">
		<s:url var="first" action="category_list" namespace="/manager/product">
			<s:param name="pageNo" value="1"></s:param>
		</s:url>
		<s:url var="previous" action="category_list"
			namespace="/manager/product">
			<s:param name="pageNo" value="pageModel.pageNo-1"></s:param>
		</s:url>
		<s:url var="last" action="category_list" namespace="/manager/product">
			<s:param name="pageNo" value="pageModel.bottomPageNo"></s:param>
		</s:url>
		<s:url var="next" action="category_list" namespace="/manager/product">
			<s:param name="pageNo" value="pageModel.pageNo+1"></s:param>
		</s:url>
		<s:include value="/WEB-INF/pages/common/page.jsp"></s:include>
	</div>
	<div></div>
</body>
	</html>