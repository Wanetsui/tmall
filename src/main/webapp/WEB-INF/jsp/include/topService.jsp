<%--
  Created by IntelliJ IDEA.
  User: WaneT
  Date: 2018/7/2
  Time: 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<c:if test="${!empty user}">
    <script>
        $(function() {
            $.get("cartNumber",function(result) {
                var number = Number(result);
                if(number>-1){
                    $("#cart-number").text(number);
                }
            });
            $("#logout").attr("href","logout?refer="+window.location.href);
        });

    </script>
</c:if>

<nav class="top">
    <div class="top-bar">
        <span class="top-left">
            <c:if test="${empty shome}">
                <span style="margin-left: 0"><span class=" glyphicon glyphicon-home redColor" style="margin-left: 0"></span><a href="./">首页</a></span>
            </c:if>
            <span>欢迎来到${website_name}</span>

            <c:if test="${!empty user}">
                ${user.name}
                <a href="#" id="logout">退出</a>
            </c:if>
            <c:if test="${empty user}">
                <a href="login" id="login">请登录</a>
                <a href="register">免费注册</a>
            </c:if>
        </span>

        <span class="pull-right">
            <c:if test="${!empty user}">
                <a href="myOrder">我的预约</a>
            </c:if>
            <a href="advance"><span class=" glyphicon glyphicon-book redColor"></span>
                预约列表<c:if test="${!empty user}"><strong id="cart-number">0</strong>个</c:if></a>
            <c:if test="${user.group=='admin' || user.group=='superAdmin'}">
                <a href="admin/">网站后台</a>
            </c:if>
        </span>
    </div>
</nav>