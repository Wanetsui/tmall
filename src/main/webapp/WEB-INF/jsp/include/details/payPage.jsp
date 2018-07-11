<%--
  Created by IntelliJ IDEA.
  User: WaneT
  Date: 2018/7/1
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<main class="pay-page">
    <div class="pay-tip">扫一扫付款</div>
    <div class="pay-num">￥${details.sum}</div>
    <img src="img/alipay.png" class="alipay-img">
    <a href="payedHome?oid=${details.id}"><button class="confirm-pay">确认支付</button></a>
</main>

