package tmall.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import tmall.controller.BaseController;
import tmall.pojo.Information;
import tmall.service.InformationService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/admin/inform")
public class InformationController extends BaseController{
    @Autowired
    InformationService informationService;
    @RequestMapping("list")
    public String show(Model model){
       List<Information> informationList =  informationService.selectInformationList();
       model.addAttribute("informations",informationList);
       return "admin/listInform";
    }

    @RequestMapping("delete")
    public String delete(int id){
        System.out.println(id);
      informationService.delete(id);
        return "redirect:list";
    }

    @RequestMapping("edit")
    public String edit(int id,Model model){
        System.out.println(id);
        model.addAttribute("id",id);
        return "admin/editInform";
    }
    @RequestMapping("update")
    public String edit(HttpServletRequest request){
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String recommend = request.getParameter("recommend");
        System.out.println(id+name+recommend);
        informationService.update(Integer.valueOf(id),name,recommend);
        return "redirect:list";
    }

    @RequestMapping("add")
    public String add(int id){
        System.out.println(id);
        informationService.delete(id);
        return "redirect:list";
    }




}
