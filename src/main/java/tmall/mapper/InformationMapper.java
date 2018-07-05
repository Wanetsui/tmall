package tmall.mapper;

import java.util.HashMap;
import java.util.List;
import tmall.pojo.Information;

public interface InformationMapper {
    Information selectByPrimaryKey(Integer id);
    List<Information> selectInformationList();
    int selectCount();
    List<Information> findByPage(HashMap<String,Object> map);
}