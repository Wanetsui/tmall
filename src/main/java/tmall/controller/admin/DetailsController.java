package tmall.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import tmall.annotation.Auth;
import tmall.annotation.Nullable;
import tmall.pojo.*;
import tmall.pojo.extension.DetailsExtension;
import tmall.util.Pagination;

import javax.servlet.http.HttpSession;
import java.lang.annotation.Native;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin/details")
public class DetailsController extends AdminBaseController {
    @Autowired
    HttpSession session;
    @Auth(User.Group.admin)
    @RequestMapping("list")
    public String list(Model model, Pagination pagination, @Nullable String flag) throws Exception {
        if(flag == null) {
            List<Details> details = detailsService.
                    list("pagination", pagination, "depth", 3);
            model.addAttribute("detailses", details);
        }
        else{
            List<Details> details = detailsService.
                    list("pagination", pagination, "depth", 3, "order", "deliverDate desc");
            model.addAttribute("detailses", details);
        }
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
    @Auth(User.Group.admin)
    @RequestMapping("choice")
    public String choice(Integer oid,String mobile,Model model) throws Exception {
        System.out.println(oid);
        int sid = detailsItemService.getSidByOid(oid);
        List<Worker> workers = workerService.selectWorkerList(sid);
        System.out.println(workers.size());
        model.addAttribute("workers", workers);
        model.addAttribute("oid",oid);
        model.addAttribute("mobile",mobile);
        return "admin/choice";
    }
    @Auth(User.Group.admin)
    @RequestMapping("assign")
    public String assgin(Integer oid,String mobile,String wname,Model model) throws Exception {
        System.out.println(oid);
        System.out.println(mobile);
        System.out.println(wname);
        DetailWorker detailWorker = new DetailWorker();
        detailWorker.setOid(oid);
        detailWorker.setMobile(mobile);
        detailWorker.setWname(wname);
        detailWorkerService.insert(detailWorker);
        workerService.update(wname);
        return "redirect:list";
    }

    @RequestMapping("orderBydeliverTime")
    public String orderBydeliverTime(){
        return "redirect:list?flag=1";
    }

}