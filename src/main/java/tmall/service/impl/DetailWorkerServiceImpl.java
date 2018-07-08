package tmall.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tmall.mapper.DetailWorkerMapper;
import tmall.pojo.DetailWorker;
import tmall.service.DetailWorkerService;
@Service
public class DetailWorkerServiceImpl implements DetailWorkerService {
    @Autowired
    DetailWorkerMapper detailWorkerMapper;
    @Override
    public int insert(DetailWorker record) {
        return detailWorkerMapper.insert(record);
    }
}
