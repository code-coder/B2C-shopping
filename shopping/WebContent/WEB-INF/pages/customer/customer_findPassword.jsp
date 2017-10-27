<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>重置密码</title>
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
                <form class="form-horizontal form-style" action="${RES }/customer/customer_resetPassword.action">
              <div class="form-group">
                <label for="inputEmail3" class="col-sm-3 control-label">手机号:</label>
                <div class="col-sm-9">
                  <input type="text" name="mobile" class="form-control" id="inputEmail3" placeholder="请输入手机号">
                </div>
              </div>
              <div class="form-group">
            <label class="col-sm-3 control-label">验证码:</label>
            <div class="col-sm-9">
                <div class="col-sm-8" style="padding-left:0">
                    <input type="text" name="userYzm" class="form-control" id="userYzm" placeholder="请输入验证码"/>
                </div>
                <span class="btn btn-primary" id="send">发送</span>
                <span id="message" class="message"></span>
            </div>
            </div>
            <div class="form-group">
                <label for="inputEmail3" class="col-sm-3 control-label">新密码:</label>
                <div class="col-sm-9">
                  <input type="text" name="password" class="form-control" id="inputEmail3" placeholder="输入新密码"/>
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-offset-3 col-sm-10">
                  <button type="submit" class="btn btn-info" style="width: 206px;">确定</button>
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
