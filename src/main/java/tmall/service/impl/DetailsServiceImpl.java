package tmall.service.impl;

import org.apache.commons.lang3.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tmall.mapper.DetailsMapper;
import tmall.pojo.*;
import tmall.pojo.extension.DetailsExtension;
import tmall.service.*;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class DetailsServiceImpl extends BaseServiceImpl<DetailsMapper,DetailsExample> implements DetailsSevice {
    @Autowired
    AdvanceService advanceService;
    @Autowired
    DetailsItemService detailsItemService;
    @Autowired
    ServiceService serviceService;
    @Autowired
    DetailsMapper detailsMapper;
    @Override
    public void createDetails(Details details, List<Advance> advances) throws Exception {
        String orderCode = new SimpleDateFormat("yyyyMMddHHmmssSS").format(new Date())+ RandomUtils.nextInt();
        details.setOrderCode(orderCode);
        details.setCreateDate(new Date());
        details.setStatus(Details.Status.waitPay);
        BigDecimal sum = new BigDecimal(0);
        int totalNumber = 0;
        for(Advance item:advances){
            sum = sum.add(item.getSum());
            totalNumber ++;
        }
        details.setSum(sum);
        details.setTotalNumber(totalNumber);
        detailsMapper.insert(details);
        //add(details);
        for(Advance item:advances){
            Detailsitem detailsItem = new Detailsitem();
            detailsItem.setDetails(details);
            detailsItem.setNumber(item.getNumber());
            detailsItem.setService(item.getService());
            detailsItem.setSum(item.getSum());
            if(item.getId()>0) {
                detailsItemService.delete(item);
            }
            tmall.pojo.Service service = detailsItem.getService();
            service.setStock(service.getStock()-item.getNumber());
            service.setSaleCount(service.getSaleCount()+1);
            serviceService.update(service);
            detailsItemService.add(detailsItem);
        }

    }
}
