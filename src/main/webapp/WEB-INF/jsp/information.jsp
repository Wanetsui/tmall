<%--
  Created by IntelliJ IDEA.
  User: WaneT
  Date: 2018/7/5
  Time: 17:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>

<main class="info">
    <form action = "info">
        <table class="info-list">
            <thead>
            <tr>
                <th class="item-title">
                    标题
                </th>
                <th class="list-group-item-info">
                    具体信息
                </th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${informations}" var="item">
                <tr select="false" title="${item.title}" info="${item.info}" id="${item.id}">
                    <input type="hidden" name="id" value="${item.id}">
                    <td>
                        <span class="item-title">￥${item.title}</span>
                    </td>
                    <td>
                        <span class="list-group-item-info">￥${item.info}</span>
                    </td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </form>
</main>

