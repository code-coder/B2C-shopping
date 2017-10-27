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
	width: 100%;
	height: 20px;
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
				border="0" alt=""></span>&nbsp;评价管理<span>&nbsp; <span><img
					src="../../images/arror.gif" width="7" height="11" border="0"
					alt=""></span>&nbsp;<a
				href="<%=path%>/manager/consultation/consultation_unansweredConsultation.action">未回复评价</a><span>&nbsp;
			</span></span>
		</div>
	</div>
	<div id="tips"></div>
	
	<div id="mainContainer">
		<table class="default" width="100%">
			<tr class="title">
				<td>序号</td>
				<td>评价时间</td>
				<td>用户</td>
				<td>评价商品</td>
				<td>评价内容</td>
				<td>操作</td>
			</tr>
			<s:if test="pageModel.totalRecords > 0">
			<!-- 遍历开始 -->
			<s:iterator value="pageModel.list">
				<tr class="list">			
					<td><s:property value="id" /></td>
					<td><s:property value="consultingTime" /></td>
					<td><s:property value="customer.username" /></td>
					<td><s:property value="product.name"/></td>				
					<td><s:property value="details" /></td>
					<s:url var="answer" action="consultation_answerConsultation"
						namespace="/manager/consultation">
						<s:param name="pageNo" value="pageModel.pageNo"></s:param>
						<s:param name="consultation.id" value="id"></s:param>
					</s:url>
					<td><a href="${answer}">回复</a></td>				
				</tr>
			</s:iterator>
			<!-- 遍历结束 -->
			</s:if>
		</table>
	</div>
	<div></div>
	<div id="right_foot01">
		<s:url var="first" action="consultation_unansweredConsultation" namespace="/manager/consultation">
			<s:param name="pageNo" value="1"></s:param>
		</s:url>
		<s:url var="previous" action="consultation_unansweredConsultation" namespace="/manager/consultation">
			<s:param name="pageNo" value="pageModel.pageNo-1"></s:param>
		</s:url>
		<s:url var="last" action="consultation_unansweredConsultation" namespace="/manager/consultation">
			<s:param name="pageNo" value="pageModel.bottomPageNo"></s:param>
		</s:url>
		<s:url var="next" action="consultation_unansweredConsultation" namespace="/manager/consultation">
			<s:param name="pageNo" value="pageModel.pageNo+1"></s:param>
		</s:url>
		<s:include value="/WEB-INF/pages/common/page.jsp"></s:include>
	</div>
	<div></div>
</body>
	</html>