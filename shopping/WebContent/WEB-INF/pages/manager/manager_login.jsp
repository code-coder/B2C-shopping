<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${RES}/css/bootstrap/css/bootstrap.min.css">
<link id="color_scheme" href="${RES}/css/theme.css" rel="stylesheet">
<link href="${RES}/css/responsive.css" rel="stylesheet">
<title>管理员登陆</title>
</head>
<body>
<!-- Header center -->
<div class="header-center left">
	<div class="container">
		<div class="row">
			<!-- Logo -->
			<div class="navbar-logo col-md-3 col-sm-12 col-xs-12">
				<a href="${RES }"><img src="${RES}/image/demo/logos/theme_logo.png" title="Your Store" alt="Your Store" /></a>
			</div>
			<!-- //end Logo -->
			<h1 class="col-sm-offset-2 col-sm-3 search-pro">管理员登陆界面</h1>
		</div>

	</div>
</div>
	 <div class="container mainBody">
        <div class="row">
         <div class="col-sm-3 "></div>
            <div class="col-sm-6 ">
                <form class="form-horizontal form-style" method="post" action="${RES }/manager/manager_login.action">
              <div class="form-group">
                  	<label id="message" style="color:red;font-size:16px;" class="col-sm-offset-2 col-sm-9"><s:fielderror></s:fielderror></label>
                  </div>
              <div class="form-group">
                <label for="inputEmail3" class="col-sm-3 control-label">管理员账号</label>
                <div class="col-sm-9">
                  <input type="text" name="manager.username" class="form-control" id="inputEmail3" placeholder="请输入管理员账号">
                </div>
              </div>
              <div class="form-group">
                <label for="inputPassword3" class="col-sm-3 control-label">密码</label>
                <div class="col-sm-9">
                  <input type="password" name="manager.password" class="form-control" id="inputPassword3" placeholder="请输入密码">
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-offset-3 col-sm-9">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox"> 记住密码
                    </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  </div>
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-offset-3 col-sm-9">
                  <button type="submit" class="btn btn-info" style="width: 206px;">登录</button>
                </div>
              </div>
                </form>
            </div>
        </div>
         <div class="col-sm-3 "></div>
    </div>
</body>
</html>