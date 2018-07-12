package tmall.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import tmall.controller.BaseController;
import tmall.pojo.Information;
import tmall.service.InformationService;

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
    public String edit(int id){
        System.out.println(id);
        informationService.delete(id);
        return "redirect:list";
    }

    @RequestMapping("add")
    public String add(int id){
        System.out.println(id);
        informationService.delete(id);
        return "redirect:list";
    }




}
