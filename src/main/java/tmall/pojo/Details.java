package tmall.pojo;

import java.math.BigDecimal;
import java.util.Date;
import tmall.mapper.DetailsMapper;
import tmall.pojo.extension.DetailsExtension;

public class Details extends DetailsExtension implements tmall.pojo.ORM.POJOMapper<DetailsMapper> {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column details_.uid
     *
     * @mbg.generated
     */
    private Integer uid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column details_.orderCode
     *
     * @mbg.generated
     */
    private String orderCode;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column details_.sum
     *
     * @mbg.generated
     */
    private BigDecimal sum;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column details_.totalNumber
     *
     * @mbg.generated
     */
    private Integer totalNumber;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column details_.address
     *
     * @mbg.generated
     */
    private String address;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column details_.receiver
     *
     * @mbg.generated
     */
    private String receiver;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column details_.mobile
     *
     * @mbg.generated
     */
    private String mobile;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column details_.userMessage
     *
     * @mbg.generated
     */
    private String userMessage;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column details_.createDate
     *
     * @mbg.generated
     */
    private Date createDate;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column details_.payDate
     *
     * @mbg.generated
     */
    private Date payDate;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column details_.deliverDate
     *
     * @mbg.generated
     */
    private Date deliverDate;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column details_.confirmDate
     *
     * @mbg.generated
     */
    private Date confirmDate;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column details_.status
     *
     * @mbg.generated
     */
    private String status;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column details_.uid
     *
     * @return the value of details_.uid
     *
     * @mbg.generated
     */
    public Integer getUid() {
        return uid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column details_.uid
     *
     * @param uid the value for details_.uid
     *
     * @mbg.generated
     */
    public void setUid(Integer uid) {
        this.uid = uid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column details_.orderCode
     *
     * @return the value of details_.orderCode
     *
     * @mbg.generated
     */
    public String getOrderCode() {
        return orderCode;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column details_.orderCode
     *
     * @param orderCode the value for details_.orderCode
     *
     * @mbg.generated
     */
    public void setOrderCode(String orderCode) {
        this.orderCode = orderCode == null ? null : orderCode.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column details_.sum
     *
     * @return the value of details_.sum
     *
     * @mbg.generated
     */
    public BigDecimal getSum() {
        return sum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column details_.sum
     *
     * @param sum the value for details_.sum
     *
     * @mbg.generated
     */
    public void setSum(BigDecimal sum) {
        this.sum = sum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column details_.totalNumber
     *
     * @return the value of details_.totalNumber
     *
     * @mbg.generated
     */
    public Integer getTotalNumber() {
        return totalNumber;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column details_.totalNumber
     *
     * @param totalNumber the value for details_.totalNumber
     *
     * @mbg.generated
     */
    public void setTotalNumber(Integer totalNumber) {
        this.totalNumber = totalNumber;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column details_.address
     *
     * @return the value of details_.address
     *
     * @mbg.generated
     */
    public String getAddress() {
        return address;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column details_.address
     *
     * @param address the value for details_.address
     *
     * @mbg.generated
     */
    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column details_.receiver
     *
     * @return the value of details_.receiver
     *
     * @mbg.generated
     */
    public String getReceiver() {
        return receiver;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column details_.receiver
     *
     * @param receiver the value for details_.receiver
     *
     * @mbg.generated
     */
    public void setReceiver(String receiver) {
        this.receiver = receiver == null ? null : receiver.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column details_.mobile
     *
     * @return the value of details_.mobile
     *
     * @mbg.generated
     */
    public String getMobile() {
        return mobile;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column details_.mobile
     *
     * @param mobile the value for details_.mobile
     *
     * @mbg.generated
     */
    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column details_.userMessage
     *
     * @return the value of details_.userMessage
     *
     * @mbg.generated
     */
    public String getUserMessage() {
        return userMessage;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column details_.userMessage
     *
     * @param userMessage the value for details_.userMessage
     *
     * @mbg.generated
     */
    public void setUserMessage(String userMessage) {
        this.userMessage = userMessage == null ? null : userMessage.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column details_.createDate
     *
     * @return the value of details_.createDate
     *
     * @mbg.generated
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column details_.createDate
     *
     * @param createDate the value for details_.createDate
     *
     * @mbg.generated
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column details_.payDate
     *
     * @return the value of details_.payDate
     *
     * @mbg.generated
     */
    public Date getPayDate() {
        return payDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column details_.payDate
     *
     * @param payDate the value for details_.payDate
     *
     * @mbg.generated
     */
    public void setPayDate(Date payDate) {
        this.payDate = payDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column details_.deliverDate
     *
     * @return the value of details_.deliverDate
     *
     * @mbg.generated
     */
    public Date getDeliverDate() {
        return deliverDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column details_.deliverDate
     *
     * @param deliverDate the value for details_.deliverDate
     *
     * @mbg.generated
     */
    public void setDeliverDate(Date deliverDate) {
        this.deliverDate = deliverDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column details_.confirmDate
     *
     * @return the value of details_.confirmDate
     *
     * @mbg.generated
     */
    public Date getConfirmDate() {
        return confirmDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column details_.confirmDate
     *
     * @param confirmDate the value for details_.confirmDate
     *
     * @mbg.generated
     */
    public void setConfirmDate(Date confirmDate) {
        this.confirmDate = confirmDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column details_.status
     *
     * @return the value of details_.status
     *
     * @mbg.generated
     */
    public String getStatus() {
        return status;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column details_.status
     *
     * @param status the value for details_.status
     *
     * @mbg.generated
     */
    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }
}