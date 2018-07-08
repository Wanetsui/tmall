<%--
  Created by IntelliJ IDEA.
  User: WaneT
  Date: 2018/7/8
  Time: 17:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>

<main class="choice">
    <form action = "choice">
        <table class="choice-list">
            <thead>
            <tr>
                <th class="item-image">
                    照片
                </th>
                <th class="item-name">
                    姓名
                </th>
                <th class="glyphicon-envelope">
                    性别
                </th>
                <th class="glyphicon-credit-card">
                    身份证号
                </th>
                <th class="typeahead">
                    服务类别
                </th>
                <th class="checkbox">
                     选择
                </th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${workers}" var="item">
                <tr select="false" card ="${item.card}" catalog ="${item.catalog}" img ="${item.img}" name="${item.name}" gender="${item.gender}" id="${item.id}">
                    <input type="hidden" name="id" value="${item.id}">
                    <td>
                        <span class="img-circle">${item.img}</span>
                    </td>
                    <td>
                        <span class="item-name">${item.name}</span>
                    </td>
                    <td>
                        <span class="glyphicon-envelope">${item.gender}</span>
                    </td>
                    <td>
                        <span class="glyphicon-credit-card">${item.card}</span>
                    </td>
                    <td>
                        <span class="typeahead">${item.catalog}</span>
                    </td>
                    <td>
                       <a href=""></a>
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

