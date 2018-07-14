package tmall.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import tmall.annotation.Auth;
import tmall.pojo.*;

import java.util.List;

@Controller
@RequestMapping("/admin/service/propertyServiceValue")
public class SPropertyValueController extends AdminBaseController {
    @Auth(User.Group.admin)
    @RequestMapping("edit")
    public String edit(Integer pid, Model model) throws Exception {
        Service product = (Service) serviceService.get(pid);
        spropertyValueService.init(product);
        List<SPropertyValue> propertyValues = spropertyValueService.list("pid", pid);
        model.addAttribute("propertyServiceValues", propertyValues);
        model.addAttribute("service", product);
        return "admin/editServicePropertyValue";
    }

    @RequestMapping("update")
    public String update(Integer pid, Integer[] id, String[] value) throws Exception {
        spropertyValueService.update(id, value, "value");
        return "redirect:edit?pid=" + pid;
    }

}