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
	border: 1 none;
	margin: 0;
	padding: 0;
	vertical-align: baseline;
	/* font-family: 微软雅黑; */
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
				border="0" alt=""></span>&nbsp;评价管理<span>&nbsp; <span><img
					src="../../images/arror.gif" width="7" height="11" border="0"
					alt=""></span>&nbsp;<a
				href="<%=path%>/manager/consultation/unansweredConsultation.action">未回复评价</a><span>&nbsp;
			</span></span>
		</div>
	</div>
	<div id="tips"></div>
	<div id="mainContainer">
		<strong>回复评价</strong> <br><br>
		<form name="answerForm"
			action="<%=path%>/manager/consultation/consultation_saveAnswer.action" method="post" >
			<s:hidden name="pageNo"></s:hidden>
			<s:hidden name="consultation.id"></s:hidden>
			<s:hidden name="consultation.details"></s:hidden>
			<s:hidden name="consultation.consultingTime"></s:hidden>
			<s:hidden name="consultation.product.id"></s:hidden>
			<s:hidden name="consultation.customer.id"></s:hidden>
			<s:hidden name="consultation.answered"></s:hidden>
			
			<table>
				<tr>
					<td colspan="2"><span style="color: red; font-size:12px;">
							<s:fielderror></s:fielderror>
					</span></td>
				</tr>
				<tr>
					<td width="15%">评价时间</td>
					<td><s:property value="consultation.consultingTime"/>
				</tr>
				<tr>
					<td>用户</td>
					<td><s:property value="consultation.customer.username"/>
				</tr>	
				<tr>
					<td>评价商品</td>
					<td><span style="color:blue"><s:property value="consultation.product.name"/></span>
				</tr>
				<tr>
					<td>评价内容：</td>
					<td><span style="color:blue"><s:property value="consultation.details"/></span></td>
				</tr>
				<tr>
					<tr>
					<td width="15%">回复：</td>
					<td><textarea rows="7" cols="80" name="consultation.answer"><s:property 
						value="consultation.answer"/></textarea></td>
				</tr>
				<tr>
					<td>显示在商品评价列表：</td>
					<s:if test="consultation.showed == false & consultation.answered == true" >
						<td><input type="radio" name="consultation.showed" value="true">是<input 
								type="radio" name="consultation.showed" value="false" checked="checked">否</td>
					</s:if>
					<s:else>
						<td><input type="radio" name="consultation.showed" value="true" checked="checked">是<input 
								type="radio" name="consultation.showed" value="false">否</td>
					</s:else>
					</tr>
				<tr>
					<td colspan="2" align="center"><input class="button"
						type="submit" value="回复"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
	</html> 