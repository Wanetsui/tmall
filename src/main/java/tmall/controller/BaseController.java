package tmall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ExceptionHandler;
import tmall.service.*;
import tmall.util.FileUtil;

import javax.servlet.http.HttpServletRequest;

/**
 *  BaseController 负责 Autowired 和 错误处理
 */

public class BaseController {
    @Autowired
    public PropertyService propertyService;
    @Autowired
    public SPropertyService spropertyService;
    @Autowired
    public CategoryService categoryService;
    @Autowired
    public TypeService typeService;
    @Autowired
    public ProductService productService;
    @Autowired
    public ServiceService serviceService;
    @Autowired
    public ProductImageService productImageService;
    @Autowired
    public ServiceImageService serviceImageService;
    @Autowired
    public PropertyValueService propertyValueService;
    @Autowired
    public SPropertyValueService spropertyValueService;
    @Autowired
    public ConfigService configService;
    @Autowired
    public OrderService orderService;
    @Autowired
    public UserService userService;
    @Autowired
    public OrderItemService orderItemService;
    @Autowired
    public AdvanceService advanceService;
    @Autowired
    public CommentService commentService;
    @Autowired
    public CartItemService cartItemService;
    @Autowired
    public FileUtil fileUtil;



    /**
     * 全局异常处理
     */
    @ExceptionHandler
    public String handleException(HttpServletRequest request, Exception exception) {
        exception.printStackTrace();
        return "500";
    }
}
