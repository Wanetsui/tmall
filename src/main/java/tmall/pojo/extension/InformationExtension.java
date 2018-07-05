package tmall.pojo.extension;

import tmall.annotation.ORMAnnotation.JoinColumn;
import tmall.annotation.ORMAnnotation.OneToMany;
import tmall.pojo.Detailsitem;
import tmall.pojo.Information;
import tmall.pojo.base.BasePOJO;

import java.util.List;

public class InformationExtension extends BasePOJO {
    public List<Information> getInformations() {
        return informations;
    }

    public void setInformations(List<Information> informations) {
        this.informations = informations;
    }

    @OneToMany
    @JoinColumn(name = "oid")
    private List<Information> informations;

}
