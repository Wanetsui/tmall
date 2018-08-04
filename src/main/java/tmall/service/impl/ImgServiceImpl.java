package tmall.service.impl;


import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import tmall.service.ImgService;
import tmall.util.SFTPUtil;

import java.io.Console;
import java.io.InputStream;

@Service
public class ImgServiceImpl implements ImgService {
    @Override
    public String uploadIMG(MultipartFile file,int id) {
        if (!file.isEmpty()) {
            String fileName = file.getOriginalFilename();
            String type = null;
            type = fileName.indexOf(".") != -1 ? fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length()) : null;

            if (type != null) {
                if ("GIF".equals(type.toUpperCase()) || "PNG".equals(type.toUpperCase()) || "JPG".equals(type.toUpperCase())) {

//            自定义的文件名称

                    String trueFileName = "woaiwanying" + id + "." + type;
                    try {
//
//                        SFTPUtil sftp = new SFTPUtil("dingding", "ddtc168Dev", "182.92.99.168", 1008);
//                        sftp.login();
//                        InputStream inputStream = file.getInputStream();
//                        sftp.upload("/ddtc/image", "parkingMatch", trueFileName, inputStream);
//
//                        sftp.logout();
//                        return "http://test.dingdingtingche.com/ddtcCircle/image/parkingMatch/"+trueFileName;

                        SFTPUtil sftp = new SFTPUtil("root", "031415Cwy", "47.100.58.159", 22);
                        sftp.login();
                        InputStream inputStream = file.getInputStream();
                        sftp.upload("/usr/magic", "img", trueFileName, inputStream);

                        sftp.logout();
                        return "http://47.100.58.159/img/"+trueFileName;
                    } catch (Exception e) {
                        e.printStackTrace();
                    }


                }
            }
        }

        return "error";
    }
}
