<%--
  Created by IntelliJ IDEA.
  User: WaneT
  Date: 2018/7/1
  Time: 18:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<script src="js/book.js"></script>
<main class="book">
    <form action = "buys">
        <div class="sum-top">
            <div class="pull-right">
                <span>已选商品（不含运费）</span>
                <span class="yen-small">￥</span>
                <span class="book-sum-price-small book-sum-price">0.00</span>
                <button class="crate-order-small crate-order">结 算</button>
            </div>
        </div>

        <table class="book-list">

            <thead>
            <tr>
                <th class="select-and-image">
                    <img src="img/noselect.png" class="select-img select-all" select="false">
                    <span>全选</span>
                </th>
                <th class="item-info">
                    服务信息
                </th>
                <th class="price-per">
                    价格
                </th>
                <th class="operation">
                    操作
                </th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${advance}" var="item">
                <tr select="false" stock="${item.service.stock}" buy = "${item.number}" price-per="${item.service.price}" ciid="${item.id}">
                    <input type="hidden" name="ciid" value="${item.id}">
                    <td>
                        <img src="img/noselect.png" class="select-img">
                        <img src="${serviceImgDir}${item.service.image.path}" class="book-item-jpg">
                    </td>
                    <td class="item-name">
                        <a class="book-item-title" href="service?id=${item.service.id}">${item.service.name}</a>
                        <div class="book-item-title-bottom">
                            <img title="支持信用卡支付" src="img/creditcard.png">
                            <img title="消费者保障服务,承诺如实描述" src="img/promise.png">
                        </div>
                    </td>
                    <td>
                        <span class="book-item-now-price">￥${item.service.price}</span>
                    </td>
                    <td>
                        <span class="book-item-sum">￥${item.sum}</span>
                    </td>
                    <td>
                        <a href="javascript:void(0);" class="delete-button" ciid="${item.id}">删除</a>
                    </td>
                </tr>
            </c:forEach>

            </tbody>
        </table>


        <div class="sum-bottom  clear">
            <img src="img/noselect.png" class="select-img select-all" select="false">
            <span>全选</span>
            <div class="pull-right">
            <span>
                已选服务
                <span class="book-num">0</span>
                个
            </span>
                <span class="sum-text">合计</span>
                <span class="yen-big">￥</span>
                <span class="book-sum-price book-sum-price-big">0.00</span>
                <button class="crate-order-big crate-order" type="submit">结 算</button>
            </div>
        </div>
    </form>

    <div class="modal" tabindex="-1" role="dialog" id="confirmModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-title">取消服务</div>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>

                <div class="confirm-content">确认要取消该服务吗？</div>
                <div class="button-group">
                    <button class="yes" id="confirmDelete">确定</button>
                    <button class="no" id="cancelDelete">取消</button>
                </div>
            </div>
        </div>
    </div>
</main>

