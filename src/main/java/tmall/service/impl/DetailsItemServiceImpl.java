package tmall.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tmall.mapper.DetailsitemMapper;
import tmall.pojo.DetailsitemExample;
import tmall.service.DetailsItemService;
@Service
public class DetailsItemServiceImpl extends BaseServiceImpl<DetailsitemMapper,DetailsitemExample> implements DetailsItemService {
    @Autowired
    DetailsitemMapper detailsitemMapper;
    @Override
    public int getSidByOid(int oid) {
        return detailsitemMapper.selectByPrimaryKey(oid).getPid();
    }
}
