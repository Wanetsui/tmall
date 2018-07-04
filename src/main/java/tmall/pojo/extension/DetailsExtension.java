package tmall.pojo.extension;

import tmall.annotation.ORMAnnotation.Enumerated;
import tmall.annotation.ORMAnnotation.JoinColumn;
import tmall.annotation.ORMAnnotation.ManyToOne;
import tmall.annotation.ORMAnnotation.OneToMany;
import tmall.pojo.Detailsitem;
import tmall.pojo.OrderItem;
import tmall.pojo.User;
import tmall.pojo.base.BasePOJO;

import java.util.List;

public class DetailsExtension extends BasePOJO {
    @ManyToOne
    @JoinColumn(name="uid")
    private User user;
    @Enumerated(var = "status")
    private Status statusEnum;
    @OneToMany
    @JoinColumn(name = "oid")
    private List<Detailsitem> detailsitems;


    public void setStatus(DetailsExtension.Status statusEnum) {
        this.statusEnum = statusEnum;
    }
    public String getStatusText() {
        return statusEnum.getName();
    }
    public Status getStatusEnum() {
        return statusEnum;
    }

    public void setStatusEnum(Status statusEnum) {
        this.statusEnum = statusEnum;
    }

    public List<Detailsitem> getDetailsitems() {
        return detailsitems;
    }

    public void setDetailsitems(List<Detailsitem> detailsitems) {
        this.detailsitems = detailsitems;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public enum Status{
        waitPay("待付款"),
        waitDeliver("待服务"),
        waitConfirm("待服务完成"),
        //waitComment("待评论"),
        finish("完成订单"),
        deleted("已删除");

        private String name;

        private Status(String name) {
            this.name = name;
        }

        public String getName() {
            return name;
        }
    }
}
