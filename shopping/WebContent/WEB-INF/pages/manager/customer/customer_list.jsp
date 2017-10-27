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
				border="0" alt=""></span>&nbsp;用户管理<span>&nbsp; <span><img
					src="../../images/arror.gif" width="7" height="11" border="0"
					alt=""></span>&nbsp;<a
				href="<%=path%>/manager/customer/customer_list.action">用户列表</a><span>&nbsp;
			</span></span>
		</div>
	</div>
	<div id="tips">
		<div id="buttonGroup">
			<div class="button"
				onmouseout="this.style.backgroundColor='';this.style.fontWeight='normal'"
				onmouseover="this.style.backgroundColor='#77D1F6';this.style.fontWeight='bold'">
				<a href="<%=path%>/manager/customer/customer_query.action">查找用户</a>
			</div>
		</div>
	</div>
	<div id="mainContainer">
		<table class="default" width="100%">
			<tr class="title">
				<td>用户id</td>
				<td>用户名</td>
				<td>真实姓名</td>
				<td>性别</td>
				<td>手机号码</td>
				<td>邮箱</td>
				<td>地址</td>
				<td>账户余额</td>
				<td>操作</td>
			</tr>
			<s:if test="pageModel.totalRecords > 0">
			<!-- 遍历开始 -->
			<s:iterator value="pageModel.list">
				<tr class="list">
					<s:if test="forbidden==0">
						<td><s:property value="id" /></td>
						<td><a
							<%-- href="<%=path%>/manager/customer/customer_modify.action?customer.id=
						<s:property value="id"/>" --%>  ><s:property
									value="username" /></a></td>
						<td><s:property value="realname" /></td>
						<td><s:property value="sex" /></td>
						<td><s:property value="mobile" /></td>
						<td><s:property value="email" /></td>
						<td><s:property value="address" /></td>
						<td><s:property value="balance" /></td>
						<s:url var="banCustomer" action="customer_ban"
							namespace="/manager/customer">
							<s:param name="pageNo" value="pageModel.pageNo"></s:param>
							<s:param name="customer.id" value="id"></s:param>
						</s:url>
						<s:url var="tradingRecord" action="customer_viewTradingRecord" namespace="/manager/customer">
							<s:param name="customer.id" value="id"></s:param>
						</s:url>
						<td><a href="${tradingRecord}">交易记录</a> | <a href="${banCustomer}" onclick="javascript: return confirm('确定对该用户进行封号操作？');">封号</a>
					</s:if>
					<s:else>
						<td><span style="color:red"><s:property value="id" /></span></td>
						<td><a
							href="<%=path%>/manager/customer/customer_modify.action?customer.id=
						<s:property value="id"/>"><span style="color:red"><s:property
									value="username" /></span></a></td>
						<td><span style="color:red"><s:property value="realname" /></span></td>
						<td><span style="color:red"><s:if test="sex==1">男</s:if><s:else>女</s:else></span></td>
						<td><span style="color:red"><s:property value="mobile" /></span></td>
						<td><span style="color:red"><s:property value="email" /></span></td>
						<td><span style="color:red"><s:property value="address" /></span></td>
						<td><span style="color:red"><s:property value="balance" /></span></td>
						<s:url var="reopenCustomer" action="customer_reopen"
							namespace="/manager/customer">
							<s:param name="pageNo" value="pageModel.pageNo"></s:param>
							<s:param name="customer.id" value="id"></s:param>
						</s:url>
						<s:url var="tradingRecord" action="customer_viewTradingRecord"
							namespace="/manager/customer">
							<s:param name="customer.id" value="id"></s:param>
						</s:url>
						<td><a href="${tradingRecord}"><span style="color:red">交易记录</span></a> | <a href="${reopenCustomer}"><span style="color:red" onclick="javascript: return confirm('确定解除该用户的封号操作？');">解封</span></a>
					</s:else>
				</tr>
			</s:iterator>

			<!-- 遍历结束 -->
			</s:if>
		</table>
	</div>
	<div></div>
	<div id="right_foot01">
		<s:url var="first" action="customer_list" namespace="/manager/customer">
			<s:param name="pageNo" value="1"></s:param>
		</s:url>
		<s:url var="previous" action="customer_list"
			namespace="/manager/customer">
			<s:param name="pageNo" value="pageModel.pageNo-1"></s:param>
		</s:url>
		<s:url var="last" action="customer_list" namespace="/manager/customer">
			<s:param name="pageNo" value="pageModel.bottomPageNo"></s:param>
		</s:url>
		<s:url var="next" action="customer_list" namespace="/manager/customer">
			<s:param name="pageNo" value="pageModel.pageNo+1"></s:param>
		</s:url>
		<s:include value="/WEB-INF/pages/common/page.jsp"></s:include>
	</div>
	<div></div>
</body>
	</html>