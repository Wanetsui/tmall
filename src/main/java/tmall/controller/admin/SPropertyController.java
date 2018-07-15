package tmall.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import tmall.annotation.Auth;
import tmall.pojo.*;
import tmall.util.Pagination;

import java.util.List;

@Controller
@RequestMapping("/admin/sproperty")
public class SPropertyController extends AdminBaseController {


    @Auth(User.Group.admin)
    @RequestMapping("list")
    public String list(Integer cid, Model model, Pagination pagination) throws Exception {
        List<Type> properties = spropertyService
                .list("cid",cid);
        Type category = (Type) typeService.get(cid);
        model.addAttribute("serviceproperties", properties);
        model.addAttribute("type",category);
        return "admin/listServiceProperties";
    }

    @RequestMapping("add")
    public String add(Integer cid, String name) throws Exception {
        SProperty p = new SProperty();
        p.setCid(cid);
        p.setName(name);
        spropertyService.add(p);
        return "redirect:list?cid="+cid;
    }
    @Auth(User.Group.admin)
    @RequestMapping("edit")
    public String edit(Integer id, Model model) throws Exception {
        SProperty property = (SProperty) spropertyService.get(id);
        model.addAttribute(property);
        return "admin/editServiceProperty";
    }

    @RequestMapping("update")
    public String update(Integer id, String name) throws Exception {
        SProperty p = (SProperty) serviceService.get(id);
        p.setName(name);
        spropertyService.update(p);
        return "redirect:list?cid="+p.getType().getId();
    }

    @RequestMapping("delete")
    public String delete(Integer id) throws Exception {
        SProperty p = (SProperty) spropertyService.get(id);
        spropertyService.delete(p);
        return "redirect:list?cid="+p.getType().getId();
    }
}