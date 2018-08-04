package tmall.service;

import org.springframework.web.multipart.MultipartFile;

public interface ImgService {
    String uploadIMG(MultipartFile file,int id);
}
