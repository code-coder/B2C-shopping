<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
                <form class="form-horizontal form-style" method="post" action="${RES }/customer/customer_login.action">
              <div class="form-group">
                  	<label id="message" style="color:red;font-size:16px;" class="col-sm-offset-2 col-sm-9"><s:fielderror></s:fielderror></label>
                  </div>
              <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">账号</label>
                <div class="col-sm-10">
                  <input type="text" name="customer.username" class="form-control" id="inputEmail3" placeholder="请输入账号">
                </div>
              </div>
              <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
                <div class="col-sm-10">
                  <input type="password" name="customer.password" class="form-control" id="inputPassword3" placeholder="请输入密码">
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox"> 记住密码
                    </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="${RES }/customer/customer_regist.action">没有账号？点我注册</a>
                    <a style="float:right" href="${RES }/customer/customer_findPassword.action">忘记密码？</a>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                  <button type="submit" class="btn btn-info" style="width: 206px;">登录</button>
                </div>
              </div>
                </form>
            </div>
        </div>
         <div class="col-sm-3 "></div>
    </div>
<s:include value="../common/footer.jsp"></s:include>

</body>

</html>
