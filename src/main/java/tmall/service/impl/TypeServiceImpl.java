package tmall.service.impl;

import org.springframework.stereotype.Service;
import tmall.mapper.TypeMapper;
import tmall.pojo.TypeExample;
import tmall.service.TypeService;
@Service
public class TypeServiceImpl extends BaseServiceImpl<TypeMapper,TypeExample> implements TypeService {
}
