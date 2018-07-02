package tmall.pojo.extension;

import tmall.annotation.ORMAnnotation.JoinColumn;
import tmall.annotation.ORMAnnotation.ManyToOne;
import tmall.pojo.Details;
import tmall.pojo.Order;
import tmall.pojo.Product;
import tmall.pojo.Service;
import tmall.pojo.base.BasePOJO;

public class DetailsItemExtension extends BasePOJO {
    @ManyToOne
    @JoinColumn(name="pid")
    private Service service;
    @ManyToOne
    @JoinColumn(name="oid")
    private Details details;

    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }

    public Details getDetails() {
        return details;
    }

    public void setDetails(Details details) {
        this.details = details;
    }
}
