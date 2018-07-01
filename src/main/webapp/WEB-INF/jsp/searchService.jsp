<%--
  Created by IntelliJ IDEA.
  User: WaneT
  Date: 2018/7/1
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="title" value="${keyword}的搜索结果 - 搜索 - ${website_name}" />
<%@include file="include/header.jsp"%>
<%@include file="include/top.jsp"%>
<%@include file="include/searchService.jsp"%>
<%@include file="include/type/searchPage.jsp"%>
<%@include file="include/footer.jsp"%>