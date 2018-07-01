<%--
  Created by IntelliJ IDEA.
  User: WaneT
  Date: 2018/7/1
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<main class="service-content">
    <div class="service-bar">
        <div class="service-select selected" href="#nowhere" id="button-1">
            <a href="#nowhere">服务详情</a>
        </div>
    </div>
    <div class="clear" id="main-1">
        <div class="service-top">
            <%--<div class="service-key-title">产品参数：</div>
            <ul class="service-key">
                <c:forEach items="${propertyValues}" var="p" varStatus="vs">
                    <li>${p.property.name}: ${p.value}</li>
                </c:forEach>
            </ul>--%>
        </div>
        <div class="service-content-part">
            <c:forEach items="${serviceDetailImages}" var="img" varStatus="vs">
                <img src="${serviceImgDir}${img.path}">
            </c:forEach>
        </div>
    </div>
   <%-- <div class="clear" id="main-2" style="display: none;">
        <table class="comment">
            <c:forEach items="${comments}" var="c" varStatus="vs">
                <tr>
                    <td class="comment-left">${c.content}
                        <span class="date">${c.createDate}</span></td>
                    <td class="comment-right">${c.user.name}<span class="annoy">（匿名）</span></td>
                </tr>
            </c:forEach>
        </table>
    </div>--%>
</main>