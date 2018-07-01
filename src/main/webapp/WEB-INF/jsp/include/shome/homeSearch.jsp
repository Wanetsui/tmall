<%--
  Created by IntelliJ IDEA.
  User: WaneT
  Date: 2018/7/1
  Time: 16:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>


<script src="js/index.js"></script>

<header class="index-top">
    <div class="search">
        <form action="searchService" >
            <input type="text" value=" " name="keyword">
            <button class="search-button" type="submit">搜索</button>
        </form>
        <ul class="search-below">
            <c:forEach items="${types}" var="c" varStatus="vs">
                <c:if test="${vs.count>=1 and vs.count<=8}">
                    <li><a href="type?id=${c.id}">${c.name}</a></li>
                </c:if>
            </c:forEach>
        </ul>

    </div>

</header>