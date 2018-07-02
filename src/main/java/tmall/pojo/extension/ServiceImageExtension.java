package tmall.pojo.extension;

import tmall.annotation.ORMAnnotation.JoinColumn;
import tmall.annotation.ORMAnnotation.ManyToOne;
import tmall.pojo.Product;
import tmall.pojo.Service;
import tmall.pojo.base.BasePOJO;

public class ServiceImageExtension extends BasePOJO {
    @ManyToOne
    @JoinColumn(name = "pid")
    private Service service;

    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }

    public enum Type{
        top,detail,cover;
    }
    public String getPath(){
        return getId()+".jpg";
    }

}
