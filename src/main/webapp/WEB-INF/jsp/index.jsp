<%--
  Created by IntelliJ IDEA.
  User: WaneT
  Date: 2018/7/2
  Time: 10:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<c:set var="title" value="首页 - ${website_name}" />
<%@include file="include/header.jsp"%>
<c:set var="home" value="home" />

<!DOCTYPE HTML>
<html>
<head>
    <title>Home</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="css/main.css" />
</head>
<body>

<!-- Header -->
<header id="header">
    <div class="inner">
        <a href="index" class="logo"><strong>街坊四邻服务系统</strong>由15031215李怡萱设计完成</a>
        <nav id="nav">
            <a href="index">首页</a>
            <a href="login">登录</a>
            <a href="register">注册</a>
        </nav>
        <a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
    </div>
</header>

<!-- Banner -->
<section id="banner">
    <div class="inner">
        <header>
            <h1>欢迎来到街坊四邻服务系统</h1>
        </header>

        <div class="flex ">

            <div>
                <span class="icon fa-cart-plus"></span>
                <h3><a href="home">在线商城</a></h3>
                <p>坚果干果 时令蔬菜</p>
                <p>新鲜水果 五谷杂粮</p>
            </div>

            <div>
                <span class="icon fa-user"></span>
                <h3><a href="shome">家政服务</a></h3>
                <p>家电维修 保洁服务</p>
                <p>老人看护 宠物寄养</p>
            </div>

            <div>
                <span class="icon fa-file"></span>
                <h3> <a href="inform">社区信息</a></h3>
                <p>物业公告 社区通知</p>
                <p>二手物品 信息交流</p>
            </div>

        </div>

    </div>
</section>

<!-- Scripts -->
<script src="js/jquery.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/util.js"></script>
<script src="js/main.js"></script>

</body>
</html>
<%--
<!DOCTYPE html>
<html>
<head>
<style>
    h6{
        font-family: 华文行楷;
        font-size:100px;
        text-align:center;
        margin-top: 100px;
    }
    a{
        font-style: italic;
        font-size: 50px;
        font-family: 华文行楷;
        margin-top: 200px;
        text-align:center;
    }

</style>
</head>
<body style="background:url('/img/index.jpg') no-repeat;">
    <h6>街坊四邻系统</h6>
    <div class="a-menu">
        <span class="glyphicon glyphicon-link"></span>
        <a href="home">萱萱商城</a></li>
    </div>
    <div class="b-menu">
        <span class="glyphicon glyphicon-link"></span>
        <a href="shome">家政服务</a></li>
    </div>
    <div class="d-menu">
        <span class="glyphicon glyphicon-link"></span>
        <a href="information?currentPage=1">信息发布</a></li>
    </div>
</body>
</html>
--%>
