package tmall.pojo;

import tmall.mapper.SPropertyValueMapper;
import tmall.pojo.extension.SPropertyValueExtension;

public class SPropertyValue extends SPropertyValueExtension implements tmall.pojo.ORM.POJOMapper<SPropertyValueMapper> {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sproperty_value.pid
     *
     * @mbg.generated
     */
    private Integer pid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sproperty_value.ptid
     *
     * @mbg.generated
     */
    private Integer ptid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sproperty_value.value
     *
     * @mbg.generated
     */
    private String value;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sproperty_value.pid
     *
     * @return the value of sproperty_value.pid
     *
     * @mbg.generated
     */
    public Integer getPid() {
        return pid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sproperty_value.pid
     *
     * @param pid the value for sproperty_value.pid
     *
     * @mbg.generated
     */
    public void setPid(Integer pid) {
        this.pid = pid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sproperty_value.ptid
     *
     * @return the value of sproperty_value.ptid
     *
     * @mbg.generated
     */
    public Integer getPtid() {
        return ptid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sproperty_value.ptid
     *
     * @param ptid the value for sproperty_value.ptid
     *
     * @mbg.generated
     */
    public void setPtid(Integer ptid) {
        this.ptid = ptid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sproperty_value.value
     *
     * @return the value of sproperty_value.value
     *
     * @mbg.generated
     */
    public String getValue() {
        return value;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sproperty_value.value
     *
     * @param value the value for sproperty_value.value
     *
     * @mbg.generated
     */
    public void setValue(String value) {
        this.value = value == null ? null : value.trim();
    }
}