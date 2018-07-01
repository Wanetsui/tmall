<%--
  Created by IntelliJ IDEA.
  User: WaneT
  Date: 2018/7/1
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="title" value="${service.name} - 服务 - ${website_name}" />
<%@include file="include/header.jsp"%>
<%@include file="include/top.jsp"%>
<%@include file="include/simpleSearchService.jsp"%>
<%@include file="include/service/serviceTop.jsp"%>
<%@include file="include/service/serviceCenter.jsp"%>
<%@include file="include/service/serviceBottom.jsp"%>
<%@include file="include/footer.jsp"%>
