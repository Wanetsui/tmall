<%--
  Created by IntelliJ IDEA.
  User: WaneT
  Date: 2018/7/1
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<script>
    var deleteOid = -1;
    $(function () {
        $(".details-type a").click(function () {
            var detailsStatus = $(this).attr("details-status");
            if('all'===detailsStatus){
                $("table[details-status]").show();
            }else{
                $("table[details-status]").hide();
                $("table[details-status="+detailsStatus+"]").show();
            }
            $(".details-type div").removeClass("selected");
            $(this).parent("div").addClass("selected");

        });
        $(".delete-button").click(function () {
            deleteOid = $(this).attr("oid");
            $("#confirmModal").modal('show');
        });
        $("#confirmDelete").click(function () {
            $("#confirmModal").modal("hide");
            var page = "deleteDetails";
            $.get(page,{"oid":deleteOid},function (result) {
                if(result === "success"){
                    $("table[oid="+deleteOid+"]").remove();
                }else{
                    alert("服务器错误，删除失败");
                }
            });
        });
        $("#cancelDelete").click(function () {
            $("#confirmModal").modal("hide");
        });
    });
</script>

<section class="details-type">
    <div class="selected"><a href="#nowhere" details-status="all">所有预约</a></div>
    <div><a href="#nowhere" details-status="waitPay">待付款</a></div>
    <div><a href="#nowhere" details-status="waitDelivery">待服务</a></div>
    <div><a href="#nowhere" details-status="waitConfirm">待确认</a></div>
</section>

<main class="details-list">
    <table class="head-table">
        <thead>
        <th >服务</th>
        <th width="100px">价格</th>
        <th width="150px">实付款</th>
        <th width="120px">交易操作</th>
        </thead>
    </table>
    <c:forEach items="${detailss}" var="o" varStatus="vs">
        <table class="line-table" details-status="${o.status}" oid="${o.id}">
            <tr class="item-head">
                <td colspan="2" class="time-and-details">
                    <b>${o.createDate}</b>
                    <span>订单号: ${o.orderCode}</span>
                </td>
                <td >
                    <span class="seller"><img src="img/tmall-small.png">${website_name}</span>
                </td>
                <td colspan="2">
                    <span class="wangwang"></span>
                </td>
                <td class="delete">
                    <c:if test="${o.status=='finish'|| o.status == 'waitPay'}">
                        <a href="#nowhere" class="delete-button" oid="${o.id}">
                            <span class="glyphicon glyphicon-trash"></span>
                        </a>
                    </c:if>
                </td>
            </tr>
            <c:forEach items="${o.detailsItems}" var="oi" varStatus="vs2">
                <tr class="item-body">
                    <td width="100px">
                        <img src="${serviceImgDir}${oi.service.image.path}" class="book-item-jpg">
                    </td>
                    <td class="item-name">
                        <a class="book-item-title" href="service?id=${oi.service.id}">${oi.service.name}</a>
                        <div class="book-item-title-bottom">
                            <img title="保障卡" src="img/baozhang.png">
                        </div>
                    </td>
                    <td width="100px" class="num-center">
                        <span class="book-item-now-price">￥${oi.service.price}</span>
                    </td>
                    <c:if test="${vs2.count==1}">
                        <td class="price-td" width="150px" rowspan="${o.totalNumber}">
                            <span class="details-item-sum">￥${o.sum}</span>
                            <span class="freight">(含运费：￥0.00)</span>
                        </td>
                    </c:if>
                    <c:if test="${vs2.count==1 && o.status!='waitComment' }">
                        <td width="120px" rowspan="${o.totalNumber}">

                            <c:if test="${o.status=='waitConfirm' }">
                                <a href="confirmPay?oid=${o.id}" class="order-button blue">确认收货</a>
                            </c:if>
                            <c:if test="${o.status=='waitPay' }">
                                <a href="pay?oid=${o.id}" class="order-button blue">付款</a>
                            </c:if>

                            <c:if test="${o.status=='waitDeliver' }">
                                <a href="#nowhere" class="order-button white">等待服务</a>
                            </c:if>
                            <c:if test="${o.status=='finish' }">
                                <a href="#nowhere" class="order-button white">完成订单</a>
                            </c:if>
                        </td>
                    </c:if>
                </tr>
            </c:forEach>
        </table>
    </c:forEach>
    <div class="modal" tabindex="-1" role="dialog" id="confirmModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-title">取消服务</div>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>

                <div class="confirm-content">确认要取消该服务吗？</div>
                <div class="button-group">
                    <button class="yes" id="confirmDelete">确定</button>
                    <button class="no" id="cancelDelete">取消</button>
                </div>
            </div>
        </div>
    </div>
</main>
