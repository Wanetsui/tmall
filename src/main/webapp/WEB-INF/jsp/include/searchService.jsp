<%--
  Created by IntelliJ IDEA.
  User: WaneT
  Date: 2018/7/1
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<header class="search">
    <div class="search">
        <form action="searchService" >
            <input type="text" placeholder="搜索 ${website_name} 服务类型/服务" name="keyword">
            <button class="search-button" type="submit">搜索</button>
        </form>
        <ul class="search-below">
            <c:forEach items="${cs}" var="c" varStatus="vs">
                <li><a href="type?id=${c.id}">${c.name}</a></li>
            </c:forEach>
        </ul>

    </div>

</header>