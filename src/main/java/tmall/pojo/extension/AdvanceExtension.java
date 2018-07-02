package tmall.pojo.extension;

import tmall.annotation.ORMAnnotation.JoinColumn;
import tmall.annotation.ORMAnnotation.ManyToOne;
import tmall.pojo.Product;
import tmall.pojo.Service;
import tmall.pojo.User;
import tmall.pojo.base.BasePOJO;

public class AdvanceExtension extends BasePOJO {
    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @ManyToOne
    @JoinColumn(name = "pid")
    private Service service;
    @ManyToOne
    @JoinColumn(name = "uid")
    private User user;

}
