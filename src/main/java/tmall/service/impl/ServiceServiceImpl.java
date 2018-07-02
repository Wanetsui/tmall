package tmall.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tmall.mapper.ServiceMapper;
import tmall.pojo.ServiceExample;
import tmall.service.ServiceService;
@Service
public class ServiceServiceImpl extends BaseServiceImpl<ServiceMapper, ServiceExample> implements ServiceService{
//    @Autowired
//    private ServiceMapper serviceMapper;
//    @Override
//    public tmall.pojo.Service findServiceByKeyword(String keyword) {
//        return serviceMapper.findServiceByName(keyword);
//    }
}
