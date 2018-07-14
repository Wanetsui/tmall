<%--
  Created by IntelliJ IDEA.
  User: WaneT
  Date: 2018/7/1
  Time: 22:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>

<c:set var="title" value=" 服务管理 - 服务管理"/>
<%@include file="common/adminHeader.jsp" %>
<c:set var="light" value="3"/>
<%@include file="common/adminNavigator.jsp" %>


<div class="container" >
    <ol class="breadcrumb">
        <li><a href="../type/list">服务分类</a></li>
        <li>${type.name}</li>
        <li>服务管理</li>
    </ol>
    <table class="table table-hover table-striped">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">图片</th>
            <th scope="col">服务名称</th>
            <th scope="col">服务小标题</th>
            <th scope="col">价格</th>
            <%--<th scope="col">原价格</th>
            <th scope="col">现价格</th>--%>
            <th scope="col">人数</th>
            <th scope="col">图片管理</th>
            <th scope="col">设置属性值</th>
            <th scope="col">编辑</th>
            <th scope="col">删除</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${services}" var="p" varStatus="vs">
            <tr>
                <th scope="row">${p.id}</th>
                <td><img src="../../../${serviceImgDir}${p.image.path}" height="30px"></td>
                <td>${p.name}</td>
                <td>${p.subTitle}</td>
                <td>${p.price}</td>
                <%--<td>${p.originalPrice}</td>
                <td>${p.nowPrice}</td>--%>
                <td>${p.stock}</td>
                <td><a href="image/list?pid=${p.id}"><span class="glyphicon glyphicon-picture"></span></a></td>
                <td><a href="propertyServiceValue/edit?pid=${p.id}"><span class="glyphicon glyphicon-th-list"></span></a></td>
                <td><a href="edit?id=${p.id}"><span class="glyphicon glyphicon-edit"></span></a></td>
                <td><a href="delete?id=${p.id}" class="delete-button"><span class="glyphicon glyphicon-trash"></span></a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<%@include file="common/adminPage.jsp" %>

<div class="container">
    <div class="row" >
        <div class="panel panel-default" style="width: 600px;margin:auto">
            <div class="panel-heading">新增属性</div>
            <div class="panel-body">
                <form class="form-horizontal" method="get" id="add-form" action="add">
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">服务名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="name" name="name"
                                   placeholder="请输入服务名称">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="subTitle" class="col-sm-2 control-label">服务小标题</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="subTitle" name="subTitle"
                                   placeholder="请输入服务小标题">
                        </div>
                    </div>
                   <%-- <div class="form-group">
                        <label for="originalPrice" class="col-sm-2 control-label">原价格</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="originalPrice" name="originalPrice"
                                   placeholder="请输入原价格">
                        </div>
                    </div>--%>
                    <div class="form-group">
                        <label for="nowPrice" class="col-sm-2 control-label">价格</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="nowPrice" name="nowPrice"
                                   placeholder="请输入价格">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">人数</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="stock" name="stock"
                                   placeholder="请输入人数">
                        </div>
                    </div>

                    <input name="cid" value="${type.id}" type="hidden">
                    <div class="form-group">
                        <div style="text-align: center">
                            <button type="submit" class="btn btn-success btn-sm">新建服务</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

