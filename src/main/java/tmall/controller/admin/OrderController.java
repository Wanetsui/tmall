package tmall.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import tmall.annotation.Auth;
import tmall.annotation.Nullable;
import tmall.pojo.Order;
import tmall.pojo.User;
import tmall.util.Pagination;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin/order")
public class OrderController extends AdminBaseController {
    @Auth(User.Group.admin)
    @RequestMapping("list")
    public String list(Model model, Pagination pagination, @Nullable String flag) throws Exception {
        if (flag == null){
            List<Order> orders = orderService.
                    list("pagination", pagination, "depth", 3);
            model.addAttribute("orders", orders);
        }else{
            List<Order> orders = orderService.
                    list("pagination", pagination, "depth", 3, "order", "confirmDate desc");
            model.addAttribute("orders", orders);
        }


        return "admin/listOrder";
    }

    @Auth(User.Group.admin)
    @RequestMapping("deliver")
    public String list(Integer oid) throws Exception {
        Order order = (Order) orderService.get(oid);
        order.setStatus(Order.Status.waitComment);
        order.setDeliverDate(new Date());
        orderService.update(order);
        return "redirect:list";
    }
    @RequestMapping("orderBySendTime")
    public String orderBySendTime(Model model){
        List<Order> orders = orderService.orderBySendTime();
        model.addAttribute("orders", orders);
        System.out.println(orders.size());
        return "redirect:list?flag=1";
    }

}