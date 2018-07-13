<%--
  Created by IntelliJ IDEA.
  User: WaneT
  Date: 2018/7/8
  Time: 17:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>

<c:set var="title" value="人员分配表"/>
<%@include file="common/adminHeader.jsp" %>



<div class="container" >
    <ol class="breadcrumb">
        <li class="active">人员分配表</li>
    </ol>
    <form action = "choice">
        <table class="table table-hover table-striped">
            <thead>
            <tr>
                <th scope="col">
                    #
                </th>
                <th scope="col">
                    姓名
                </th>
                <th scope="col">
                    性别
                </th>
                <th scope="col">
                    身份证号
                </th>
                <th scope="col">
                    服务类别
                </th>
                <th scope="col">
                    选择
                </th>
            </tr>
            </thead>
            <tbody>
            <jsp:useBean id="workers" scope="request" type="java.util.List"/>
            <c:forEach items="${workers}" var="item">
                <tr select="false" card ="${item.card}" catalog ="${item.catalog}" img ="${item.img}" name="${item.name}" gender="${item.gender}" id="${item.id}">
                    <th scope="row">${item.id}</th>
                    <td>${item.name}</td>
                    <td>${item.gender}</td>
                    <td>${item.card}</td>
                    <td>${item.catalog}</td>
                    <td><a href="assign?oid=${oid}&mobile=${mobile}&wname=${item.name}">分配</a></td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </form>
</div>

<%@include file="common/adminPage.jsp" %>
<%@include file="common/adminFooter.jsp" %>
