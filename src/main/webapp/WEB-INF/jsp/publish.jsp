
<%--
  Created by IntelliJ IDEA.
  User: WaneT
  Date: 2018/7/9
  Time: 20:08
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
    <link rel="stylesheet" href="css/bootstrap.css">
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
            </button>
            <a href="index" class="navbar-brand smoothScroll">街坊四邻服务系统</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#wuye" class="smoothScroll">物业公告</a></li>
                <li><a href="#tongzhi" class="smoothScroll">社区通知</a></li>
                <li><a href="#ershou" class="smoothScroll">二手出售</a></li>
                <li><a href="#jiaoliu" class="smoothScroll">失物招领</a></li>
                <li><a href="gopublish" >我要发布</a></li>
            </ul>
        </div>

    </div>
</div>
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
            <div class="col-md-6 col-sm-6">
                <h2>发布信息</h2>
            </div>
            <form action="publish" method="post" role="form">
                <div class="col-md-1 col-sm-1"></div>
                <div class="col-md-10 col-sm-10">
                    <div class="col-md-12 col-sm-12">
                        <select class="form-control" name="select">
                            <option>二手出售</option>
                            <option>失物招领</option>

                        </select>

                    </div>
                    <div class="col-md-12 col-sm-12">
                        <input name="subject" type="text" class="form-control" id="subject" placeholder="标题">
                    </div>
                    <div class="col-md-12 col-sm-12">
                        <%--<textarea name="message" rows="5" class="form-control" id="message" placeholder="详细内容 "></textarea>--%>
                            <textarea name="message" cols="20" rows="2" class="ckeditor" id="message" placeholder="详细内容 "></textarea>
                    </div>
                    <script type="text/javascript">
                        CKEDITOR.replace('message');
                    </script>
                    <div class="col-md-4 col-sm-4">
                        <input name="submit" type="submit" class="form-control" id="submit" value="提交信息">
                    </div>
                </div>
                <div class="col-md-1 col-sm-1"></div>
            </form>
        </div>
    </div>
</div>

<!-- scrolltop section -->
<a href="#top" class="go-top"><i class="fa fa-angle-up"></i></a>


<!-- javascript js -->
<script src="js/bootstrap.js"></script>
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/nivo-lightbox.min.js"></script>
<script src="js/smoothscroll.js"></script>
<script src="js/jquery.nav.js"></script>
<script src="js/isotope.js"></script>
<script src="js/imagesloaded.min.js"></script>
<script src="js/custom.js"></script>
<script src="ckeditor/ckeditor.js"></script>
</body>
</html>
