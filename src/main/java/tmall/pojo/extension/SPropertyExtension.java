package tmall.pojo.extension;

import tmall.annotation.ORMAnnotation.JoinColumn;
import tmall.annotation.ORMAnnotation.ManyToOne;
import tmall.pojo.Category;
import tmall.pojo.Type;
import tmall.pojo.base.BasePOJO;

public class SPropertyExtension extends BasePOJO {
    @ManyToOne
    @JoinColumn(name="cid")
    private Type type;

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }
}
