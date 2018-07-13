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

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>人员分配</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />

    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/bootstrap-responsive.min.css" rel="stylesheet" />


    <link href="css/font-awesome.css" rel="stylesheet" />

    <link href="css/adminia.css" rel="stylesheet" />
    <link href="css/adminia-responsive.css" rel="stylesheet" />

    <link href="css/dashboard.css" rel="stylesheet" />


    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>

<body>

<div id="content">

    <div class="container">

        <div class="row">



            <div class="span9">

                <div class="widget widget-table">

                    <div class="widget-header">
                        <i class="icon-th-list"></i>
                        <h3>人员分配表</h3>
                    </div> <!-- /widget-header -->

                    <div class="widget-content">
                        <form action = "choice">
                            <table class="table table-striped table-bordered">
                                <thead>
                                <tr>
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
                                        <td class="action-td">
                                            <a href="assign?oid=${oid}&mobile=${mobile}&wname=${item.name}" class="btn btn-small btn-warning">
                                                <i class="icon-ok"></i>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>

                                </tbody>
                            </table>
                        </form>





                    </div> <!-- /widget-content -->

                </div> <!-- /widget -->

            </div> <!-- /span9 -->


        </div> <!-- /row -->

    </div> <!-- /container -->

</div> <!-- /content -->

<script src="js/jquery-1.7.2.min.js"></script>
<script src="js/excanvas.min.js"></script>
<script src="js/bootstrap.js"></script>


</body>
</html>
