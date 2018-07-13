<%--
  Created by IntelliJ IDEA.
  User: WaneT
  Date: 2018/7/1
  Time: 18:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<script type="text/javascript">
    $(".form_datetime1").datetimepicker({format: 'yyyy-mm-dd hh:ii'});
    $(".form_datetime2").datetimepicker({format: 'yyyy-mm-dd hh:ii'});
    $(function(){
        $("#start").datetimepicker({
            format:'yyyy-mm-dd hh:ii:ss',  //格式  如果只有yyyy-mm-dd那就是0000-00-00
            autoclose:true,//选择后是否自动关闭
            minView:0,//最精准的时间选择为日期  0-分 1-时 2-日 3-月
            language:  'zh-CN', //中文
            weekStart: 1, //一周从星期几开始
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            forceParse: 0,
            // daysOfWeekDisabled:"1,2,3", //一周的周几不能选 格式为"1,2,3"  数组格式也行
            todayBtn : true,  //在底部是否显示今天
            todayHighlight :false, //今天是否高亮显示
            keyboardNavigation:true, //方向图标改变日期  必须要有img文件夹 里面存放图标
            showMeridian:false,  //是否出现 上下午
            initialDate:new Date()
            //startDate: "2017-01-01" //日期开始时间 也可以是new Date()只能选择以后的时间
        }).on("changeDate",function(){
            var start = $("#start").val();
            $("#end").datetimepicker("setStartDate",start);
        });
        $("#end").datetimepicker({
            format:'yyyy-mm-dd hh:ii:ss',  //格式  如果只有yyyy-mm-dd那就是0000-00-00
            autoclose:true,//选择后是否自动关闭
            minView:0,//最精准的时间选择为日期  0-分 1-时 2-日 3-月
            language:  'zh-CN', //中文
            weekStart: 1, //一周从星期几开始
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            forceParse: 0,
            //daysOfWeekDisabled:"1,2,3", //一周的周几不能选
            todayBtn : true,  //在底部是否显示今天
            todayHighlight :false, //今天是否高亮显示
            keyboardNavigation:true, //方向图标改变日期  必须要有img文件夹 里面存放图标
            showMeridian:false  //是否出现 上下午
            // startDate: "2017-01-01"  //开始时间  ENdDate 结束时间
        }).on("changeDate",function(){
            var end = $("#end").val();
            $("#start").datetimepicker("setEndDate",end);
        });
    });
</script>
<script>
    $(function () {
        $(".comment-input").click(function () {
            $(this).css({"height":"57px","border":"1px solid #ff0036"});
        });
        $(".address-table input,.address-table textarea").keyup(function () {
            $("#address-text").text($("textarea[name='address']").val());
            $("#name-and-phone").text($("input[name='receiver']").val()+" "+$("input[name='mobile']").val());
        });
        $("#submit").click(function () {
            var re = /1[0-9]{10}/;
            if (!re.test(($("input[name='mobile']").val()))){
                alert("手机号填写不正确");
                return false;
            }
            if($("input[name='receiver']").val().length === 0){
                alert("收件人为空");
                return false;
            }
            if($("textarea[name='address']").val().length === 0){
                alert("地址为空");
                return false;
            }
        });
    });
</script>
<main class="buy-page">
    <form action="createDetails" method="post">
        <div class="address-tip">输入服务地址</div>
        <table class="address-table">
            <tbody>
            <tr>
                <td class="first-column left-column">详细地址<span class="red-star">*</span></td>
                <td class="right-column"><textarea placeholder="建议您如实填写详细收货地址，例如接到名称，门牌号码，楼层和房间号等信息"
                                                   name="address"></textarea></td>
            </tr>
           <%-- <tr>
                <td class="left-column">邮政编码</td>
                <td class="right-column"><input type="text" placeholder="如果您不清楚邮递区号，请不要填写" name="post"></td>
            </tr>--%>
            <tr>
                <td class="left-column">订购人姓名<span class="red-star">*</span></td>
                <td class="right-column"><input type="text" placeholder="长度不超过25个字符" name="receiver"></td>
            </tr>
            <tr>
                <td class="left-column">手机号码 <span class="red-star">*</span></td>
                <td class="right-column"><input type="text" placeholder="请输入11位手机号码" name="mobile"></td>
            </tr>
            </tbody>
        </table>
        <label>预约时间：</label>
        <label>从</label>
        <input type="text"  name="start" class="form_datetime1">
        <label>到</label>
        <input type="text" placeholder="结束时间" name="end" class="form_datetime2">
        <div class="buy-list-tip">确认订单信息</div>
        <table class="buy-list">
            <thead>
            <tr>
                <th class="shop-and-wangwang" colspan="2">
                    <img src="img/tmall-small.png" class="tmall-small-png">
                    <a href="#nowhere" class="market-link">店铺：${website_name}</a>
                    <a href="#nowhere" class="wangwang-link"> <span class="wangwang-small"></span> </a>
                </th>
                <th width="120px">价格</th>
                <th width="120px">数量</th>
                <th width="120px">小计</th>
            </tr>
            <tr class="row-border">
                <td colspan="2"></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${advance}" var="item" varStatus="vs">
                <tr class="buy-item">
                    <td class="buy-item-image"><img src="${serviceImgDir}${item.service.image.path}"></td>
                    <td class="buy-item-name"><a href="service?service.id=${item.service.id}">${item.service.name}</a>
                        <div class="cart-item-title-bottom">
                            <img title="支持信用卡支付" src="img/creditcard.png">
                            <img title="消费者保障服务,承诺如实描述" src="img/promise.png">
                        </div>
                    </td>
                    <td class="buy-item-price">
                        <span>￥${item.service.price}</span>
                    </td>
                    <td class="buy-item-num">
                        <span>${item.number}</span>
                    </td>
                    <td class="buy-item-sum">
                        <span>￥${item.sum}</span>
                    </td>
                    <input type="hidden" name="ciid" value="${item.id}">
                </tr>
            </c:forEach>

            </tbody>
        </table>
        <table class="sum-bar">
            <tr>
                <td rowspan="2" width="45%" class="comment-td">给卖家留言：
                    <textarea class="comment-input" name="userMessage" placeholder="选填:对本次交易的说明(建议填写已和卖家协商一致的内容)"></textarea>
                </td>
                <%--<td>
                    服务方式：
                    <select class="delivery-select">
                        <option>上门服务一次免其他费用</option>
                        <option>预交定金 价格面谈</option>
                    </select>
                    <span class="pull-right deliver-num">0.00</span>
                </td>--%>
                <td>
                    服务时间类型：
                    <select name="c" class="delivery-select">
                        <option>一次性</option>
                        <option>包月</option>
                        <option>定期</option>
                    </select>
                    <span class="pull-right deliver-num">0.00</span>
                </td>
            </tr>
            <tr>
                <td class="sum-num-td">
                <span class="pull-right">
                    合计 <span class="sum-num">￥${sum}</span>
                </span>
                </td>
            </tr>
        </table>
        <div class="confirm-frame pull-right">
            <div class="line pull-right">实付款：
                <span class="yen-big">￥</span>
                <span class="price-num">${sum}</span>
            </div>
            <div class="pull-right clear line-small">
                <b>服务地：</b>
                <span id="address-text"></span>
            </div>
            <div class="pull-right clear line-small">
                <b>订购人：</b>
                <span id="name-and-phone"></span>
            </div>
        </div>
        <button class="submit-order pull-right clear" type="submit" id="submit">
            提交订单
        </button>
    </form>
</main>
