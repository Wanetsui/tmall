package tmall.pojo.extension;

import tmall.annotation.ORMAnnotation.JoinColumn;
import tmall.annotation.ORMAnnotation.ManyToOne;
import tmall.annotation.ORMAnnotation.OneToMany;
import tmall.pojo.Category;
import tmall.pojo.ProductImage;
import tmall.pojo.ServiceImage;
import tmall.pojo.Type;
import tmall.pojo.base.BasePOJO;

import java.util.List;

public class ServiceExtension extends BasePOJO {
    @ManyToOne
    @JoinColumn(name = "cid")
    private Type type;

    @ManyToOne
    @JoinColumn(name="imgid")
    private ServiceImage image;
    @OneToMany
    @JoinColumn(name="pid")
    private List<ServiceImage> serviceImages;

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public ServiceImage getImage() {
        return image;
    }

    public void setImage(ServiceImage image) {
        this.image = image;
    }

    public List<ServiceImage> getServiceImages() {
        return serviceImages;
    }

    public void setServiceImages(List<ServiceImage> serviceImages) {
        this.serviceImages = serviceImages;
    }
}
