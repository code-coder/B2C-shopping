<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>我的账户</title>
</head>
<body>
	<s:include value="/WEB-INF/pages/common/header.jsp"></s:include>
	<div class="container container-fluid margin-20">
		<ul class="breadcrumb">
		<li><a href="${RES }"><i class="fa fa-home"></i></a></li>
		<li><a href="${RES }/customer/shopping/customer_shopping_myShopping.action">我的商城</a></li>
		<li><a href="#">我的账户</a></li>
		</ul>
		<div class="row">
			
			<div class="col-md-3">
				<s:include value="/WEB-INF/pages/customer/common/menu.jsp"></s:include>
			</div>
			<!-- start main -->
			<div class="main-content col-md-9">
				<div>
					&nbsp;&nbsp;个人管理&nbsp;&nbsp;/&nbsp;&nbsp;<label>个人账户</label>
				</div>
				<hr>
				<table style="width:100%;">
					<tr>
						<td style="width:50%;">&nbsp;&nbsp;账户余额： <b style="color: red; font-size: 16px;"><fmt:formatNumber value="${ account.balance}" pattern="￥0.00"/></b></td>
						<td ><input class="btn btn-primary" type="button" id="button" value="充值"
							onclick="window.location.href='${RES}/customer/shopping/customer_shopping_recharge.action'"></td>
						<td >
							<s:a cssClass="btn btn-primary" action="customer_shopping_modifyPayPassword"
								namespace="/customer/shopping">修改支付密码</s:a></td>
					</tr>
				</table>
				<s:if test="pageModel.totalRecords == 0">
            &nbsp;&nbsp;&nbsp;&nbsp; 
            <span style="color: #c1c1c1">您当前没有任何交易记录</span>
          </s:if>
          <s:else>
          <hr>
          <h4>我的交易记录</h4>
            <table class="table table-hover" style="margin-top:20px;">
            <tr>
              <th>日期</th>
              <th>交易内容</th>
              <th>交易金额</th>
            </tr>
            <!-- 遍历交易记录 -->
            <s:iterator value="pageModel.list">
              <tr class="text-center">
                <td id="td3"><fmt:formatDate value="${tradingTime }" type="date" dateStyle="full"/>
					<fmt:formatDate value="${tradingTime  }" type="time" dateStyle="short"/></td>
                <td id="td3">${tradingDetails }</td>
                <td id="td3"><fmt:formatNumber value="${ money}" pattern="￥.00"/></td>
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
	<s:include value="/WEB-INF/pages/common/footer.jsp"></s:include>
</body>
</html>