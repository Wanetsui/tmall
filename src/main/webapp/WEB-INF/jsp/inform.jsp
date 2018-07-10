<%--
  Created by IntelliJ IDEA.
  User: WaneT
  Date: 2018/7/10
  Time: 14:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>社区信息</title>
    <!-- load CSS -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300">  <!-- Google web font "Open Sans" -->
    <link rel="stylesheet" href="css/bootstrap.min.css">                                  <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="fontawesome/css/fontawesome-all.min.css">                <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" type="text/css" href="slick/slick.css"/>                       <!-- http://kenwheeler.github.io/slick/ -->
    <link rel="stylesheet" type="text/css" href="slick/slick-theme.css"/>
    <link rel="stylesheet" href="css/tooplate-style.css">

    <script>document.documentElement.className="js";var supportsCssVars=function(){var e,t=document.createElement("style");return t.innerHTML="root: { --tmp-var: bold; }",document.head.appendChild(t),e=!!(window.CSS&&window.CSS.supports&&window.CSS.supports("font-weight","var(--tmp-var)")),t.parentNode.removeChild(t),e};supportsCssVars()||alert("Please view this in a modern browser such as latest version of Chrome or Microsoft Edge.");</script>

</head>

<body>
<div id="tm-bg"></div>
<div id="tm-wrap">
    <div class="tm-main-content">
        <div class="container tm-site-header-container">
            <div class="row">
                <div class="col-sm-12 col-md-6 col-lg-6 col-md-col-xl-6 mb-md-0 mb-sm-4 mb-4 tm-site-header-col">
                    <div class="tm-site-header">
                        <h1 class="mb-4">社区信息</h1>
                        <img src="img/underline.png" class="img-fluid mb-4">
                        <p>物业公告 社区通知</p>
                        <p>二手物品 信息交流</p>
                    </div>
                </div>

                <div class="col-sm-12 col-md-6 col-lg-6 col-xl-6">
                    <div class="content">
                        <div class="grid">

                            <div class="grid__item" id="team-link">
                                <div class="product">
                                    <div class="tm-nav-link">
                                        <i class="fas fa-users fa-3x tm-nav-icon"></i>
                                        <span class="tm-nav-text">查看公告</span>
                                        <div class="product__bg"></div>
                                    </div>
                                    <div class="product__description">
                                        <div class="p-sm-4 p-2">
                                            <div class="row mb-3">
                                                <div class="col-12">
                                                    <h2 class="tm-page-title">具体信息</h2>
                                                </div>
                                            </div>
                                            <div class="row tm-reverse-sm">
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
                                                                    <span class="item-title">${item.title}</span>
                                                                </td>
                                                                <td>
                                                                    <span class="list-group-item-info">${item.info}</span>
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
           <a href="inform?currentPage=1">[首页]</a>&nbsp;&nbsp;
           <a href="inform?currentPage=${requestScope.pagemsg.currPage-1}">[上一页]</a>&nbsp;&nbsp;
       </c:if>

       <c:if test="${requestScope.pagemsg.currPage != requestScope.pagemsg.totalPage}">
           <a href="inform?currentPage=${requestScope.pagemsg.currPage+1}">[下一页]</a>&nbsp;&nbsp;
           <a href="inform?currentPage=${requestScope.pagemsg.totalPage}">[尾页]</a>&nbsp;&nbsp;
       </c:if>
   </span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="grid__item">
                                <div class="product">
                                    <div class="tm-nav-link">
                                        <i class="fas fa-comments fa-3x tm-nav-icon"></i>
                                        <span class="tm-nav-text">发布信息</span>
                                        <div class="product__bg"></div>
                                    </div>
                                    <div class="product__description">
                                        <div class="pt-sm-4 pb-sm-4 pl-sm-5 pr-sm-5 pt-2 pb-2 pl-3 pr-3">
                                            <div class="row mb-3">
                                                <div class="col-12">
                                                    <h2 class="tm-page-title">发布信息</h2>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12">
                                                    <form action="publish" method="post" class="contact-form">
                                                        <div class="row">
                                                            <div class="form-group col-md-6 col-lg-6 col-xl-6">
                                                                <input type="text" id="contact_name" name="title" class="form-control" placeholder="Title"  required/>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <textarea id="contact_message" name="context" class="form-control" rows="9" placeholder="Message" required></textarea>
                                                        </div>
                                                        <button type="submit" class="btn btn-primary tm-btn-submit">Submit</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div> <!-- .tm-main-content -->
</div>
<!-- load JS -->
<script src="js/jquery-3.2.1.slim.min.js"></script>         <!-- https://jquery.com/ -->
<script src="slick/slick.min.js"></script>                  <!-- http://kenwheeler.github.io/slick/ -->
<script src="js/anime.min.js"></script>                     <!-- http://animejs.com/ -->
<script src="js/maininform.js"></script>
<script>

    function setupFooter() {
        var pageHeight = $('.tm-site-header-container').height() + $('footer').height() + 100;

        var main = $('.tm-main-content');

        if($(window).height() < pageHeight) {
            main.addClass('tm-footer-relative');
        }
        else {
            main.removeClass('tm-footer-relative');
        }
    }

    /* DOM is ready
    ------------------------------------------------*/
    $(function(){

        setupFooter();

        $(window).resize(function(){
            setupFooter();
        });

        $('.tm-current-year').text(new Date().getFullYear());  // Update year in copyright
    });

</script>

</body>
</html>