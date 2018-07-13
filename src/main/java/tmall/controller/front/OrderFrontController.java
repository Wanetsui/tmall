package tmall.controller.front;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import tmall.annotation.Auth;
import tmall.annotation.Nullable;
import tmall.exception.AuthException;
import tmall.exception.ParameterException;
import tmall.mapper.DetailsMapper;
import tmall.pojo.*;
import tmall.pojo.extension.DetailsExtension;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Pattern;

@Auth(User.Group.user)
@Controller
@RequestMapping("/")
public class OrderFrontController extends FrontBaseController {
    @Autowired
    DetailsMapper detailsMapper;
    //购物车相关
    @RequestMapping("addCart")
    public String addCart(Integer pid, Integer num, Model model, HttpSession session) throws Exception {
        Product product = (Product) productService.get(pid);
        User user = (User) session.getAttribute("user");
        String msg;
        //获取原来就在购物车的数据
        CartItem cartItem = (CartItem) cartItemService
                .getOne("uid", user.getId(), "pid", product.getId());
        Boolean isInDB = cartItem != null;
        //判断是否超出库存

        if (isInDB) {
            num += cartItem.getNumber();
        } else {
            cartItem = new CartItem();
            cartItem.setProduct(product);
            cartItem.setUser(user);
        }

        if (num > product.getStock()) {
            msg = "OutOfStock";
            model.addAttribute("msg", msg);
            return "msg";
        }

        cartItem.setNumber(num);
        cartItem.setSum(product.getNowPrice().subtract(new BigDecimal(num)));

        if (isInDB) {
            cartItemService.update(cartItem);
        } else {
            cartItemService.add(cartItem);
        }

        msg = "success";
        model.addAttribute("msg", msg);
        return "msg";
    }
    @RequestMapping("addAdvance")
    public String addAdvance(Integer pid, Integer num, Model model, HttpSession session) throws Exception {
        Service service = (Service) serviceService.get(pid);
        User user = (User) session.getAttribute("user");
        String msg;

        Advance advance = (Advance) advanceService
                .getOne("uid", user.getId(), "pid", service.getId());
        Boolean isInDB = advance != null;
        //判断是否超出库存

        if (isInDB) {
            num += advance.getNumber();
        } else {
            advance = new Advance();
            advance.setService(service);
            advance.setUser(user);
        }

        if (num > service.getStock()) {
            msg = "OutOfStock";
            model.addAttribute("msg", msg);
            return "msg";
        }

        advance.setNumber(num);
        advance.setSum(service.getPrice().subtract(new BigDecimal(num)));

        if (isInDB) {
            advanceService.update(advance);
        } else {
            advanceService.add(advance);
        }

        msg = "success";
        model.addAttribute("msg", msg);
        return "msg";
    }

    @RequestMapping("cart")
    public String cart(Model model, HttpSession session) throws Exception {
        User user = (User) session.getAttribute("user");
        List<CartItem> cartItems = cartItemService.list("uid", user.getId());
        model.addAttribute("cartItems", cartItems);
        return "cart";
    }
    @RequestMapping("advance")
    public String advance(Model model, HttpSession session) throws Exception {
        User user = (User) session.getAttribute("user");
        List<Advance> advances = advanceService.list("uid", user.getId());
        model.addAttribute("advance", advances);
        return "advance";
    }

    @RequestMapping("changeCartNum")
    public String changeCartNum(Integer id, Integer num, Model model, HttpSession session) throws Exception {
        User user = (User) session.getAttribute("user");
        CartItem cartItemFromDB = (CartItem) cartItemService.get(id);
        String msg = "fail";
        checkUser(user, cartItemFromDB.getUser());
        if (cartItemFromDB.getProduct().getStock() >= num) {
            cartItemFromDB.setNumber(num);
            cartItemFromDB.setSum(cartItemFromDB.getProduct()
                    .getNowPrice().subtract(new BigDecimal(num)));
            cartItemService.update(cartItemFromDB);
            msg = "success";
        }
        model.addAttribute("msg", msg);
        return "msg";
    }
    @RequestMapping("changeAdvanceNum")
    public String changeAdvanceNum(Integer id, Integer num, Model model, HttpSession session) throws Exception {
        User user = (User) session.getAttribute("user");
        Advance advanceFromDB = (Advance) advanceService.get(id);
        String msg = "fail";
        checkUser(user, advanceFromDB.getUser());
        if (advanceFromDB.getService().getStock() >= num) {
            advanceFromDB.setNumber(num);
            advanceFromDB.setSum(advanceFromDB.getService()
                    .getPrice().subtract(new BigDecimal(num)));
            advanceService.update(advanceFromDB);
            msg = "success";
        }
        model.addAttribute("msg", msg);
        return "msg";
    }
    @RequestMapping("deleteCartItem")
    public String deleteCartItem(Integer id, Model model, HttpSession session) throws Exception {
        User user = (User) session.getAttribute("user");
        CartItem cartItemFromDB = (CartItem) cartItemService.get(id);
        checkUser(user, cartItemFromDB.getUser());
        cartItemService.delete(cartItemFromDB);
        model.addAttribute("msg", "success");
        return "msg";
    }
    @RequestMapping("deleteAdvance")
    public String deleteAdvance(Integer id, Model model, HttpSession session) throws Exception {
        User user = (User) session.getAttribute("user");
        Advance advanceFromDB = (Advance) advanceService.get(id);
        checkUser(user, advanceFromDB.getUser());
        advanceService.delete(advanceFromDB);
        model.addAttribute("msg", "success");
        return "msg";
    }

    @RequestMapping("cartNumber")
    public String cartNumber(Model model, HttpSession session) throws Exception {
        User user = (User) session.getAttribute("user");
        int number = cartItemService.list("uid", user.getId()).size();
        String msg = String.valueOf(number);
        model.addAttribute("msg", msg);
        return "msg";
    }
    @RequestMapping("advanceNumber")
    public String advanceNumber(Model model, HttpSession session) throws Exception {
        User user = (User) session.getAttribute("user");
        int number = advanceService.list("uid", user.getId()).size();
        String msg = String.valueOf(number);
        model.addAttribute("msg", msg);
        return "msg";
    }

    @RequestMapping("buyOne")
    public String buyOne(Integer pid, Integer num, Model model, HttpSession session) throws Exception {
        Product product = (Product) productService.get(pid);
        User user = (User) session.getAttribute("user");
        CartItem cartItem = new CartItem();
        cartItem.setUser(user);
        cartItem.setProduct(product);
        cartItem.setNumber(num);
        cartItem.setSum(product.getNowPrice().multiply(new BigDecimal(num)));
        cartItem.setId(-1);
        session.setAttribute("tempCartItem", cartItem);
        return "redirect:buy?ciid=-1";
    }
    @RequestMapping("buyOnes")
    public String buyOnes(Integer pid, Integer num, Model model, HttpSession session) throws Exception {
        Service service = (Service) serviceService.get(pid);
        User user = (User) session.getAttribute("user");
        Advance advance = new Advance();
        advance.setUser(user);
        advance.setService(service);
        advance.setNumber(num);
        advance.setSum(service.getPrice().multiply(new BigDecimal(num)));
        advance.setId(-1);
        session.setAttribute("tempAdvance", advance);
        return "redirect:buys?ciid=-1";
    }

    @RequestMapping("buy")
    public String buy(Integer[] ciid, Model model, HttpSession session) throws Exception {
        List<CartItem> cartItems = new ArrayList<>();
        User user = (User) session.getAttribute("user");
        int totalNum = 0;
        BigDecimal sum = new BigDecimal(0);
        for (Integer id : ciid) {
            CartItem cartItem = null;
            if (id == -1) {
                //由buyOne跳转而来
                cartItem = (CartItem) session.getAttribute("tempCartItem");
            } else {
                //由购物车跳转而来
                cartItem = (CartItem) cartItemService.get(id);
            }
            // 检查
            checkUser(user, cartItem.getUser());

            totalNum += cartItem.getNumber();
            sum = sum.add(cartItem.getSum());
            cartItems.add(cartItem);

        }
        session.setAttribute("cartItems", cartItems);
        model.addAttribute("totalNum", totalNum);
        model.addAttribute("sum", sum);
        return "buy";
    }
    @RequestMapping("buys")
    public String buys(Integer[] ciid, Model model, HttpSession session) throws Exception {
        List<Advance> advances = new ArrayList<>();
        User user = (User) session.getAttribute("user");
        int totalNum = 0;
        BigDecimal sum = new BigDecimal(0);
        for (Integer id : ciid) {
            Advance advance = null;
            if (id == -1) {
                //由buyOnes跳转而来
                advance = (Advance) session.getAttribute("tempAdvance");
            } else {
                //由预约列表跳转而来
                advance = (Advance) advanceService.get(id);
            }
            // 检查
            checkUser(user, advance.getUser());

            totalNum += advance.getNumber();
            sum = sum.add(advance.getSum());
            advances.add(advance);

        }
        session.setAttribute("advances", advances);
        model.addAttribute("totalNum", totalNum);
        model.addAttribute("sum", sum);
        return "buys";
    }

    @RequestMapping("createOrder")
    public String createOrder(String address, String post, String receiver,
                              String mobile,
                              String userMessage,
                              HttpSession session) throws Exception {
        List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartItems");
        User user = (User) session.getAttribute("user");
        //简单校验下手机
        Pattern pattern = Pattern.compile("1[0-9]{10}");
        if (!pattern.matcher(mobile).matches()) {
            throw new ParameterException("手机号填写错误");
        }
        Order order = new Order();
        order.setAddress(address);
        order.setPost(post);
        order.setReceiver(receiver);
        order.setMobile(mobile);
        order.setUserMessage(userMessage);
        order.setUser(user);
        orderService.createOrder(order, cartItems);
        return "redirect:pay?oid=" + order.getId();
    }
    @RequestMapping("createDetails")
    public String createDetails(String address, String receiver,
                                String mobile,
                                String userMessage,
                                @Nullable Timestamp start, @Nullable Timestamp end,
                                HttpSession session) throws Exception {
        List<Advance> advances = (List<Advance>) session.getAttribute("advances");
        User user = (User) session.getAttribute("user");
        //简单校验下手机
        Pattern pattern = Pattern.compile("1[0-9]{10}");
        if (!pattern.matcher(mobile).matches()) {
            throw new ParameterException("手机号填写错误");
        }
        Details details = new Details();
        details.setAddress(address);
        //details.setPost(post);
        details.setReceiver(receiver);
        details.setMobile(mobile);
        details.setUserMessage(userMessage);
        details.setUser(user);
        System.out.println(start);
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        System.out.println(start);
//        System.out.println(sdf.parse(end));
        details.setDeliverDate(start);
        details.setConfirmDate(end);
        detailsService.createDetails(details, advances);
        return "redirect:payHome?oid=" + details.getId();
    }

    @RequestMapping("pay")
    public String pay(Integer oid, HttpSession session, Model model) throws Exception {
        User user = (User) session.getAttribute("user");
        Order order = (Order) orderService.get(oid);
        checkUser(user, order.getUser());
        model.addAttribute("order", order);
        return "pay";
    }
    @RequestMapping("payHome")
    public String pays(Integer oid, HttpSession session, Model model) throws Exception {
        User user = (User) session.getAttribute("user");
        System.out.println(oid);
        Details details = (Details) detailsMapper.selectByPrimaryKey(oid);
       // Details details = (Details) detailsService.get(oid);
       // checkUser(user, details.getUser());
        model.addAttribute("details", details);
        return "payHome";
    }

    @RequestMapping("payed")
    public String payed(Integer oid, HttpSession session, Model model) throws Exception {
        User user = (User) session.getAttribute("user");
        Order order = (Order) orderService.get(oid);
        checkUser(user, order.getUser());
        order.setStatus(Order.Status.waitDeliver);
        order.setPayDate(new Date());
        orderService.update(order);
        model.addAttribute("order", order);
        return "payed";
    }
    @RequestMapping("payedHome")
    public String payeds(Integer oid, HttpSession session, Model model) throws Exception {
        User user = (User) session.getAttribute("user");
        Details details = (Details) detailsService.get(oid);
        //checkUser(user, details.getUser());
        details.setStatus("waitDeliver");
        details.setPayDate(new Date());
        detailsService.update(details);
        model.addAttribute("details", details);
        return "payedHome";
    }

    @RequestMapping("myOrder")
    public String myOrder(HttpSession session, Model model) throws Exception {
        User user = (User) session.getAttribute("user");
        List<Order> orders = orderService.list("uid", user.getId(), "depth", 3);
        model.addAttribute("orders", orders);
        return "myOrder";
    }

    @RequestMapping("myDetails")
    public String myOrders(HttpSession session, Model model) throws Exception {
        User user = (User) session.getAttribute("user");
        List<Details> details = detailsService.list("uid", user.getId(), "depth", 3);
        model.addAttribute("detailss", details);
        return "myDetails";
    }
    @RequestMapping("deliver")
    public String deliver(Integer oid, HttpSession session, Model model) throws Exception {
        Order order = (Order) orderService.get(oid);
        User user = (User) session.getAttribute("user");
        checkUser(user, order.getUser());
        order.setStatus(Order.Status.waitConfirm);
        order.setDeliverDate(new Date());
        orderService.update(order);
        return "redirect:myOrder";
    }
    @RequestMapping("delivers")
    public String delivers(Integer oid, HttpSession session, Model model) throws Exception {
        Details details= (Details) detailsService.get(oid);
        User user = (User) session.getAttribute("user");
        checkUser(user, details.getUser());
        details.setStatus(Details.Status.waitConfirm);
        details.setDeliverDate(new Date());
        detailsService.update(details);
        return "redirect:myDetails";
    }

    @RequestMapping("confirmPay")
    public String confirmPay(Integer oid, HttpSession session, Model model) throws Exception {
        Order order = (Order) orderService.get(oid, 3);
        User user = (User) session.getAttribute("user");
        checkUser(user, order.getUser());
        model.addAttribute("order", order);
        return "confirmPay";
    }
    @RequestMapping("confirmPayHome")
    public String confirmPays(Integer oid, HttpSession session, Model model) throws Exception {
        Details details = (Details) detailsService.get(oid, 3);
        User user = (User) session.getAttribute("user");
        checkUser(user, details.getUser());
        model.addAttribute("details", details);
        return "confirmPayHome";
    }

    @RequestMapping("confirmed")
    public String confirmed(Integer oid, HttpSession session, Model model) throws Exception {
        Order order = (Order) orderService.get(oid);
        User user = (User) session.getAttribute("user");
        checkUser(user, order.getUser());
        order.setStatus(Order.Status.waitComment);
        order.setConfirmDate(new Date());
        orderService.update(order);
        model.addAttribute("order", order);
        return "confirmed";
    }
    @RequestMapping("confirmedHome")
    public String confirmeds(Integer oid, HttpSession session, Model model) throws Exception {
        Details details = (Details) detailsService.get(oid);
        User user = (User) session.getAttribute("user");
        checkUser(user, details.getUser());
        details.setStatus(Details.Status.finish);
        details.setConfirmDate(new Date());
        detailsService.update(details);
        model.addAttribute("details", details);
        return "confirmedHome";
    }

    @RequestMapping("deleteOrder")
    public String deleteOrder(Integer oid, HttpSession session, Model model) throws Exception {
        Order order = (Order) orderService.get(oid);
        User user = (User) session.getAttribute("user");
        String msg = "fail";
        checkUser(user, order.getUser());
        model.addAttribute("msg", msg);
        return "msg";
    }
    @RequestMapping("deleteDetails")
    public String deleteDetails(Integer oid, HttpSession session, Model model) throws Exception {
        Details details = (Details) detailsService.get(oid);
        User user = (User) session.getAttribute("user");
        String msg = "fail";
        checkUser(user, details.getUser());
        model.addAttribute("msg", msg);
        return "msg";
    }

    @RequestMapping("comment")
    public String comment(Integer oiid, HttpSession session, Model model) throws Exception {
        OrderItem orderItem = (OrderItem) orderItemService.get(oiid);
        User user = (User) session.getAttribute("user");
        checkUser(user, orderItem.getOrder().getUser());
        model.addAttribute("orderItem", orderItem);
        return "comment";
    }

    @RequestMapping("addComment")
    public String addComment(Integer oiid, Comment comment, HttpSession session, Model model) throws Exception {
        OrderItem orderItem = (OrderItem) orderItemService.get(oiid);
        User user = (User) session.getAttribute("user");
        checkUser(user, orderItem.getOrder().getUser());
        comment.setProduct(orderItem.getProduct());
        comment.setUser(user);
        comment.setCreateDate(new Date());
        commentService.add(comment);
        orderItem.setComment(comment);
        orderItemService.update(orderItem);
        Product product = orderItem.getProduct();
        product.setCommentCount(product.getCommentCount() + 1);
        productService.update(product);
        Order orderNew = (Order) orderService.get(orderItem.getOrder().getId());
        if (commentService.checkFinishComment(orderNew)) {
            orderNew.setStatus(Order.Status.finish);
            orderService.update(orderNew);
        }
        return "redirect:myOrder";
    }

    private void checkUser(User user1, User user2) throws AuthException {
        if (!user1.getId().equals(user2.getId())) {
            throw new AuthException("非法访问，没有权限");
        }
    }
}
