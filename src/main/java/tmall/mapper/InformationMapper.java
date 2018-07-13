package tmall.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import tmall.pojo.Information;

public interface InformationMapper {
    Information selectByPrimaryKey(Integer id);
    List<Information> selectInformationList();
    int selectCount();
    List<Information> findByPage(HashMap<String,Object> map);
    int insert(Information information);
    int delete(int id);
    int edit(@Param("id") int id,@Param("title") String title,@Param("info") String info);
}