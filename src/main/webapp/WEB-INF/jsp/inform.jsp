
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
                <li><a href="#wuye" class="smoothScroll">物业公告</a></li>
                <li><a href="#tongzhi" class="smoothScroll">社区通知</a></li>
                <li><a href="#ershou" class="smoothScroll">二手出售</a></li>
                <li><a href="#jiaoliu" class="smoothScroll">社区交流</a></li>
                <li><a href="#contact" class="smoothScroll">我要发布</a></li>
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
</div> -->

<!-- pricing section -->
<div id="wuye">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <h2>物业公告</h2>
            </div>
            <div class="col-md-12 col-sm-18 col-xs-30">
                <div class="plan">
                    <div class="plan-title">
                        <h3>物业公告</h3>
                    </div>
                    <form action = "info">
                        <table class="info-list">
                            <thead>
                            <tr>
                                <th class="item-title">
                                    标题
                                </th>
                                <th class="item-title">
                                    内容
                                </th>
                                <th class="list-group-item-info">
                                    发布时间
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${informations}" var="item" >
                                <c:if test="${item.catalog==1}">
                                <tr select="false" title="${item.title}" info="${item.info}" createTime="${item.createTime}" id="${item.id}">
                                    <input type="hidden" name="id" value="${item.id}">
                                    <td>
                                        <span class="item-title">${item.title}</span>
                                    </td>
                                    <td>
                                        <span class="item-title"> ${item.info}</span>
                                    </td>
                                    <td>
                                        <span class="list-group-item-info">${item.createTime}</span>
                                    </td>
                                </tr>
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

<!-- divider section -->
<div class="container">
    <div class="row">
        <div class="col-md-1 col-sm-1"></div>
        <div class="col-md-10 col-sm-10">
            <hr>
        </div>
        <div class="col-md-1 col-sm-1"></div>
    </div>
</div> -->

<!-- pricing section -->
<div id="tongzhi">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <h2>社区通知</h2>
            </div>
            <div class="col-md-12 col-sm-18 col-xs-30">
                <div class="plan">
                    <div class="plan-title">
                        <h3>社区通知</h3>
                    </div>
                    <form action = "info">
                        <table class="info-list">
                            <thead>
                            <tr>
                                <th class="item-title">
                                    标题
                                </th>
                                <th class="item-title">
                                    内容
                                </th>
                                <th class="list-group-item-info">
                                    发布时间
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${informations}" var="item">
                                <c:if test="${item.catalog==2}">
                                <tr select="false" title="${item.title}" info="${item.info}" createTime="${item.createTime}" id="${item.id}">
                                    <input type="hidden" name="id" value="${item.id}">
                                    <td>
                                        <span class="item-title">${item.title}</span>
                                    </td>
                                    <td>
                                        <span class="item-title">${item.info}</span>
                                    </td>
                                    <td>
                                        <span class="list-group-item-info">${item.createTime}</span>
                                    </td>
                                </tr>
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


<!-- divider section -->
<div class="container">
    <div class="row">
        <div class="col-md-1 col-sm-1"></div>
        <div class="col-md-10 col-sm-10">
            <hr>
        </div>
        <div class="col-md-1 col-sm-1"></div>
    </div>
</div> -->

<!-- pricing section -->
<div id="ershou">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <h2>二手出售</h2>
            </div>
            <div class="col-md-12 col-sm-18 col-xs-30">
                <div class="plan">
                    <div class="plan-title">
                        <h3>二手出售</h3>
                    </div>
                    <form action = "info">
                        <table class="info-list">
                            <thead>
                            <tr>
                                <th class="item-title">
                                    标题
                                </th>
                                <th class="item-title">
                                    内容
                                </th>
                                <th class="list-group-item-info">
                                    发布时间
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${informations}" var="item">
                                <c:if test="${item.catalog==3}">
                                <tr select="false" title="${item.title}" info="${item.info}" createTime="${item.createTime}" id="${item.id}">
                                    <input type="hidden" name="id" value="${item.id}">
                                    <td>
                                        <span class="item-title"> ${item.title}</span>
                                    </td>
                                    <td>
                                        <span class="item-title"> ${item.info}</span>
                                    </td>
                                    <td>
                                        <span class="list-group-item-info">${item.createTime}</span>
                                    </td>
                                </tr>
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

<!-- divider section -->
<div class="container">
    <div class="row">
        <div class="col-md-1 col-sm-1"></div>
        <div class="col-md-10 col-sm-10">
            <hr>
        </div>
        <div class="col-md-1 col-sm-1"></div>
    </div>
</div> -->

<!-- pricing section -->
<div id="jiaoliu">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <h2>社区交流</h2>
            </div>
            <div class="col-md-12 col-sm-18 col-xs-30">
                <div class="plan">
                    <div class="plan-title">
                        <h3>社区交流</h3>
                    </div>
                    <form action = "info">
                        <table class="info-list">
                            <thead>
                            <tr>
                                <th class="item-title">
                                    标题
                                </th>
                                <th class="item-title">
                                    内容
                                </th>
                                <th class="list-group-item-info">
                                    发布时间
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${informations}" var="item">
                                <c:if test="${item.catalog==4}">
                                <tr select="false" title="${item.title}" info="${item.info}" createTime="${item.createTime}" id="${item.id}">
                                    <input type="hidden" name="id" value="${item.id}">
                                    <td>
                                        <span class="item-title"> ${item.title}</span>
                                    </td>
                                    <td>
                                        <span class="item-title"> ${item.info}</span>
                                    </td>
                                    <td>
                                        <span class="list-group-item-info">${item.createTime}</span>
                                    </td>
                                </tr>
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

<!-- contact section -->
<div id="contact">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <h2>我要发布</h2>
            </div>
            <form action="publish" method="post" role="form">
                <div class="col-md-1 col-sm-1"></div>
                <div class="col-md-10 col-sm-10">
                    <div class="col-md-12 col-sm-12">
                        <select class="form-control" name="select">
                            <%--<option>物业公告</option>
                            <option>社区通知</option>--%>
                            <option>二手出售</option>
                            <option>社区交流</option>
                        </select>

                    </div>
                    <div class="col-md-12 col-sm-12">
                        <input name="subject" type="text" class="form-control" id="subject" placeholder="标题">
                    </div>
                    <div class="col-md-12 col-sm-12">
                        <textarea name="message" rows="5" class="form-control" id="message" placeholder="详细内容           "></textarea>
                    </div>
                    <div class="col-md-8 col-sm-8">
                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy</p>
                    </div>
                    <div class="col-md-4 col-sm-4">
                        <input name="submit" type="submit" class="form-control" id="submit" value="提交信息">
                    </div>
                </div>
                <div class="col-md-1 col-sm-1"></div>
            </form>
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


<!-- scrolltop section -->
<a href="#top" class="go-top"><i class="fa fa-angle-up"></i></a>


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
