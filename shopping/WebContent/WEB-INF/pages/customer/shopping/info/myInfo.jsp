<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>个人资料</title>
</head>
<body>
	<s:include value="/WEB-INF/pages/common/header.jsp"></s:include>
	<div class="container container-fluid margin-20">
		<ul class="breadcrumb">
			<li><a href="${RES }"><i class="fa fa-home"></i></a></li>
			<li><a href="${RES }/customer/shopping/customer_shopping_myShopping.action">我的商城</a></li>
			<li><a href="#">个人资料</a></li>
		</ul>
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
				<input type="hidden" id="id" value="${customer.id }">
				<table style="width:50%;">
					<tr> 
					<td>头像</td>
					<td>
						<s:a action="customer_shopping_modifyHeadPortrait"
							namespace="/customer/shopping">
							<img src='${HEADSRC }${customer.headPortrait.path}' width="80" height="80" border="1">
						</s:a>
					</td>
					</tr>
					<tr>
						<td>用户名：</td>
						<td>${customer.username}</td>
					</tr>
					<tr>
						<td>真实姓名：</td>
						<td><input id="realName" type="text" disabled style="border:0" value="${customer.realname}"/></td>
					</tr>
					<tr>
						<td>性别：</td>
						<td id="sex">${ customer.sex}</td>
					</tr>
					<tr>
						<td>城市：</td>
						<td>
							<input id="city" type="text" disabled style="border:0" value="${customer.address}"/>
						</td>
					</tr>
					<tr>
					<td></td>
					<td></td>
					<td>
						<a id="editInfo" onclick="editInfo(this)" href="javaScript:;">修改资料</a>
						<a style="display:none" id="finish" onclick="finish(this)" href="javaScript:;">修改</a>&nbsp;&nbsp;
						<a style="display:none" id="handle" onclick="handle()" href="javaScript:;">取消</a>
						</td>
					</tr>
					<tr><td><br></td></tr>
					<tr>
						<td>手机号码：</td>
						<td>${customer.mobile}</td>
						<td><s:if test="customer.mobile != null"><a href="">解绑</a></s:if><s:else><a href="">绑定</a></s:else></td>
					</tr>
					<tr>
						<td>邮箱：</td>
						<td>${customer.email}</td>
						<td><s:if test="customer.email != null"><a href="">解绑</a></s:if><s:else><a href="">绑定</a></s:else></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<s:include value="/WEB-INF/pages/common/footer.jsp"></s:include>
	<script type="text/javascript">
	function editInfo(obj){
		var sexElement = $("#sex");
		var realNameElement= $("#realName");
		var cityElement = $("#city");
		realNameElement.removeAttr("disabled").css("border","1px solid #ccc");
		cityElement.removeAttr("disabled").css("border","1px solid #ccc");

		if(sexElement.text()=="男")
			sexElement.html("<input type='radio' name='sex' checked value='男'>男 &nbsp;<input type='radio' name='sex' value='女'>女&nbsp;<input  type='radio' name='sex' value='保密'>保密");
		else if(sexElement.text()=="女")
			sexElement.html("<input type='radio' name='sex' value='男'>男 &nbsp;<input type='radio' name='sex' checked value='女'>女&nbsp;<input  type='radio' name='sex' value='保密'>保密");
		else(sexElement.text()=="保密")
			sexElement.html("<input type='radio' name='sex' value='男'>男 &nbsp;<input type='radio' name='sex' value='女'>女&nbsp;<input checked type='radio' name='sex' value='保密'>保密");
		
		$(obj).css("display","none");
		$("#finish").css("display","inline-block");
		$("#handle").css("display","inline-block");
	}
	function finish(obj){
		var sex = $("#sex input:checked").val();
		var sexElement = $("#sex");
		var realNameElement= $("#realName");
		var cityElement = $("#city");
		var id = $("#id").val();
		console.log($(obj))
		realNameElement.attr("disabled","true").css("border","0");
		cityElement.attr("disabled","true").css("border","0");
		sexElement.html(sex);
		
		$(obj).css("display","none");
		$("#handle").css("display","none");
		$("#editInfo").css("display","inline-block");
		$.ajax({
		type : "POST",
		url : "/shopping/customer/shopping/customer_shopping_saveInfo",
		data : {
			"customer.id" : id,
			"customer.sex" : sex,
			"customer.realname" : realNameElement.val(),
			"customer.address":cityElement.val()
		},
		error : errorFunction, // 错误执行方法
		success : succFunction// 成功执行方法
		
	});
	function errorFunction() {

	}
	function succFunction(info) {
	}
		
	}
	
	function handle(){
		window.location.reload();
	}
	</script>
</body>
</html>