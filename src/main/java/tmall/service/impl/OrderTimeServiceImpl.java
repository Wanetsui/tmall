package tmall.service.impl;

import org.junit.AfterClass;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tmall.mapper.OrderTimeMapper;
import tmall.pojo.OrderTime;
import tmall.service.OrderTimeService;
@Service
public class OrderTimeServiceImpl implements OrderTimeService {
    @Autowired
    OrderTimeMapper orderTimeMapper;

    @Override
    public int insert(OrderTime orderTime) {
        return orderTimeMapper.insert(orderTime);
    }
}
