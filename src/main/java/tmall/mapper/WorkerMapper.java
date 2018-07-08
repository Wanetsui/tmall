package tmall.mapper;

import tmall.pojo.Worker;

import java.util.List;

public interface WorkerMapper {
    List<Worker> selectWorkerList(int sid);
}
