package tmall.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import tmall.controller.BaseController;
import tmall.pojo.Inform;
import tmall.pojo.Information;
import tmall.service.InformationService;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin/inform")
public class InformationController extends BaseController{
    @Autowired
    InformationService informationService;
    @RequestMapping("list")
    public String show(Model model){
       List<Inform> informationList =  informationService.selectInformationList();
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
    /*public String add(int id){
        System.out.println(id);
        informationService.delete(id);
        return "redirect:list";
    }*/
    public String add(String subject, String message, String recommend) throws Exception {
        Information c = new Information();
        c.setTitle(subject);
        c.setInfo(message);
        int catalog = 0;
        if(recommend.equals("物业公告")){
            catalog = 1;
        }else if (recommend.equals("社区通知")){
            catalog=2;
        }else if (recommend.equals("二手出售")){
            catalog=3;
        }else if (recommend.equals("社区交流")){
            catalog = 4;
        }
        c.setCatalog(catalog);
        c.setCreateTime(new Date());
        informationService.insert(c);
        return "redirect:list";
    }




}
