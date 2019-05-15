package tmall.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import tmall.annotation.Auth;
import tmall.pojo.*;
import tmall.util.Pagination;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin/service")
public class ServiceController extends AdminBaseController {
    @Auth(User.Group.admin)
    @RequestMapping("list")
    public String list(Integer cid, Model model, Pagination pagination) throws Exception {
        List<Type> services = serviceService
                .list("cid", cid, "pagination", pagination);
        Type type = (Type) typeService.get(cid);
        pagination.setParam("&cid=" + type.getId());
        model.addAttribute("services", services);
        model.addAttribute("type", type);
        return "admin/listService";
    }

    @RequestMapping("add")
    public String add(Integer cid, String name, String subTitle, BigDecimal nowPrice, Integer stock) throws Exception {
        Service p = new Service();
        p.setCid(cid);
        p.setName(name);
        p.setSubTitle(subTitle);
        p.setStock(stock);
        p.setCreateDate(new Date());
        p.setSaleCount(0);
        p.setPrice(nowPrice);
        serviceService.add(p);
        return "redirect:list?cid=" + cid;
    }

    @Auth(User.Group.admin)
    @RequestMapping("edit")
    public String edit(Integer id, Model model) throws Exception {
        Service p = (Service) serviceService.get(id);
        model.addAttribute(p);
        return "admin/editService";
    }

    @RequestMapping("update")
    public String update(Integer id, String name, String subTitle, BigDecimal nowPrice, Integer stock) throws Exception {

        Service p = (Service) serviceService.get(id);
        p.setName(name);
        p.setSubTitle(subTitle);
        p.setStock(stock);
        p.setPrice(nowPrice);
        serviceService.update(p);
        return "redirect:list?cid=" + p.getType().getId();
    }

    @RequestMapping("delete")
    public String delete(int id) throws Exception {
        Service p = (Service) serviceService.get(id);
        serviceService.delete(p);
        return "redirect:list?cid=" + p.getType().getId();
    }
}