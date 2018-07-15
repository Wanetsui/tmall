package tmall.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import tmall.annotation.Auth;
import tmall.annotation.Nullable;
import tmall.pojo.Category;
import tmall.pojo.Type;
import tmall.pojo.User;
import tmall.util.Pagination;
import tmall.util.UploadedImageFile;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin/type")
public class TypeController extends AdminBaseController{
    @Auth(User.Group.admin)
    @RequestMapping("list")
    public String list(Model model, Pagination pagination) throws Exception {
        List<Type> types = typeService.
                list("pagination", pagination, "order", "recommend desc, id desc");
        model.addAttribute("types", types);
        return "admin/listType";
    }

    @RequestMapping("add")
    public String add(String name, Integer recommend,
                      UploadedImageFile uploadedImageFile) throws Exception {
        Type c = new Type();
        c.setName(name);
        c.setRecommend(recommend);
        typeService.add(c);
       fileUtil.saveImg(uploadedImageFile, "type", c.getId() + ".jpg");
        return "redirect:list";
    }

    @Auth(User.Group.admin)
    @RequestMapping("edit")
    public String edit(Integer id, Model model) throws Exception {
        Type type = (Type) typeService.get(id);
        model.addAttribute(type);
        return "admin/editType";
    }

    @RequestMapping("update")
    public String update(Integer id, String name, Integer recommend,
                         @Nullable UploadedImageFile uploadedImageFile, HttpSession session) throws Exception {

        Type c = (Type) typeService.get(id);
        c.setRecommend(recommend);
        c.setName(name);
        typeService.update(c);
        if (uploadedImageFile.getImage().getSize() > 0) {
            fileUtil.saveImg(uploadedImageFile, "type", c.getId() + ".jpg");
        }
        //清空搜索栏下的cs缓存
        session.removeAttribute("cs");
        return "redirect:list";
    }

    @RequestMapping("delete")
    public String delete(Integer id, HttpSession session) throws Exception {
        typeService.delete(typeService.get(id));
        session.removeAttribute("cs");
        return "redirect:list";
    }
}
