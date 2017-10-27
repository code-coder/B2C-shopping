<%@page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<link rel="stylesheet" type="text/css" href="../../css/default.css">
<style type="text/css">
* {
	background: none repeat scroll 0 0 transparent;
	border: 0 none;
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
	float: left;
	margin-right: 10px;
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
	text-align: center;
	width: 98%;
	font-size: 15px;
}
</style>
<body>
	<div id="navi">
		<div id="naviDiv">
			<span><img src="../../images/arror.gif" width="7" height="11"
				border="0" alt=""></span>&nbsp;订单管理<span>&nbsp; <span><img
					src="../../images/arror.gif" width="7" height="11" border="0"
					alt=""></span>&nbsp;<a
				href="<%=path%>/manager/order/order_list.action">订单列表</a><span>&nbsp;
			</span></span>
		</div>
	</div>
	<div id="tips">
		<div id="buttonGroup">
			<div class="button"
				onmouseout="this.style.backgroundColor='';this.style.fontWeight='normal'"
				onmouseover="this.style.backgroundColor='#77D1F6';this.style.fontWeight='bold'">
				<a href="<%=path%>/manager/order/order_query.action">查找订单</a>
			</div>
		</div>
	</div>
	<div id="mainContainer">
		<table class="default" width="100%">
			<tr class="title">
				<td>订单号</td>
				<td>下订时间</td>
				<td>订单总额</td>
				<td>订单状态</td>
				<td>操作</td>
			</tr>

			<s:iterator value="pageModel.list">
				<s:url var="modify" action="product_modify" namespace="/manager/product">
					<s:param name="pageNo" value="pageModel.pageNo"></s:param>
					<s:param name="product.id" value="id"></s:param>
				</s:url>
				<s:url var="delect" action="order_delect" namespace="/manager/order">
					<s:param name="pageNo" value="pageModel.pageNo"></s:param>
					<s:param name="order.orderId" value="orderId"></s:param>
				</s:url>
				<s:url var="viewOrderDetails" action="order_viewOrderDetails" namespace="/manager/order">
					<s:param name="pageNo" value="pageModel.pageNo"></s:param>
					<s:param name="order.orderId" value="orderId"></s:param>
				</s:url>
				
				<tr class="list">
					<td><s:property value="orderId" /></td>
					<td><s:property value="createTime" /></td>
					<td><s:property value="totalPrice" /></td>	
					<td><s:property value="orderState" /></td>
					<td><a href="${viewOrderDetails}" >查看订单详情</a> | <a 
					href="${delect}" onclick="javascript: return confirm('确定删除该订单？');">删除</a></td>
				</tr>
			</s:iterator>
			<!-- 遍历结束 -->
		</table>
	</div>
	<div></div>
	<div id="right_foot01">
		<s:url var="first" action="order_list" namespace="/manager/order">
			<s:param name="pageNo" value="1"></s:param>
		</s:url>
		<s:url var="previous" action="order_list"
			namespace="/manager/order">
			<s:param name="pageNo" value="pageModel.pageNo-1"></s:param>
		</s:url>
		<s:url var="last" action="order_list" namespace="/manager/order">
			<s:param name="pageNo" value="pageModel.bottomPageNo"></s:param>
		</s:url>
		<s:url var="next" action="order_list" namespace="/manager/order">
			<s:param name="pageNo" value="pageModel.pageNo+1"></s:param>
		</s:url>
		<s:include value="/WEB-INF/pages/common/page.jsp"></s:include>
	</div>
	<div></div>
</body>