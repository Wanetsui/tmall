package tmall.service;

import tmall.pojo.Advance;
import tmall.pojo.CartItem;
import tmall.pojo.Details;
import tmall.pojo.Order;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

public interface DetailsSevice extends BaseService {
    public void createDetails(Details details , List<Advance> advances) throws Exception;
    int updateDate(int id,Date date);
}
