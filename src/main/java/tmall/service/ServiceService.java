package tmall.service;

import tmall.pojo.Service;

public interface ServiceService extends BaseService{
    Service findServiceByKeyword(String keyword);
}
