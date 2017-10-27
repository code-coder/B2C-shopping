<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
<title>新增收货地址</title>
</head>
<body>
<s:include value="/WEB-INF/pages/common/header.jsp"></s:include>
<div class="container container-fluid margin-20">
	<ul class="breadcrumb">
		<li><a href="${RES }"><i class="fa fa-home"></i></a></li>
		<li><a href="${RES }/customer/shopping/customer_shopping_myShopping.action">我的商城</a></li>
		<li><a href="#">新增收货地址</a></li>
	</ul>
<div class="row">
<div class="col-md-3">
<s:include value="/WEB-INF/pages/customer/common/menu.jsp"></s:include>
</div>
<!-- start main -->
         <div class="main-content col-md-9">
         <div><label>新增收货地址&nbsp;&nbsp;/</label></div>
             <hr>
             <s:form name="addForm" cssClass="form-horizontal" action="customer_order_saveShoppingAddress" namespace="/customer/order" method="post">
           <div class="form-group">
             <label for="inputPassword1" class="col-sm-3 control-label">收件人</label>
             <div class="col-sm-9">
               <input type="text" name="shoppingAddress.consignee" class="form-control" placeholder="">
             </div>
           </div>
            <div class="form-group">
             <label for="inputPassword1" class="col-sm-3 control-label">手机号码</label>
             <div class="col-sm-9">
               <input type="tel" name="shoppingAddress.mobile" class="form-control" id="inputPassword3">
             </div>
           </div>
           <div class="form-group">
           <label  class="col-sm-3 control-label">收货地址</label>
			<div class="col-sm-9">
				<textarea type="text" name="shoppingAddress.address" class="form-control" placeholder="请填写详细住址"></textarea>
			</div>
           </div>
           <div class="form-group">
           <label  class="col-sm-3 control-label">邮政编码</label>
			<div class="col-sm-9">
				<input type="text" name="shoppingAddress.postcode" class="form-control" >
			</div>
           </div>
           <div class="form-group">
             <div class="col-sm-offset-3 col-sm-9">
               <input type="checkbox" name="shoppingAddress.isDefault" value='true'/>设为默认地址
             </div>
           </div>
           <div class="form-group">
             <div class="col-sm-offset-3 col-sm-9">
               <button type="submit" class="btn btn-info" style="width: 206px;">新&nbsp;&nbsp;&nbsp;增</button>
             </div>
           </div>
             </s:form>
 		</div>   
 	</div> 
	</div>
	<s:include value="/WEB-INF/pages/common/footer.jsp"></s:include>
</body>
</html>