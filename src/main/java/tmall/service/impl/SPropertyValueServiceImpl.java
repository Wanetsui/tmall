package tmall.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tmall.mapper.SPropertyValueMapper;
import tmall.pojo.*;
import tmall.service.PropertyService;
import tmall.service.SPropertyService;
import tmall.service.SPropertyValueService;

import java.util.List;

@Service
public class SPropertyValueServiceImpl extends BaseServiceImpl<SPropertyValueMapper, SPropertyValueExample> implements SPropertyValueService {
    @Autowired
    SPropertyService spropertyService;

    @Override
    public void init(tmall.pojo.Service service) throws Exception {
        List<SProperty> sproperties = spropertyService.list("cid", service.getType().getId());
        for (SProperty sproperty : sproperties) {
            try {
                PropertyValue value = (PropertyValue) list("ptid", sproperty.getId(),
                        "pid", service.getId()).get(0);
            } catch (Exception e) {
                //对应字段为空
                SPropertyValue spropertyValue = new SPropertyValue();
                spropertyValue.setValue("");
                spropertyValue.setService(service);
                spropertyValue.setSproperty(sproperty);
                add(spropertyValue);
            }
        }
    }
}
