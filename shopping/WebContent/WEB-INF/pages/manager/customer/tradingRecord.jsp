<%@page language="java" import="java.util.*"
		contentType="text/html; charset=utf-8"%> <%@taglib
		prefix="s" uri="/struts-tags"%> 
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
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
	margin-top: 0px;
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
#tradingitems_table {
	width: 100%;
	line-height: 24px;
	border: 2px solid #e1e1e1;
	text-align: center;
}
#th1{
	background: #e1e1e1;
	color: #FF7F00;
}
#td3{
	padding: 10px 0;
	border-top: 1px solid #e1e1e1;
}
</style>
<body>
	<div id="navi">
		<div id="naviDiv">
			<span><img src="../../images/arror.gif" width="7" height="11"
				border="0" alt=""></span>&nbsp;用户管理<span>&nbsp; <span><img
					src="../../images/arror.gif" width="7" height="11" border="0"
					alt=""></span>&nbsp;<a
				href="<%=path%>/manager/customer/customer_list.action">用户列表</a><span>&nbsp;
			</span></span>
		</div>
	</div>
	<div id="tips">
		
	</div>
	<div id="mainContainer">
		<s:if test="tradingRecord.totalRecords == 0">
				&nbsp;&nbsp;&nbsp;&nbsp; 
				<span style="color: #c1c1c1">没有任何交易记录</span>
			</s:if>
			<s:else>
				<table id="tradingitems_table">
				
				<tr>
					<th id="th1">日期</th>
					<th id="th1">交易内容</th>
					<th id="th1">交易金额</th>
				</tr>
				<!-- 遍历交易记录 -->
				<s:iterator value="tradingRecord.list">
					<tr>
						<td id="td3"><s:property value="tradingTime" /></td>
						<td id="td3"><s:property value="tradingDetails" /></td>
						<td id="td3"><s:property value="money" /></td>
					</tr>
				</s:iterator>
			</table>
			<s:url var="first">
				<s:param name="pageNo" value="1"></s:param>
				<s:param name="customer.id" value="customer.id"></s:param>
			</s:url>
			<s:url var="previous">
				<s:param name="pageNo" value="tradingRecord.pageNo-1"></s:param>
				<s:param name="customer.id" value="customer.id"></s:param>
			</s:url>
			<s:url var="last">
				<s:param name="pageNo" value="tradingRecord.bottomPageNo"></s:param>
				<s:param name="customer.id" value="customer.id"></s:param>
			</s:url>
			<s:url var="next">
				<s:param name="pageNo" value="tradingRecord.pageNo+1"></s:param>
				<s:param name="customer.id" value="customer.id"></s:param>
			</s:url>

			<div style="text-align: center; margin-top: 20px;font-size:14px; ">
				<s:if test="tradingRecord.pageNo > 1">
					<a href="${first}">首页</a>　<a href="${previous}">上一页</a>
				</s:if>
				<s:else>
					首页　上一页
				</s:else>
				<SPAN style="color: red;">
					　[<s:property value="tradingRecord.pageNo"/>]　
				</SPAN>
				<s:if test="tradingRecord.pageNo < tradingRecord.bottomPageNo">
					<a href="${next}">下一页</a>　<a href="${last}">尾页</a>
				</s:if>
				<s:else>
					下一页　尾页
				</s:else>
			</div>
		</s:else>
	</div>
</body>
	</html>