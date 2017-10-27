<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>个人资料</title>
</head>
<body>
	<s:include value="/WEB-INF/pages/common/header.jsp"></s:include>
	<div class="container container-fluid margin-20">
		<div class="row">
			
			<div class="col-md-3">
				<s:include value="/WEB-INF/pages/customer/common/menu.jsp"></s:include>
			</div>
			<!-- start main -->
			<div class="main-content col-md-9">
				<div>
					个人管理&nbsp;&nbsp;/&nbsp;&nbsp;<label>个人资料</label>
				</div>
				<hr>
			<s:form action="customer_shopping_saveRecharge"
            namespace="/customer/shopping">
            <span style="color: red;"><s:fielderror></s:fielderror></span>
            <table>
              <tr>
                <td>充值金额： <b style="color: red; font-size: 16px;">￥ </b><input 
                id="text" type="text" name="tradingitem.money"></td>
              </tr>
              <tr>
                <td>支付密码： <b style="color: red; font-size: 16px;">￥ </b><input 
                id="text" type="password" name="account.password"></td>
                <td >&nbsp;<input type="submit" class="btn btn-primary"
                  value="充值"></td>
              </tr>
            </table>
          </s:form>
			</div>
		</div>
	</div>
	<s:include value="/WEB-INF/pages/common/footer.jsp"></s:include>
</body>
</html>