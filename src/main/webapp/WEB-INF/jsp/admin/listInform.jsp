<%--
  Created by IntelliJ IDEA.
  User: WaneT
  Date: 2018/7/10
  Time: 21:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>

<c:set var="title" value="公告管理"/>
<%@include file="common/adminHeader.jsp" %>
<c:set var="light" value="7"/>
<%@include file="common/adminNavigator.jsp" %>


<div class="container" >
    <ol class="breadcrumb">
        <li class="active">公告管理</li>
    </ol>
    <table class="table table-hover table-striped">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">标题</th>
            <th scope="col">内容</th>
            <th scope="col">删除</th>
        </tr>
        </thead>
        <tbody>
        <jsp:useBean id="informations" scope="request" type="java.util.List"/>
        <c:forEach items="${informations}" var="c" varStatus="vs">
            <tr>
                <th scope="row">${c.id}</th>
                <td>${c.title}</td>
                <td>${c.info}</td>
                <td><a href="delete?id=${c.id}" class="delete-button"><span class="glyphicon glyphicon-trash"></span></a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<%@include file="common/adminPage.jsp" %>
<%@include file="common/adminFooter.jsp" %>
