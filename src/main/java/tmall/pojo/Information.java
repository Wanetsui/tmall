package tmall.pojo;

import java.util.Date;

import tmall.mapper.InformationMapper;
import tmall.pojo.extension.InformationExtension;

public class Information {
    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    private String title;

    private String info;


    private Date createTime;

    private int catalog;

    public int getCatalog() {
        return catalog;
    }

    public void setCatalog(int catalog) {
        this.catalog = catalog;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }


    public String getInfo() {
        return info;
    }


    public void setInfo(String info) {
        this.info = info == null ? null : info.trim();
    }


    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}