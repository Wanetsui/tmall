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
    <table  border="0" cellspacing="0" cellpadding="0"  width="900px">
        <tr>
            <td class="td2">
                <span>第${requestScope.pagemsg.currPage }/ ${requestScope.pagemsg.totalPage}页</span>&nbsp;&nbsp;
                <span>总记录数：${requestScope.pagemsg.totalCount }&nbsp;&nbsp;每页显示:${requestScope.pagemsg.pageSize}</span>&nbsp;&nbsp;
                <span>
       <c:if test="${requestScope.pagemsg.currPage != 1}">
           <a href="information?currentPage=1">[首页]</a>&nbsp;&nbsp;
           <a href="information?currentPage=${requestScope.pagemsg.currPage-1}">[上一页]</a>&nbsp;&nbsp;
       </c:if>

       <c:if test="${requestScope.pagemsg.currPage != requestScope.pagemsg.totalPage}">
           <a href="information?currentPage=${requestScope.pagemsg.currPage+1}">[下一页]</a>&nbsp;&nbsp;
           <a href="information?currentPage=${requestScope.pagemsg.totalPage}">[尾页]</a>&nbsp;&nbsp;
       </c:if>
   </span>
            </td>
        </tr>
    </table>
</main>

