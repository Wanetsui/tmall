<%--
  Created by IntelliJ IDEA.
  User: WaneT
  Date: 2018/7/1
  Time: 16:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>


<section class="head-bar">
    <div class="c-menu">
        <span class="glyphicon glyphicon-th-list icon"></span>
        <span>服务分类</span>
    </div>
    <div class="r-menu">
        <c:forEach items="${types}" var="c" varStatus="vs">
            <c:if test="${vs.count>=1 and vs.count<=4}">
                <a href="type?id=${c.id}">${c.name}</a>
            </c:if>
        </c:forEach>
    </div>
</section>

<section class="carousel">
    <div data-ride="carousel" class="carousel-of-service carousel slide" id="carousel-of-service" >
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li class="active" data-slide-to="0" data-target="#carousel-of-service"></li>
            <li data-slide-to="1" data-target="#carousel-of-service" class=""></li>
            <li data-slide-to="2" data-target="#carousel-of-service" class=""></li>
            <li data-slide-to="3" data-target="#carousel-of-service" class=""></li>
        </ol>
        <!-- Wrapper for slides -->
        <div role="listbox" class="carousel-inner">
            <div class="item active">
                <a href="/service?id=28" target="_blank">
                    <img src="img/5.jpg" class="carousel carousel-image">
                </a>
            </div>
            <div class="item">
                <a href="/service?id=14" target="_blank">
                    <img src="img/6.jpg" class="carousel-image">
                </a>
            </div>
            <div class="item">
                <a href="/service?id=33" target="_blank">
                    <img src="img/7.jpg" class="carousel-image">
                </a>
            </div>
            <div class="item">
                <a href="/service?id=40" target="_blank">
                    <img src="img/8.jpg" class="carousel-image">
                </a>
            </div>
        </div>

        <div class="m-menu">
            <ul>
                <c:forEach items="${types}" var="c" varStatus="vs">
                    <c:if test="${vs.count>=1 and vs.count<=13}">
                        <li cid="${c.id}"><span class="glyphicon glyphicon-link"></span><a href="type?id=${c.id}">${c.name}</a></li>
                    </c:if>
                </c:forEach>
            </ul>
        </div>
        <c:forEach items="${types}" var="c" varStatus="vs">
            <div class="d-menu" cid="${c.id}" style="display: none">
                <c:forEach items="${c.services}" var="p" varStatus="vs">
                    <a href="service?id=${p.id}">${p.subTitle}</a>
                </c:forEach>
            </div>
        </c:forEach>
    </div>

</section>
