package tmall.controller.front;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import tmall.annotation.Nullable;
import tmall.pojo.*;
import tmall.util.Pagination;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/")
public class ShowController extends FrontBaseController {
    @RequestMapping("/")
    public String pageIndex(){
        return "index";
    }
    @RequestMapping("/index")
    public String loginIn( Model model){

        return "index";
    }
    @RequestMapping("/home")
    public String home(Model model) throws Exception {
        Pagination pagination = new Pagination();
        pagination.setCount(13);
        List<Category> categories = categoryService.
                list("depth", 1, "pagination", pagination, "recommend_gt", 0, "order", "recommend desc, id desc");
        for (Category category : categories) {
            category.setProducts(productService
                    .list("cid", category.getId(), "stock_gt", 0));
        }
        model.addAttribute("categories", categories);
        return "home";
    }
    @RequestMapping("/information")
    public String information(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage, Model model) throws Exception {
        System.out.println(informationService.selectByPrimaryKey(1));
        System.out.println(informationService.selectCount());

        //List<Information> informations =   informationService.selectInformationList();
        model.addAttribute("pagemsg", informationService.findByPage(currentPage));
        model.addAttribute("informations", informationService.findByPage(currentPage).getLists());
        return "information";
    }
    @RequestMapping("/gopublish")
    public String gopublish(){
        return "publish";
    }
    @RequestMapping("/publish")
    public String publish(HttpServletRequest request){
        String title =  request.getParameter("title");
        String info =  request.getParameter("context");

        Information information = new Information();
        information.setTitle(title);
        information.setInfo(info);
        informationService.insert(information);
        return "redirect:/information";
    }

    @RequestMapping("/shome")
    public String shome(Model model) throws Exception {
        Pagination pagination = new Pagination();
        pagination.setCount(13);
        List<Type> types = typeService.
                list("depth", 1, "pagination", pagination, "recommend_gt", 0, "order", "recommend desc, id desc");

        for (Type type : types) {
            type.setServices(serviceService
                    .list("cid", type.getId(), "stock_gt", 0));
        }
        model.addAttribute("types", types);
        return "shome";
    }

    @RequestMapping("product")
    public String product(Integer id, Model model) throws Exception {
        Product product = (Product) productService.get(id);
        List<ProductImage> productTopImages = productImageService.list("pid", product.getId(), "type", ProductImage.Type.top.toString(), "order", "id asc");
        List<ProductImage> productDetailImages = productImageService.list("pid", product.getId(), "type", ProductImage.Type.detail.toString(), "order", "id asc");
        List<Comment> comments = commentService.list("pid", product.getId());
        List<PropertyValue> propertyValues = propertyValueService.list("pid", product.getId());
        model.addAttribute("productTopImages", productTopImages);
        model.addAttribute("productDetailImages", productDetailImages);
        model.addAttribute("comments", comments);
        model.addAttribute("propertyValues", propertyValues);
        model.addAttribute("product", product);
        return "product";
    }
    @RequestMapping("service")
    public String service(Integer id, Model model) throws Exception {
        Service service = (Service) serviceService.get(id);
        List<ServiceImage> serviceTopImages = serviceImageService.list("pid", service.getId(), "type", ServiceImage.Type.top.toString(), "order", "id asc");
        List<ServiceImage> serviceDetailImages = serviceImageService.list("pid", service.getId(), "type", ServiceImage.Type.detail.toString(), "order", "id asc");
      //  List<Comment> comments = commentService.list("pid", service.getId());
        List<SPropertyValue> spropertyValues = spropertyValueService.list("pid", service.getId());
        model.addAttribute("serviceTopImages", serviceTopImages);
        model.addAttribute("serviceDetailImages", serviceDetailImages);
       // model.addAttribute("comments", comments);
        model.addAttribute("propertyValues", spropertyValues);
        model.addAttribute("service", service);
        return "service";
    }
    @RequestMapping("category")
    public String category(Integer id, @Nullable String sort, Model model) throws Exception {
        Category category = (Category) categoryService.get(id);
        List<Product> products = productService
                .list("cid", category.getId(), "order", handleSort(sort), "stock_gt", 0);
        model.addAttribute("products", products);
        model.addAttribute("category", category);
        return "category";
    }

    @RequestMapping("type")
    public String type(Integer id, @Nullable String sort, Model model) throws Exception {
        System.out.println("id  " + id);
        Type type = (Type) typeService.get(id);
        List<Service> services = productService
                .list("cid", type.getId(), "order", handleSort(sort), "stock_gt", 0);
        model.addAttribute("services", services);
        model.addAttribute("type", type);
        return "type";
    }

    @RequestMapping("search")
    public String search(String keyword, @Nullable String sort, Model model) throws Exception {
        if (keyword.length() == 0) {
            return "search";
        }
        System.out.println("search keyword" + keyword + "  " + sort + "  ");
        List<Product> products = productService
                .list("name_like", keyword, "order", handleSort(sort), "stock_gt", 0);
        model.addAttribute("products", products);
        model.addAttribute("keyword", keyword);
        return "search";
    }

    @RequestMapping("searchService")
    public String searchService(String keyword, @Nullable String sort, Model model) throws Exception {
        if (keyword.length() == 0) {
            return "searchService";
        }
        System.out.println("search keyword" + keyword + "  " + sort + "  ");
         List<Service> services = serviceService.list("name_like",keyword);

        model.addAttribute("services", services);
        model.addAttribute("keyword", keyword);
        return "searchService";
    }

    private String handleSort(String sort) {
        sort = sort == null ? "" : sort;
        String column = "";
        String order = "desc";
        switch (sort) {
            case "date":
                column = "createDate";
                break;
            case "comment":
                column = "commentCount";
                break;
            case "saleCount":
                column = "saleCount";
                break;
            case "price":
                column = "nowPrice";
                order = "asc";
                break;
            case "priceInverse":
                column = "nowPrice";
                break;
            default:
                column = "commentCount";
                break;
        }
        String res = String.format("%s %s , id desc", column, order);
        return res;
    }
}
