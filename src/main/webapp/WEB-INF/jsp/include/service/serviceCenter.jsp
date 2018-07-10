<%--
  Created by IntelliJ IDEA.
  User: WaneT
  Date: 2018/7/1
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="js/service.js"></script>

<section class="property">
    <div class="gallery">
        <div class="pic-border">
            <img src="${serviceImgDir}${serviceTopImages[0].path}" id="big-show">
        </div>
        <div class="pic-ls" id="pic-ls">
            <C:forEach items="${serviceTopImages}" var="img" varStatus="vs">
                <img src="${serviceImgDir}${img.path}" big-image="${serviceImgDir}${img.path}" class="sm-image ${vs.count == 1?'selected':''}">
            </C:forEach>
        </div>
        <div id="div4load" style="display:none;"></div>
    </div>
    <div class="detail">
        <div class="service-title">
            ${service.name}
        </div>
        <div class="price">
            <div class="middle-line">
                <span class="s-price left">价格</span>
                <span class="yen">￥</span><span class="s-price-num">${service.price}</span>
            </div>
        </div>
        <div class="history">
            <span class="m-sales item">订购服务数 <em>${service.saleCount}</em></span>
            <span class="t-score item">送积分 <em>${service.id*7}</em></span>
        </div>
        <div class="service-num">
            <input type="text" class="input" value="1" id="buy-number">
            <%--<span class="buy-num left">数量</span>
            <input type="text" class="input" value="1" id="buy-number">
            <span class="arrow">
                    <a class="increase-number" id="increase-number" href="#nowhere">
                    <span class="updown arrow-png">
                       <img src="img/increase.png">
                    </span>
                    </a>
                    <span class="updown-middle"> </span>
                    <a class="decrease-number" id="decrease-number" href="#nowhere">
                    <span class="updown arrow-png">
                        <img src="img/decrease.png">
                    </span>
                    </a>
                </span>
            <span class="piece">件</span>--%>
            <span class="inventory" id="inventory" stock="${service.stock}">人数${service.stock}人</span>
        </div>
        <div class="buy">
            <a href="buyOnes?pid=${service.id}" id="buy-link" class="display:none;"></a>
            <a href="addAdvance?pid=${service.id}" id="cart-link" class="display:none;"></a>
            <button class="buy-button" id="buy-button">立即购买</button>
            <button class="car-button" id="cart-button"><span class="glyphicon glyphicon-shopping-cart"></span>预约服务</button>
        </div>
        <%--<div class="service">
            <span class="left">服务承诺</span>
            <span>正品保证</span>
            <span>极速退款</span>
            <span>七天无理由退换</span>
        </div>--%>
    </div>
</section>
