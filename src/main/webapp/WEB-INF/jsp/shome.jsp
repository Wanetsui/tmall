<%--
  Created by IntelliJ IDEA.
  User: WaneT
  Date: 2018/7/1
  Time: 16:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="title" value="家政服务首页 - ${website_name}" />
<%@include file="include/header.jsp"%>
<c:set var="home" value="home" />
<%@include file="include/top.jsp"%>
<%@include file="include/shome/homeSearch.jsp"%>
<%@include file="include/shome/homeCenter.jsp"%>
<%@include file="include/shome/homeBottom.jsp"%>
<%@include file="include/footer.jsp"%>