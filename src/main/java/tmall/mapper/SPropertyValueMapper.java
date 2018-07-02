package tmall.mapper;

import java.util.List;
import tmall.pojo.SPropertyValue;
import tmall.pojo.SPropertyValueExample;

public interface SPropertyValueMapper extends BaseMapper<SPropertyValue, SPropertyValueExample> {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sproperty_value
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sproperty_value
     *
     * @mbg.generated
     */
    int insert(SPropertyValue record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sproperty_value
     *
     * @mbg.generated
     */
    int insertSelective(SPropertyValue record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sproperty_value
     *
     * @mbg.generated
     */
    List<SPropertyValue> selectByExample(SPropertyValueExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sproperty_value
     *
     * @mbg.generated
     */
    SPropertyValue selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sproperty_value
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(SPropertyValue record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sproperty_value
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(SPropertyValue record);
}