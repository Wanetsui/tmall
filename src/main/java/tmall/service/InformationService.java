package tmall.service;

import tmall.pojo.Information;
import tmall.util.PageBean;

import java.util.List;

public interface InformationService {
    Information selectByPrimaryKey(Integer id);
    List<Information> selectInformationList();
    int selectCount();
    PageBean<Information> findByPage(int currentPage);
    int insert(Information information);
    int delete(int id);
    int update(int id,String title,String  info);
    List<Information> searchByKeyword(String keyword);
}
