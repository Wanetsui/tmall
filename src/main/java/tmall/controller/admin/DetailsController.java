package tmall.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import tmall.annotation.Auth;
import tmall.pojo.Advance;
import tmall.pojo.Details;
import tmall.pojo.Order;
import tmall.pojo.User;
import tmall.pojo.extension.DetailsExtension;
import tmall.util.Pagination;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin/details")
public class DetailsController extends AdminBaseController {
    @Auth(User.Group.admin)
    @RequestMapping("list")
    public String list(Model model, Pagination pagination) throws Exception {
        List<Details> details = detailsService.
                list("pagination", pagination, "depth", 3);
        System.out.println(details.size());
        model.addAttribute("details", details);
        return "admin/listDetails";
    }

    @Auth(User.Group.admin)
    @RequestMapping("deliver")
    public String list(Integer oid) throws Exception {
        Details details = (Details) detailsService.get(oid);
        details.setStatus(Details.Status.waitConfirm);
        details.setDeliverDate(new Date());
        advanceService.update(details);
        return "redirect:list";
    }

}