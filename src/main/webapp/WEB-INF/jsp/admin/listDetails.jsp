<%--
  Created by IntelliJ IDEA.
  User: WaneT
  Date: 2018/7/2
  Time: 0:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>

<c:set var="title" value="预约管理"/>
<%@include file="common/adminHeader.jsp" %>
<c:set var="light" value="5"/>
<%@include file="common/adminNavigator.jsp" %>


<div class="container" >
    <ol class="breadcrumb">
        <li>预约管理</li>
    </ol>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">状态</th>
            <th scope="col">订单金额</th>
            <%--<th scope="col">商品数量</th>--%>
            <th scope="col">买家名称</th>
            <th scope="col">创建时间</th>
            <th scope="col">支付时间</th>
            <th scope="col">预约时间</th>
            <th scope="col">确认结束时间</th>
            <th scope="col" width="120px">操作</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${detailses}" var="o" varStatus="vs">
            <tr>
                <th scope="row">${o.id}</th>
                <td>${o.statusText}</td>
                <td>${o.sum}</td>
                <%--<td>${o.totalNumber}</td>--%>
                <td>${o.user.name}</td>
                <td><fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                <td><fmt:formatDate value="${o.payDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                <td><fmt:formatDate value="${o.deliverDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                <td><fmt:formatDate value="${o.confirmDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                <td>
                    <button class="btn btn-primary btn-xs detail-btn">查看详情</button>
                    <c:if test="${o.statusEnum == 'waitDeliver'}">
                        <a href="deliver?oid=${o.id}">
                            <button class="btn btn-primary btn-xs">预约</button>
                        </a>
                    </c:if>
                </td>
            </tr>
            <tr  style="display: none">
                <td colspan="10" >
                    <div class="panel panel-default" style="width: 600px;margin:0 auto">
                        <div class="panel-heading">预约详情</div>
                        <div class="panel-body">
                            <table class="table table-striped">
                                <c:forEach items="${o.orderItems}" var="item" varStatus="vs">
                                    <tr>
                                        <td><img width="40px" height="40px" src="../../../${serviceImgDir}${item.service.image.path}"></td>
                                        <td>${item.service.name}</td>
                                        <td>${item.number}个</td>
                                        <td>价格${item.service.price}元</td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<%@include file="common/adminPage.jsp" %>

<%@include file="common/adminFooter.jsp" %>

