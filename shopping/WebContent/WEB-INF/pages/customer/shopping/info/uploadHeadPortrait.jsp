<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>上传头像</title>
</head>
<body>
<s:include value="/WEB-INF/pages/common/header.jsp"></s:include>
<div class="container container-fluid margin-20">
	<ul class="breadcrumb">
		<li><a href="${RES }"><i class="fa fa-home"></i></a></li>
		<li><a href="${RES }/customer/shopping/customer_shopping_myShopping.action">我的商城</a></li>
		<li><a href="#">上传头像</a></li>
	</ul>
<div class="row">
<div class="col-md-3">
				<s:include value="/WEB-INF/pages/customer/common/menu.jsp"></s:include>
			</div>
			<!-- start main -->
			<div class="main-content col-md-9">
				<div>
					个人管理&nbsp;&nbsp;/&nbsp;&nbsp;<label>上传头像</label>
				</div>
				<hr>
				<div>
					<span>当前头像为：</span>
					<s:if test="#session.customer.headPortrait.path == null">
							<s:a action="customer_shopping_modifyHeadPortrait"
								namespace="/customer/shopping">
								<img src="${HEAD_SRC }" width="80" height="80" border="1">
							</s:a>
						</s:if>
						<s:else>
							<s:a action="customer_shopping_modifyHeadPortrait"
								namespace="/customer/shopping">
								<img src='${HEADSRC }${customer.headPortrait.path}' width="80" height="80" border="1">
							</s:a>
						</s:else>
				</div>
				<form name="modifyForm"
					action="${RES}/customer/shopping/customer_shopping_saveHeadPortrait.action"
					method="post" enctype="multipart/form-data">
					选择头像：<input type="file" name="headPortrait">
					<br>
					<input class="btn btn-primary" type="submit" value="上传">	
				</form>
			</div>
		</div>
	</div>
	<s:include value="/WEB-INF/pages/common/footer.jsp"></s:include>
</body>
</html>