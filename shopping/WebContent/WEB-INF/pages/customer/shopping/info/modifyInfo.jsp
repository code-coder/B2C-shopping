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
<title>个人资料</title>
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
				<div id="info">
					<s:form name="modifyForm" action="customer_shopping_saveInfo" namespace="/customer/shopping" method="post">
						<s:hidden name="customer.id"></s:hidden>
						<s:hidden name="customer.password"></s:hidden>
						<s:hidden name="customer.state"></s:hidden>
						<s:hidden name="customer.account.id"></s:hidden>
						<s:hidden name="customer.cart.id"></s:hidden>
						<s:hidden name="customer.headPortrait.id"></s:hidden>
						<s:hidden name="customer.headPortrait.path"></s:hidden>
						<table width="500" cellspacing="15px;">
							<tr>
								<td colspan="2"><span style="color: red;"> <s:fielderror></s:fielderror>
								</span></td>
							</tr>
							<tr></tr>
							<tr>
								<td width="20%">用户名：</td>
								<td><input id="text" type="text" name="customer.username" value='<s:property value="customer.username"/>'/></td>
							</tr>
							<tr>
								<td>真实姓名：</td>
								<td><input id="text" type="text" name="customer.realname" value='<s:property value="customer.realname"/>'/></td>
							</tr>
							<tr>
								<td>性别：</td>
								<s:if test="customer.sex = 1">
								<td><input type="radio" name="customer.sex" value=1
									checked="checked" />男<input type="radio" name="customer.sex"
									value=2 />女</td></s:if>
								<s:else>
								<td><input type="radio" name="customer.sex" value=1
									 />男<input type="radio" name="customer.sex"
									value=2 checked="checked"/>女</td></s:else>
							</tr>
							<tr>
								<td>手机号码：</td>
								<td><input id="text" type="text" name="customer.mobile" value='<s:property value="customer.mobile"/>'/></td>
							</tr>
							<tr>
								<td>邮箱：</td>
								<td><input id="text" type="text" name="customer.email" value='<s:property value="customer.email"/>'/></td>
							</tr>
							<tr>
								<td>地址：</td>
								<td><textarea rows="4" cols="45" name="customer.address" style="border: 1px black solid;"><s:property value="customer.address"/></textarea></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><input id="button" class="button"
									type="submit"></td>
							</tr>
						</table>
					</s:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>