package qdu.java.recruit.mapper;

import org.apache.ibatis.annotations.*;
import qdu.java.recruit.entity.CompanyEntity;

import java.util.List;

/**
 * <p>
 *       private int companyId;
 private String companyName;
 private int companyLogo;
 private String description;
 private int state;
 private String companyCode;
 * </p>
 */
public interface CompanyMapper {

    @Select("select * from company where companyId = #{comId}")
    CompanyEntity getCompanyById(@Param("comId") int comId);

    @Select("select * from company where companyCode = #{companyCode}")
    CompanyEntity getCompanyByCode(@Param("companyCode") String companyCode);

    @Insert({"insert into user(companyName,companyLogo,description,state,companyCode})"
            +"values(#{companyName},#{companyLogo},#{description},#{state},#{companyCode})"})
    int saveCompany(CompanyEntity companyEntity);

//    @Update("update company set companyCode = #{companyCode} where companyId = #{companyId}")
//    int updateCompany(int companyCode,int companyId);

    @Select("select * from company")
    List<CompanyEntity> getAll();

    @Delete("delete from company where companyId = #{companyId}")
    int delete(@Param("companyId") int companyId);
}
