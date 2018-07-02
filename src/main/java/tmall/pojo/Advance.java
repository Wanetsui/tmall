package tmall.pojo;

import java.math.BigDecimal;
import tmall.mapper.AdvanceMapper;
import tmall.pojo.extension.AdvanceExtension;

public class Advance extends AdvanceExtension implements tmall.pojo.ORM.POJOMapper<AdvanceMapper> {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column advance.uid
     *
     * @mbg.generated
     */
    private Integer uid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column advance.pid
     *
     * @mbg.generated
     */
    private Integer pid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column advance.number
     *
     * @mbg.generated
     */
    private Integer number;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column advance.sum
     *
     * @mbg.generated
     */
    private BigDecimal sum;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column advance.uid
     *
     * @return the value of advance.uid
     *
     * @mbg.generated
     */
    public Integer getUid() {
        return uid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column advance.uid
     *
     * @param uid the value for advance.uid
     *
     * @mbg.generated
     */
    public void setUid(Integer uid) {
        this.uid = uid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column advance.pid
     *
     * @return the value of advance.pid
     *
     * @mbg.generated
     */
    public Integer getPid() {
        return pid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column advance.pid
     *
     * @param pid the value for advance.pid
     *
     * @mbg.generated
     */
    public void setPid(Integer pid) {
        this.pid = pid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column advance.number
     *
     * @return the value of advance.number
     *
     * @mbg.generated
     */
    public Integer getNumber() {
        return number;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column advance.number
     *
     * @param number the value for advance.number
     *
     * @mbg.generated
     */
    public void setNumber(Integer number) {
        this.number = number;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column advance.sum
     *
     * @return the value of advance.sum
     *
     * @mbg.generated
     */
    public BigDecimal getSum() {
        return sum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column advance.sum
     *
     * @param sum the value for advance.sum
     *
     * @mbg.generated
     */
    public void setSum(BigDecimal sum) {
        this.sum = sum;
    }
}