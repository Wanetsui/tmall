package tmall.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import tmall.annotation.Auth;
import tmall.annotation.Nullable;
import tmall.pojo.*;
import tmall.util.Pagination;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
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
    /*@RequestMapping("/information")
    public String information(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage, Model model) throws Exception {
        System.out.println(informationService.selectByPrimaryKey(1));
        System.out.println(informationService.selectCount());

        //List<Information> informations =   informationService.selectInformationList();
        model.addAttribute("pagemsg", informationService.findByPage(currentPage));
        model.addAttribute("informations", informationService.findByPage(currentPage).getLists());
        return "information";
    }*/
    @RequestMapping("/readmore")
    public String readmore( Model model,int catalog) throws Exception {
        model.addAttribute("informations", informationService.getInfomationsByCatalog(catalog));
        model.addAttribute("catalog", catalog);
        System.out.println(informationService.getInfomationsByCatalog(catalog).size());
        return "readmore";
    }
    @RequestMapping("/concrete")
    public String concrete( Model model,int id) throws Exception {
        model.addAttribute("informations", informationService.selectByPrimaryKey(id));
        System.out.println(informationService.selectByPrimaryKey(id).getTitle());
        return "concrete";
    }
//    @RequestMapping("/inform")
//    public String inform(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage, Model model) throws Exception {
////        System.out.println(informationService.selectByPrimaryKey(1));
////        System.out.println(informationService.selectCount());
//       // System.out.println(currentPage);
//        //List<Information> informations =   informationService.selectInformationList();
//       // model.addAttribute("pagemsg", informationService.findByPage(currentPage));
//        model.addAttribute("informations", informationService.findByPage(currentPage).getLists());
//        return "inform";
//    }
    /*@Auth(User.Group.user)*/
    @RequestMapping("/inform")
    public String info( Model model) throws Exception {
//        System.out.println(informationService.selectByPrimaryKey(1));
//        System.out.println(informationService.selectCount());
        //List<Information> informations =   informationService.selectInformationList();
        model.addAttribute("informations", informationService.selectInformationList());
        System.out.println(informationService.selectInformationList().size());
        return "inform";
    }
    @Auth(User.Group.user)
    @RequestMapping("/gopublish")
    public String gopublish(){
        return "publish";
    }
    @RequestMapping("/publish")
    public String publish(HttpServletRequest request){
        String title =  request.getParameter("subject");
        String info =  request.getParameter("message");
        String select = request.getParameter("select");
        System.out.println(select);
        int catalog = 0;
        if(select.equals("物业公告")){
            catalog = 1;
        }else if (select.equals("社区通知")){
            catalog=2;
        }else if (select.equals("二手出售")){
            catalog=3;
        }else if (select.equals("失物招领")){
            catalog = 4;
        }
        System.out.println(catalog);
        Information information = new Information();
        information.setTitle(title);
        information.setInfo(info);
        information.setCatalog(catalog);
        information.setCreateTime(new Date());
        informationService.insert(information);


        return "redirect:/inform";
    }

    @RequestMapping("keySearch")
    public String KeySearch(String keyword,Model model){

        List<Information> informationList = informationService.searchByKeyword("test");
        System.out.println("keyword  :"+informationList.size());
        model.addAttribute("searchResult",informationList);
        return "redirect:/inform";
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
        List<Service> services = serviceService
                .list("cid", type.getId());
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
