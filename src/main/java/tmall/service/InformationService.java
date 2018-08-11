package tmall.service;

import tmall.pojo.Inform;
import tmall.pojo.Information;
import tmall.util.PageBean;

import java.util.List;

public interface InformationService {
    Inform selectByPrimaryKey(Integer id);
    List<Inform> selectInformationList();
    int selectCount();
    PageBean<Inform> findByPage(int currentPage);
    int insert(Information information);
    int delete(int id);
    int update(int id,String title,String  info);
    List<Inform> searchByKeyword(String keyword,int cata);
    List<Inform> getInfomationsByCatalog(int catalog);
    List<Inform> getlimitInfomationsByCatalog(int catalog);
}
