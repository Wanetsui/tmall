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



<section class="head-bar">
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
</section>
