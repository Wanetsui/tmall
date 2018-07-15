<%--
  Created by IntelliJ IDEA.
  User: WaneT
  Date: 2018/7/14
  Time: 9:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="">
    <meta name="description" content="">

    <title>社区公告</title>
    <!-- stylesheet css -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/nivo-lightbox.css">
    <link rel="stylesheet" href="css/nivo_themes/default/default.css">
    <link rel="stylesheet" href="css/sstyle.css">
    <!-- google web font css -->
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,300,600,700' rel='stylesheet' type='text/css'>

</head>
<body data-spy="scroll" data-target=".navbar-collapse">
<%
    String str = request.getParameter("catalog");
    Integer catalog = Integer.parseInt(str);
%>
<!-- navigation -->
<div class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon icon-bar"></span>
                <span class="icon icon-bar"></span>
                <span class="icon icon-bar"></span>
            </button>
            <a href="index" class="navbar-brand smoothScroll">街坊四邻服务系统</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="readmore?catalog=1" <%--class="smoothScroll"--%>>物业公告</a></li>
                <li><a href="readmore?catalog=2" >社区通知</a></li>
                <li><a href="readmore?catalog=3" >二手出售</a></li>
                <li><a href="readmore?catalog=4" >失物招领</a></li>
                <li><a href="gopublish" >我要发布</a></li>
            </ul>
        </div>
    </div>
</div>

<!-- divider section -->
<div class="container">
    <div class="row">
        <div class="col-md-1 col-sm-1"></div>
        <div class="col-md-10 col-sm-10">
            <hr>
        </div>
        <div class="col-md-1 col-sm-1"></div>
    </div>
</div>

<!-- pricing section -->
<div id="wuye">
    <div class="container">
        <div class="row">
            <c:if test="catalog==1">
                <div class="col-md-12 col-sm-12">
                    <h2>物业公告</h2>
                </div>
            </c:if>
            <c:if test="catalog==2">
                <div class="col-md-12 col-sm-12">
                    <h2>社区通知</h2>
                </div>
            </c:if>
            <c:if test="catalog==3">
                <div class="col-md-12 col-sm-12">
                    <h2>二手出售</h2>
                </div>
            </c:if>
            <c:if test="catalog==4">
                <div class="col-md-12 col-sm-12">
                    <h2>失物招领</h2>
                </div>
            </c:if>
            <div class="search">
    <form action="searchInfo" >
        <input type="text" value=" " name="keyword">
        <button class="search-button" type="submit">搜索</button>
    </form>
</div>
            <div class="col-md-12 col-sm-18 col-xs-30">
                <div class="plan">
                    <%-- <div class="plan-title">
                         <h3>物业公告</h3>
                     </div>--%>
                    <form action = "info">
                        <table class="info-list">
                            <thead>
                            <tr>
                                <th class="item-title">
                                    标题
                                </th>
                                <%--<th class="item-title">
                                    内容
                                </th>--%>
                                <th class="list-group-item-info">
                                    发布时间
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${informations}" var="item" >
                                <c:if test="'<%=catalog%>==1'">
                                <c:if test="${item.catalog==1 }">
                                    <tr select="false" title="${item.title}" info="${item.info}" createTime="${item.createTime}" id="${item.id}">
                                        <input type="hidden" name="id" value="${item.id}">
                                        <td>
                                            <span class="item-title"><a href="#">${item.title}</a></span>
                                        </td>
                                            <%--<td>
                                                <span class="item-title"> <a href="#">${item.info}</span>
                                            </td>--%>
                                        <td>
                                            <span class="list-group-item-info">${item.createTime}</span>
                                        </td>
                                    </tr>
                                </c:if>
                                </c:if>
                                <c:if test="'<%=catalog%>==2'">
                                <c:if test="${item.catalog==2 }">
                                    <tr select="false" title="${item.title}" info="${item.info}" createTime="${item.createTime}" id="${item.id}">
                                        <input type="hidden" name="id" value="${item.id}">
                                        <td>
                                            <span class="item-title"><a href="#">${item.title}</a></span>
                                        </td>
                                            <%--<td>
                                                <span class="item-title"> <a href="#">${item.info}</span>
                                            </td>--%>
                                        <td>
                                            <span class="list-group-item-info">${item.createTime}</span>
                                        </td>
                                    </tr>
                                </c:if>
                                </c:if>
                                <c:if test="'<%=catalog%>==3'">
                                <c:if test="${catalog==3 and item.catalog==3 }">
                                    <tr select="false" title="${item.title}" info="${item.info}" createTime="${item.createTime}" id="${item.id}">
                                        <input type="hidden" name="id" value="${item.id}">
                                        <td>
                                            <span class="item-title"><a href="#">${item.title}</a></span>
                                        </td>
                                            <%--<td>
                                                <span class="item-title"> <a href="#">${item.info}</span>
                                            </td>--%>
                                        <td>
                                            <span class="list-group-item-info">${item.createTime}</span>
                                        </td>
                                    </tr>
                                </c:if>
                                </c:if>
                                <c:if test="'<%=catalog%>==3'">
                                <c:if test="${catalog==4 and item.catalog==4 }">
                                    <tr select="false" title="${item.title}" info="${item.info}" createTime="${item.createTime}" id="${item.id}">
                                        <input type="hidden" name="id" value="${item.id}">
                                        <td>
                                            <span class="item-title"><a href="#">${item.title}</a></span>
                                        </td>
                                            <%--<td>
                                                <span class="item-title"> <a href="#">${item.info}</span>
                                            </td>--%>
                                        <td>
                                            <span class="list-group-item-info">${item.createTime}</span>
                                        </td>
                                    </tr>
                                </c:if>
                                </c:if>
                            </c:forEach>

                            </tbody>
                        </table>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>


<!-- javascript js -->
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/nivo-lightbox.min.js"></script>
<script src="js/smoothscroll.js"></script>
<script src="js/jquery.nav.js"></script>
<script src="js/isotope.js"></script>
<script src="js/imagesloaded.min.js"></script>
<script src="js/custom.js"></script>

</body>
</html>
