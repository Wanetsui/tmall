package tmall.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import tmall.annotation.Auth;
import tmall.pojo.*;
import tmall.service.ServiceImageService;
import tmall.util.UploadedImageFile;

import java.util.List;

@Controller
@RequestMapping("/admin/service/image")
public class ServiceImageController extends AdminBaseController {
    @Auth(User.Group.admin)
    @RequestMapping("list")
    public String list(Integer pid, Model model) throws Exception {
        List<ServiceImage> productTopImages = serviceImageService
                .list("pid", pid, "type", ServiceImage.Type.top.toString(),"order","id asc");
        List<ServiceImage> productDetailImages = serviceImageService
                .list("pid", pid, "type", ServiceImage.Type.detail.toString(),"order","id asc");
        Service product = (Service) serviceService.get(pid);
        model.addAttribute("service", product);
        model.addAttribute("serviceCoverImage", product.getImage());
        model.addAttribute("serviceTopImages", productTopImages);
        model.addAttribute("serviceDetailImages", productDetailImages);

        return "admin/listServiceImage";
    }

    @RequestMapping("add")
    public String add(Integer pid, String type, UploadedImageFile uploadedImageFile) throws Exception {
        ServiceImage productImage = new ServiceImage();
        productImage.setPid(pid);
        productImage.setType(type);
        serviceImageService.add(productImage);
        fileUtil.saveImg(uploadedImageFile, "service", productImage.getId() + ".jpg");
        if (productImage.getType().equals(ServiceImage.Type.cover.toString())) {
            Service product = (Service) serviceService.get(pid);
            product.setImage(productImage);
            serviceService.update(product);
        }
        return "redirect:list?pid=" + pid;
    }

    @RequestMapping("delete")
    public String delete(Integer id) throws Exception {
        ServiceImage productImage = (ServiceImage) serviceImageService.get(id);
        serviceImageService.delete(productImage);
        return "redirect:list?pid=" + productImage.getService().getId();
    }
}