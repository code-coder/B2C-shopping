<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>注册</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${RES}/css/bootstrap.css">
<link href="${RES}/css/style.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
<s:include value="../common/header.jsp"></s:include>
		 <!-- start main -->
    <div class="container mainBody">
            <div class="row">
             <div class="col-sm-3 "></div>
                <div class="col-sm-6 min-box">
                    <form id="regist-form" class="form-horizontal form-style" action="${RES }/customer/customer_save.action"  method="post">
                  <div class="form-group">
                  	<label id="message" style="color:red;font-size:16px;" class="col-sm-offset-3 col-sm-9"><s:fielderror></s:fielderror></label>
                  </div>
                  <div class="form-group">
                    <label for="name" class="col-sm-3 control-label">用户名</label>
                    <div class="col-sm-9">
                      <input type="text" name="customer.username" class="form-control" id="name" placeholder="请输入4-16位用户名">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputPassword1" class="col-sm-3 control-label">密&nbsp;&nbsp;&nbsp;码</label>
                    <div class="col-sm-9">
                      <input type="password" name="customer.password" class="form-control" id="password" placeholder="请输入6-16位密码">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputPassword3" class="col-sm-3 control-label">确认密码</label>
                    <div class="col-sm-9">
                      <input type="password" name="reLoginPassword" class="form-control" id="re_password" placeholder="再次输入密码">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="email" class="col-sm-3 control-label">邮箱</label>
                    <div class="col-sm-9">
                      <input type="email" name="customer.email" class="form-control" id="email" placeholder="请输入邮箱" required>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-9">
                      <a id="submit" class="btn btn-info" style="width: 206px;" href="javascript:;">注&nbsp;&nbsp;&nbsp;册</a></button>
                    </div>
                  </div>
                    </form>
                </div>
            </div>
             <div class="col-sm-3 "></div>
        </div>
        <s:include value="../common/footer.jsp"></s:include>
</body>
<script type="text/javascript">
$(function () {
	var is_name_valid = false;
	var is_password_valid = false;
	var is_re_password_valid = false;
	var is_email_valid = false;
	var messageEl = $("#message");
	var emailReg = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
	var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？]"); 
	
	$("#name").blur(function(){
	var name = $("#name").val();
		if(name.length<4){
		messageEl.text("用户名小于4位！");
		is_name_valid = false;
		return;
		}
		if(name.length>16){
			messageEl.text("用户名太长！");
			is_name_valid = false;
			return;
		}
		if(pattern.test(name)){
			messageEl.text("用户名含有非法字符！");
			is_name_valid = false;
			return;
		}
		messageEl.text("");
		is_name_valid = true;
	})
	$("#password").blur(function(){
	
	var password = $("#password").val();
		if(password.length<6){
			messageEl.text("密码太短！");
			is_password_valid = false;
			return;
		}
		if(password.length>16){
			messageEl.text("密码过长！");
			is_password_valid = false;
			return;
		}
		messageEl.text("");
	
		is_password_valid = true;
	})
	
	$("#re_password").blur(function(){
	var password = $("#password").val();
	var re_password = $("#re_password").val();
		if(password!=re_password){
			messageEl.text("两次密码不一致！请确认！");
			is_re_password_valid = false;
			return;
		}
		messageEl.text("");
		is_re_password_valid = true;
	
	})
	
	$("#email").blur(function(){
		var email = $("#email").val();
		if(!emailReg.test(email)){
			messageEl.text("邮箱格式不正确！请确认！");
			is_email_valid = false;
			return;
		}
		messageEl.text("");
		is_email_valid = true;
	})
	$("#submit").click(function verify(){
		if(is_name_valid && is_password_valid && is_re_password_valid && is_email_valid){
			$("#regist-form").submit();
		}else
			alert("填写信息有误！请确认！");
	})

})

</script>
</html>