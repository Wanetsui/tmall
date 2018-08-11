package tmall.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tmall.mapper.InformationMapper;
import tmall.pojo.Inform;
import tmall.pojo.Information;
import tmall.service.InformationService;
import tmall.util.PageBean;

import javax.sound.sampled.Line;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class InformationServiceImpl implements InformationService {
    @Autowired
    InformationMapper informationMapper;

    @Override
    public Inform selectByPrimaryKey(Integer id) {
        Information information = informationMapper.selectByPrimaryKey(id);
        Inform inform = new Inform();
        inform.setId(information.getId());
        inform.setCatalog(information.getCatalog());
        inform.setInfo(information.getInfo());
        inform.setTitle(information.getTitle());
        inform.setCreateTime(changeDate(information.getCreateTime()));

        return inform;
    }

    @Override
    public List<Inform> selectInformationList() {
        List<Information> informationList = informationMapper.selectInformationList();
        List<Inform> informs = new ArrayList<>();
        for (Information information : informationList) {
            Inform inform = new Inform();
            inform.setId(information.getId());
            inform.setCatalog(information.getCatalog());
            inform.setInfo(information.getInfo());
            inform.setTitle(information.getTitle());
            inform.setCreateTime(changeDate(information.getCreateTime()));
            informs.add(inform);
        }

        System.out.println(informs.size());
        return informs;
    }

    @Override
    public int selectCount() {
        return informationMapper.selectCount();
    }

    @Override
    public PageBean<Inform> findByPage(int currentPage) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        PageBean<Inform> pageBean = new PageBean<Inform>();

        //封装当前页数
        pageBean.setCurrPage(currentPage);

        //每页显示的数据
        int pageSize = 2;
        pageBean.setPageSize(pageSize);

        //封装总记录数
        int totalCount = informationMapper.selectCount();
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc = totalCount;
        Double num = Math.ceil(tc / pageSize);//向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("start", (currentPage - 1) * pageSize);
        map.put("size", pageBean.getPageSize());
        //封装每页显示的数据
        List<Information> lists = informationMapper.findByPage(map);
        List<Inform> informs = new ArrayList<>();
        for (Information information : lists) {
            Inform inform = new Inform();
            inform.setId(information.getId());
            inform.setCatalog(information.getCatalog());
            inform.setInfo(information.getInfo());
            inform.setTitle(information.getTitle());
            inform.setCreateTime(changeDate(information.getCreateTime()));
            informs.add(inform);
        }
        pageBean.setLists(informs);

        return pageBean;
    }

    @Override
    public int insert(Information information) {
        return informationMapper.insert(information);
    }

    @Override
    public List<Inform> searchByKeyword(String keyword, int cata) {
        List<Information> informationList = informationMapper.searchByKeyword(keyword, cata);
        List<Inform> informs = new ArrayList<>();
        for (Information information : informationList) {
            Inform inform = new Inform();
            inform.setId(information.getId());
            inform.setCatalog(information.getCatalog());
            inform.setInfo(information.getInfo());
            inform.setTitle(information.getTitle());
            inform.setCreateTime(changeDate(information.getCreateTime()));
            informs.add(inform);
        }

        System.out.println(informs.size());
        return informs;
    }

    @Override
    public List<Inform> getInfomationsByCatalog(int catalog) {
        List<Information> informationList = informationMapper.getInformationsByCatalog(catalog);
        List<Inform> informs = new ArrayList<>();
        for (Information information : informationList) {
            Inform inform = new Inform();
            inform.setId(information.getId());
            inform.setCatalog(information.getCatalog());
            inform.setInfo(information.getInfo());
            inform.setTitle(information.getTitle());
            inform.setCreateTime(changeDate(information.getCreateTime()));
            informs.add(inform);
        }

        System.out.println(informs.size());
        return informs;
    }

    @Override
    public List<Inform> getlimitInfomationsByCatalog(int catalog) {
        List<Information> informationList = informationMapper.getlimitInformationsByCatalog(catalog);
        List<Inform> informs = new ArrayList<>();
        for (Information information : informationList) {
            Inform inform = new Inform();
            inform.setId(information.getId());
            inform.setCatalog(information.getCatalog());
            inform.setInfo(information.getInfo());
            inform.setTitle(information.getTitle());
            inform.setCreateTime(changeDate(information.getCreateTime()));
            informs.add(inform);
        }

        System.out.println(informs.size());
        return informs;
    }

    @Override
    public int update(int id, String title, String info) {
        return informationMapper.edit(id, title, info);
    }

    @Override
    public int delete(int id) {
        return informationMapper.delete(id);
    }

    public String changeDate(Date date){
        String dateString = date.toString();
        SimpleDateFormat sdf = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy", Locale.US);
        TimeZone tz = TimeZone.getTimeZone("GMT+8");
        sdf.setTimeZone(tz);
        String str = sdf.format(Calendar.getInstance().getTime());
        Date s = null;
        try {
            s = sdf.parse(dateString);
            sdf = new SimpleDateFormat("yyyy-MM-dd");
            System.out.println(sdf.format(s));
//                information.setCreateTime(sdf.parse(sdf.format(s)));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return sdf.format(s);
    }

}
