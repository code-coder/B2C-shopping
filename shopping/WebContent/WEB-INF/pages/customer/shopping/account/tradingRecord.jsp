<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<s:set var="context_path"
	value="#request.get('javax.servlet.forward.context_path')"></s:set>
<link href="${context_path}/css/shop.css" rel="stylesheet"
	type="text/css" />
<title>交易记录</title>
<style type="text/css">
#button {
	padding-left: 10px;
	padding-right: 10px;
	font-size: 13px;
	width: 55px;
	height: 28px;
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
</head>
<body>
	<%@include file="/WEB-INF/pages/shop/common/head.jsp"%>
	<div id="box">
		<div id="all">
			<div id="navigator">
				<%@include
					file="/WEB-INF/pages/customer/common/myShopping_catalogue.jsp"%>
			</div>

			<div id="mainframe">
				<div id="part3" style="margin-top: 20px;padding-top: 15px; padding-bottom: 15px;">
					<table >
					<tr>
						<td width="58%">
						&nbsp;&nbsp;可用金额： <b style="color: red; font-size: 16px;">￥<s:property value="account.balance" /></b></td>
						<td width="12%">
						<input type="button" id="button"  type="button" value="充值" 
						onclick="window.location.href='${RES}/customer/shopping/customer_shopping_recharge.action'"></td> 
						<td width="35%">
						<s:a action="customer_shopping_viewTradingRecord" namespace="/customer/shopping">查看交易记录</s:a>&nbsp;
						<s:a action="customer_shopping_modifyPayPassword" namespace="/customer/shopping">修改支付密码</s:a></td>
				
				</tr>
					</table>
				</div>
				<div id="part4" style="padding-top: 15px; padding-bottom: 15px;">
					<s:if test="pageModel.totalRecords == 0">
						&nbsp;&nbsp;&nbsp;&nbsp; 
						<span style="color: #c1c1c1">您当前没有任何交易记录</span>
					</s:if>
					<s:else>
						<table id="tradingitems_table">
						
						<tr>
							<th id="th1">日期</th>
							<th id="th1">交易内容</th>
							<th id="th1">交易金额</th>
						</tr>
						<!-- 遍历交易记录 -->
						<s:iterator value="pageModel.list">
							<tr>
								<td id="td3"><s:property value="tradingTime" /></td>
								<td id="td3"><s:property value="tradingDetails" /></td>
								<td id="td3"><s:property value="money" /></td>
							</tr>
						</s:iterator>
					</table>
					<s:url var="first">
				<s:param name="pageNo" value="1"></s:param>
			</s:url>
			<s:url var="previous">
				<s:param name="pageNo" value="pageModel.pageNo-1"></s:param>
			</s:url>
			<s:url var="last">
				<s:param name="pageNo" value="pageModel.bottomPageNo"></s:param>
			</s:url>
			<s:url var="next">
				<s:param name="pageNo" value="pageModel.pageNo+1"></s:param>
			</s:url>

			<s:include value="/WEB-INF/pages/common/page.jsp"></s:include>
					</s:else>
				</div>
			</div>
		</div>
	</div>
</body>
</html>