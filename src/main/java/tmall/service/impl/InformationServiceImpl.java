package tmall.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tmall.mapper.InformationMapper;
import tmall.pojo.Information;
import tmall.service.InformationService;
import tmall.util.PageBean;

import java.util.HashMap;
import java.util.List;

@Service
public class InformationServiceImpl  implements InformationService {
    @Autowired
    InformationMapper informationMapper;
    @Override
    public Information selectByPrimaryKey(Integer id) {
        return informationMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Information> selectInformationList() {
        return informationMapper.selectInformationList();
    }

    @Override
    public int selectCount() {
        return informationMapper.selectCount();
    }

    @Override
    public PageBean<Information> findByPage(int currentPage) {
        HashMap<String,Object> map = new HashMap<String,Object>();
        PageBean<Information> pageBean = new PageBean<Information>();

        //封装当前页数
        pageBean.setCurrPage(currentPage);

        //每页显示的数据
        int pageSize=2;
        pageBean.setPageSize(pageSize);

        //封装总记录数
        int totalCount = informationMapper.selectCount();
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc = totalCount;
        Double num =Math.ceil(tc/pageSize);//向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("start",(currentPage-1)*pageSize);
        map.put("size", pageBean.getPageSize());
        //封装每页显示的数据
        List<Information> lists = informationMapper.findByPage(map);
        pageBean.setLists(lists);

        return pageBean;
    }

    @Override
    public int insert(Information information) {
        return informationMapper.insert(information);
    }

    @Override
    public int update(int id, String title, String info) {
        return informationMapper.edit(id,title,info);
    }

    @Override
    public int delete(int id) {
        return informationMapper.delete(id);
    }
}
