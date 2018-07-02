<%--
  Created by IntelliJ IDEA.
  User: WaneT
  Date: 2018/7/2
  Time: 0:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>

<c:set var="title" value="服务分类管理 - 属性管理 - 修改属性"/>
<%@include file="common/adminHeader.jsp" %>
<c:set var="light" value="3"/>
<%@include file="common/adminNavigator.jsp" %>


<div class="container" >
    <ol class="breadcrumb">
        <li><a href="../type/list">服务分类管理</a></li>
        <li><a href="../propertyService/list?cid=${propertyService.type.id}">${propertyService.type.name}</a></li>
        <li>${propertyService.name}</li>
    </ol>
</div>

<div class="container">
    <div class="row" >
        <div class="panel panel-default" style="width: 600px;margin:auto">
            <div class="panel-heading">编辑属性</div>
            <div class="panel-body">
                <form class="form-horizontal" method="get" id="add-form" action="update">
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">属性名字</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="name" name="name"
                                   placeholder="请输入属性名字" value="${propertyService.name}">
                        </div>
                        <input name="cid" value="${propertyService.type.id}" type="hidden">
                        <input name="id" value = "${propertyService.id}" type="hidden">
                    </div>
                    <div class="form-group">
                        <div style="text-align: center">
                            <button type="submit" class="btn btn-success btn-sm">保存</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

