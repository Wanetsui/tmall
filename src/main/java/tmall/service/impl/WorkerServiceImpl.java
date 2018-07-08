package tmall.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tmall.mapper.WorkerMapper;
import tmall.pojo.Worker;
import tmall.service.WorkerService;

import java.util.List;
@Service
public class WorkerServiceImpl implements WorkerService {
    @Autowired
    WorkerMapper workerMapper;
    @Override
    public List<Worker> selectWorkerList(int sid) {
        return workerMapper.selectWorkerList(sid);
    }
}
