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


<main class="index">
    <c:forEach items="${types}" var="c" varStatus="vs">
        <c:if test="${c.recommend > 0}">
            <div class="services">
                <div class="title-bar">
                    <i class="color-mark"></i>
                    <span class="type-title">${c.name}</span>
                </div>

                <div class="service-items">
                    <c:forEach items="${c.services}" var="p" varStatus="vs">
                        <a href="service?id=${p.id}">
                            <div class="item">
                                <img src="${serviceImgDir}${p.image.path}">
                                <div class="item-title">${p.name}</div>
                                <div class="item-price">￥${p.price}</div>
                            </div>
                        </a>
                    </c:forEach>
                </div>
            </div>
        </c:if>
    </c:forEach>
</main>