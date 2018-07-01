<%--
  Created by IntelliJ IDEA.
  User: WaneT
  Date: 2018/7/1
  Time: 16:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="js/search.js"></script>

<section class="select-bar">
    <a href="?id=${type.id}" class="${empty param.sort?'selected':''}">综合<span class="glyphicon glyphicon-arrow-down"></span></a>
    <a href="?id=${type.id}&sort=date" class="${param.sort=='date'?'selected':''}">新品<span class="glyphicon glyphicon-arrow-down"></span></a>
    <a href="?id=${type.id}&sort=saleCount" class="${param.sort=='saleCount'?'selected':''}">销量<span class="glyphicon glyphicon-arrow-down"></span></a>
    <a href="?id=${type.id}&sort=${param.sort=='price'?'priceInverse':'price'}" class="${(param.sort=="price"||param.sort=="priceInverse")?'selected':''}">价格<span class="glyphicon glyphicon-resize-vertical"></span></a>
    <span class="price">
        <input type="text" placeholder="￥请输入" class="sortBarPrice beginPrice" id="low_price">
        <span>-</span>
        <input type="text" placeholder="￥请输入" class="sortBarPrice beginPrice" id="high_price">
    </span>
</section>

<%@include file="commonPage.jsp"%>