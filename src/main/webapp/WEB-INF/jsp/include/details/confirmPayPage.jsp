<%--
  Created by IntelliJ IDEA.
  User: WaneT
  Date: 2018/7/1
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<main class="confirm-pay">
    <div class="buy-flow-img">
        <img src="img/buyflow_3.png">
    </div>
    <div class="buy-flow">
        <div class="buy-flow-time time-1">${details.createDate}</div>
        <div class="buy-flow-time time-2">${details.payDate}</div>
        <div class="buy-flow-time time-3">${details.deliverDate}</div>
    </div>
    <div class="agree-pay-text">我已接受，同意支付宝付款</div>
    <div class="bill-detail">
        <div class="bill-detail-title">订单信息</div>
        <table class="bill-detail-table">
            <thead>
            <tr>
                <th colspan="2">服务</th>
                <th>价格</th>
                <th>上门服务费用</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${details.detailsItems}" var="oi" varStatus="vs">
                <tr>
                    <td><img src="/img/service/${oi.service.image.path}"></td>
                    <td class="item-title"><a href="#nowhere">${oi.service.name}</a></td>
                    <td>￥${oi.service.price}</td>
                    <td>上门服务费用 0.00</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="bill-detail-sum">实付款： <span class="red-color">￥${details.sum}</span></div>
        <table class="pay-detail-table clear">
            <tbody>
            <tr>
                <td width="200px">订单编号：</td>
                <td>${details.orderCode} <img height="14px" src="img/tmall-small.png"></td>
            </tr>
            <tr>
                <td width="200px">卖家昵称：</td>
                <td>${website_name} <span class="wangwang"></span></td>
            </tr>
            <tr>
                <td width="200px">收货信息： </td>
                <td>${details.address}，${details.receiver}， ${details.mobile}</td>
            </tr>
            <tr>
                <td width="200px">成交时间：</td>
                <td>${details.createDate}</td>
            </tr>
            </tbody>
        </table>
        <div class="confirm-end">
            <div class="confirm-warning">请服务完成后再确认付款</div>
            <a href="confirmed?oid=${details.id}"><button class="confirm-button">确认支付</button></a>
        </div>
    </div>




</main>