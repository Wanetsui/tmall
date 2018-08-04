package tmall.mapper;

import tmall.pojo.ImgPath;
import tmall.pojo.Worker;

import java.util.List;

public interface ImgPathMapper {
    List<ImgPath> selectImgPathList(int id);
    int insert(ImgPath  imgPath);
}
