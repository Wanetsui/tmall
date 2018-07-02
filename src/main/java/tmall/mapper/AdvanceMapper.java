package tmall.mapper;

import java.util.List;
import tmall.pojo.Advance;
import tmall.pojo.AdvanceExample;

public interface AdvanceMapper extends BaseMapper<Advance, AdvanceExample> {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table advance
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table advance
     *
     * @mbg.generated
     */
    int insert(Advance record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table advance
     *
     * @mbg.generated
     */
    int insertSelective(Advance record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table advance
     *
     * @mbg.generated
     */
    List<Advance> selectByExample(AdvanceExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table advance
     *
     * @mbg.generated
     */
    Advance selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table advance
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(Advance record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table advance
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(Advance record);
}