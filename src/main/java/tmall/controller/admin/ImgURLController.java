package tmall.controller.admin;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import tmall.service.ImgService;

import javax.servlet.http.HttpServletRequest;
import java.io.*;

@RequestMapping("/Img")
@Controller
public class ImgURLController {


    @Autowired
    ImgService imgService;
//
//    @ResponseBody
//    @RequestMapping("upload")
//    public String upload(HttpServletRequest request, @RequestParam(value = "file", required = false) MultipartFile file) throws IOException {
//
//        request.setCharacterEncoding("UTF-8");
//        String user = request.getParameter("user");
//        System.out.println("user:" + user);
//        if (!file.isEmpty()) {
//            String fileName = file.getOriginalFilename();
//            String path = null;
//            String dirpath = null;
//            String type = null;
//            type = fileName.indexOf(".") != -1 ? fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length()) : null;
//
//            if (type != null) {
//                if ("GIF".equals(type.toUpperCase()) || "PNG".equals(type.toUpperCase()) || "JPG".equals(type.toUpperCase())) {
//                    // 项目在容器中实际发布运行的根路径
//                    String realPath = request.getSession().getServletContext().getRealPath("/");
//                    // 自定义的文件名称
//                    //String trueFileName = String.valueOf(System.currentTimeMillis()) + fileName;
//                    String trueFileName = "ddtcpm" + String.valueOf(System.currentTimeMillis()) + "." + type;
//                    // 设置存放图片文件的路径
//                    dirpath = realPath + "uploads/";
//                    File dirFile = new File(dirpath);
//                    if (!dirFile.isDirectory() && !dirFile.exists()) {
//                        dirFile.mkdir();
//                    }
//                    path = realPath + "uploads/" + trueFileName;
//                    File imgFile = new File(path);
//                    if (!imgFile.exists()) {
//                        imgFile.createNewFile();
//                    }
//                    //file.transferTo(new File(path));
//                    file.transferTo(imgFile);
//                    return trueFileName;
//                } else {
//                    return "error";
//                }
//            } else {
//                return "error";
//            }
//        } else {
//            return "error";
//        }
//    }

    @ResponseBody
    @RequestMapping("uploadIMG")
    public void uploadIMG(HttpServletRequest request, @RequestParam(value = "file", required = false) MultipartFile file) throws IOException {

        request.setCharacterEncoding("UTF-8");
        String user = request.getParameter("user");
        System.out.println("user:" + user);
        String result = imgService.uploadIMG(file,1);


    }


}
