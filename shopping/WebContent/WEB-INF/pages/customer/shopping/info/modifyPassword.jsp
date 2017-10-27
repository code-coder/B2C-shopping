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
	
<title>修改密码</title>
</head>
<body>
<s:include value="/WEB-INF/pages/common/header.jsp"></s:include>
<div class="container container-fluid margin-20">
	<ul class="breadcrumb">
		<li><a href="${RES }"><i class="fa fa-home"></i></a></li>
		<li><a href="${RES }/customer/shopping/customer_shopping_myShopping.action">我的商城</a></li>
		<li><a href="#">修改登录密码</a></li>
	</ul>
<div class="row">

<div class="col-md-3">
<s:include value="/WEB-INF/pages/customer/common/menu.jsp"></s:include>
</div>
<!-- start main -->
         <div class="main-content col-md-9">
         <div>&nbsp;&nbsp;个人管理&nbsp;&nbsp;/&nbsp;&nbsp;<label>修改登录密码</label></div>
             <hr>
             <s:form cssClass="form-horizontal " action="customer_shopping_savePassword" method="post">
           <div class="form-group">
             <label for="inputPassword1" class="col-sm-3 control-label">原密码</label>
             <div class="col-sm-7">
               <input type="password" name="customer.password" class="form-control" id="inputPassword3" placeholder="请输入原密码">
             </div>
           </div>
            <div class="form-group">
             <label for="inputPassword1" class="col-sm-3 control-label">新密码</label>
             <div class="col-sm-7">
               <input type="password" name="customer.newpassword" class="form-control" id="inputPassword3" placeholder="请设置新密码">
             </div>
           </div>
           <div class="form-group">
             <label for="inputPassword3"  class="col-sm-3 control-label">确认密码</label>
             <div class="col-sm-7">
							<input type="password" name="customer.repassword"
								class="form-control" id="inputPassword3" placeholder="再次确认密码">
						</div>
           </div>
           <div class="form-group">
             <div class="col-sm-offset-3 col-sm-7">
               <button type="submit" class="btn btn-info" style="width: 206px;">修&nbsp;&nbsp;&nbsp;改</button>
             </div>
           </div>
             </s:form>
 		</div>   
 	</div> 
	</div>
	<s:include value="/WEB-INF/pages/common/footer.jsp"></s:include>
</body>
</html>