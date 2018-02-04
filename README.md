# B2C-shopping

这是我的大学毕业设计。本项目是一个基于SSH框架和MYSQL开发的一个B2C网上购物网站。功能相对还比较齐全，包括了客户端和后管，只是有些功能还不够完善，当时是一边实习一边开发的。
传送门 👉 [屠龙宝刀，点击就送](http://www.miaodou.xin/shopping)

##  环境及开发工具
项目运行环境为：jdk 1.8.0_144、tomcat 8.0、mysql Ver 14.14 Distrib 5.7.20
低版本没测过，估计jdk1.6+、tomcat 6+没问题。

我最开始是使用**MyEclipse**开发的。后来公司统一使用**IntelliJ Idea**后，我又把项目移到了IntelliJ上，不得不说IntelliJ真好用。
导入项目没有什么难点，如果是使用了IntelliJ的，那么应该没有什么难度。

##  项目介绍
整个项目分为四个部分：shopping、shopping-core、shopping-impl、shopping-lib。
*  shopping: 项目入口，包括web.xml、applicationContext.xml、struts.xml
*  shopping-core: dao接口、service接口以及实体类
*  shopping-impl: dao和service的实现类
*  shopping-lib: 本项目需要的jar包

## 数据库

db_shop.sql 是数据库的sql文件，里面还有一些数据，在mysql中直接执行就可以了。
