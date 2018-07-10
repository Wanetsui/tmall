<%--
  Created by IntelliJ IDEA.
  User: WaneT
  Date: 2018/7/9
  Time: 20:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>

<main class="info">
    <form action = "publish">
        <p><label >标题：</label><input type="text" name="title"/></p>
        <p><label >内容：</label><input type="text" name="context"/></p>
        <input type="submit" value="Submit">提交
    </form>
</main>
