package tmall.service;

import tmall.pojo.Worker;

import java.util.List;

public interface WorkerService {
    List<Worker> selectWorkerList(int sid);
}
