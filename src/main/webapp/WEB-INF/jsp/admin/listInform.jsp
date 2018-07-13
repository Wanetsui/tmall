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
            <th scope="col">编辑</th>
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
                <td><a href="edit?id=${c.id}"><span class="glyphicon glyphicon-edit"></span></a></td>
                <td><a href="delete?id=${c.id}" class="delete-button"><span class="glyphicon glyphicon-trash"></span></a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<%@include file="common/adminPage.jsp" %>
<div class="container">
    <div class="row" >
        <div class="panel panel-default" style="width: 650px;margin:auto">
            <div class="panel-heading">添加信息</div>
            <div class="panel-body">
                <form class="form-horizontal" method="post" id="add-form" action="add" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="subject" class="col-sm-2 control-label">标题</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="subject" name="subject"
                                   placeholder="请输入标题">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="message" class="col-sm-2 control-label">内容</label>
                        <div class="col-sm-10">
                            <textarea type="text" class="form-control" id="message" name="message"
                                      placeholder="请输入内容  "></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="recommend" class="col-sm-2 control-label">分类板块</label>
                        <div class="col-sm-10">
                            <select id="recommend" name="recommend" class="form-control">
                                <option>物业公告</option>
                                <option>社区通知</option>
                                <option>二手出售</option>
                                <option>社区交流</option>
                            </select>
                            <%--<input type="text" class="form-control" id="recommend" name="recommend"
                                   placeholder="1物业公告 2社区通知 3二手出售 4社区交流" value="0">--%>
                        </div>
                    </div>

                    <div class="form-group">
                        <div style="text-align: center">
                            <button type="submit" class="btn btn-success btn-sm">添加信息</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%@include file="common/adminFooter.jsp" %>
