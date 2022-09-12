package qdu.java.recruit.mapper;

import org.apache.ibatis.annotations.*;
import qdu.java.recruit.entity.ResumeEntity;

import java.util.ArrayList;

public interface ResumeMapper {

    @Select("select * from resume")
    ArrayList<ResumeEntity> listResume();

    @Select("select resumeId from resume where userId = #{userId} limit 1")
    int getResumeId(@Param("userId") int userId);

    @Select("select * from resume where userId = #{userId} limit 1")
    ResumeEntity getResumeById(@Param("userId") int userId);

    @Update("update resume set ability = #{ability},internship=#{internship},workExperience=#{workExperience}," +
            "certificate = #{certificate},jobDesire = #{jobDesire} where userId = #{userId}")
    int saveResume(ResumeEntity resumeEntity);

    @Insert("insert into resume(ability,internship,workExperience,certificate,jobDesire,userId) " +
            "values (#{ability},#{internship},#{workExperience},#{certificate},#{jobDesire},#{userId})")
    int createResume(ResumeEntity resumeEntity);

    @Delete("delete from resume where resumeId = #{resumeId}")
    int delete(@Param("resumeId") int resumeId);

    @Update("update resume set state = #{state} where resumeId = #{resumeId}")
    int updateState(@Param("state")String state,@Param("resumeId")int resumeId);


}
