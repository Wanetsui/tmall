<%--
  Created by IntelliJ IDEA.
  User: xen
  Date: 2017/12/3
  Time: 16:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="navbar navbar-default clearfix">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">系统后台</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="${light==1?'active':''}"><a  href="../user/list">用户信息</a></li>
                <li class="${light==2?'active':''}"><a  href="../category/list">商品管理</a></li>
                <li class="${light==3?'active':''}"><a href="../type/list">服务管理</a></li>
                <li class="${light==4?'active':''}"><a href="../order/list">商品订单</a></li>
                <li class="${light==5?'active':''}"><a href="../details/list">服务预约</a></li>
                <li class="${light==6?'active':''}"><a href="../config/edit">网站设置</a></li>
                <li class="${light==7?'active':''}"><a href="../inform/list">公告管理</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class=""><a href="../../../" target="_blank" >系统前台</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>
