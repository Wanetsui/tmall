package tmall.pojo.extension;

import tmall.annotation.ORMAnnotation.JoinColumn;
import tmall.annotation.ORMAnnotation.OneToMany;
import tmall.pojo.Product;
import tmall.pojo.Service;
import tmall.pojo.base.BasePOJO;

import java.util.List;

public class TypeExtension extends BasePOJO {
    @OneToMany
    @JoinColumn(name = "cid")
    private List<Service> services;


    public String getImgPath() {
        return getId() + ".jpg";
    }

    public List<Service> getServices() {
        return services;
    }

    public void setServices(List<Service> services) {
        this.services = services;
    }
}
