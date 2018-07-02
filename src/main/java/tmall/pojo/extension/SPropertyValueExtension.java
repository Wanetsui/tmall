package tmall.pojo.extension;

import tmall.annotation.ORMAnnotation.JoinColumn;
import tmall.annotation.ORMAnnotation.ManyToOne;
import tmall.pojo.Product;
import tmall.pojo.Property;
import tmall.pojo.SProperty;
import tmall.pojo.Service;
import tmall.pojo.base.BasePOJO;

public class SPropertyValueExtension extends BasePOJO {
    @ManyToOne
    @JoinColumn(name="pid")
    private Service service;
    @ManyToOne
    @JoinColumn(name="ptid")
    private SProperty sproperty;
    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }

    public SProperty getSproperty() {
        return sproperty;
    }

    public void setSproperty(SProperty sproperty) {
        this.sproperty = sproperty;
    }



}
