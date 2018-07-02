package tmall.service.impl;

import org.springframework.stereotype.Service;
import tmall.mapper.DetailsMapper;
import tmall.pojo.DetailsExample;
import tmall.service.DetailsSevice;
@Service
public class DetailsServiceImpl extends BaseServiceImpl<DetailsMapper,DetailsExample> implements DetailsSevice {
}
