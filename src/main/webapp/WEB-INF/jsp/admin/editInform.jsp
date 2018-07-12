<%--
  Created by IntelliJ IDEA.
  User: WaneT
  Date: 2018/7/12
  Time: 22:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>

<c:set var="title" value="编辑信息"/>
<%@include file="common/adminHeader.jsp" %>
<c:set var="light" value="7"/>
<%@include file="common/adminNavigator.jsp" %>
<div class="container" >
    <ol class="breadcrumb">
        <li><a href="../inform/list">信息标题</a></li>
        <li>${information.title}</li>
    </ol>
</div>
<div class="container">
    <h4 class="page-header">编辑信息</h4>
    <div class="row" >
        <div class="panel panel-default" style="width: 600px;margin:0 auto">
            <div class="panel-heading">编辑信息</div>
            <div class="panel-body">
                <form class="form-horizontal" method="post" id="add-form" action="update" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">信息标题</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="name" name="name"
                                   placeholder="请输入信息标题" value="${information.title}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="recommend" class="col-sm-2 control-label">信息内容</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="recommend" name="recommend"
                                   placeholder="默认为0不推荐，首页不显示产品大图。优先级越高排越前" value="${information.info}">
                        </div>
                    </div>
                    <input type="hidden" name="id" value="${information.id}">

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
<script>
    function checkEmpty(id,name){
        var value = $('#'+id).val();
        if(value.length===0){
            alert(name+"不能为空");
            $("#"+id)[0].focus();
            return false;
        }
        return true;
    }
    $(function(){
        $("#add-form").submit(function () {
            if(!checkEmpty("name","分类名称")){
                return false;
            }
        });
        $(".delete-button").click(function () {
            return !!confirm("确实删除？");
        });
    });
</script>
<%@include file="common/adminFooter.jsp" %>