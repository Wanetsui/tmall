<%--
  Created by IntelliJ IDEA.
  User: WaneT
  Date: 2018/7/1
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<main class="search">
    <div class="items">
        <c:forEach items="${services}" var="p" varStatus="vs">
            <a href="service?id=${p.id}">
                <div class="border" price="${p.price}">
                    <div class="item">
                        <div class="content">
                            <img class="item-img" src="/img/service/${p.image.path}">
                            <div class="item-price">
                                ￥${p.price}
                            </div>
                            <div class="item-title">
                                    ${p.name}
                            </div>
                            <div class="item-shop">
                            </div>
                            <div class="item-bottom">
                        <span>
                            月成交<em>${p.saleCount}笔</em>
                        </span>
                                <span><img src="img/wangwang.png"></span>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </c:forEach>
        <c:if test="${empty services}">
            <div class="no-match">没有满足条件的产品</div>
        </c:if>
    </div>
</main>
