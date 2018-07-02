package tmall.service;

import tmall.pojo.Advance;
import tmall.pojo.CartItem;
import tmall.pojo.Details;
import tmall.pojo.Order;

import java.util.List;

public interface DetailsSevice extends BaseService {
    public void createDetails(Details details , List<Advance> advances) throws Exception;
}
