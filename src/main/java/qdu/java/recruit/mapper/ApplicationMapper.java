package qdu.java.recruit.mapper;

import org.apache.ibatis.annotations.*;
import qdu.java.recruit.entity.ApplicationEntity;
import qdu.java.recruit.pojo.ApplicationPositionHRBO;

import java.sql.Timestamp;
import java.util.ArrayList;

public interface ApplicationMapper {

    @Select("select * from application where resumeId = #{resumeId}")
    ArrayList<ApplicationEntity> listApplication(@Param("resumeId") int resumeId);

    @Select("select * from application where resumeId = #{resumeId} and positionId = #{posId} limit 1")
    ApplicationEntity getApplication(@Param("resumeId") int resumeId, @Param("posId") int posId);

    @Insert("insert into application(state,recentTime,resumeId,positionId,hrId) values (0,#{recentTime},#{resumeId},#{positionId},#{hrId})")
    int saveApplication(@Param("recentTime") Timestamp recentTime, @Param("resumeId") int resumeId, @Param("positionId") int positionId
            , @Param("hrId") int hrId);

    /**
     * 申请处理完成：查询返回 申请 职位 处理hr信息
     * @param resumeId
     * @return
     */
    @Select("select a.applicationId,a.state,a.recentTime,a.resumeId,p.*,h.hrId,h.hrMobile,h.hrName,h.hrEmail\n" +
            "from application a,positions p,hr h\n" +
            "where a.positionId = p.positionId and a.hrId = h.hrId \n" +
            "and a.hrId is not null and a.resumeId = #{resumeId}\n" +
            "order by recentTime;")
    ArrayList<ApplicationPositionHRBO> listAppPosHR(@Param("resumeId") int resumeId);

    /**
     * 申请待处理：查询返回 申请 职位 发布hr信息
     * @param resumeId
     * @return
     */
    @Select("select a.applicationId,a.state,a.recentTime,a.resumeId,p.*,h.hrId,h.hrMobile,h.hrName,h.hrEmail\n" +
            "from application a,positions p,hr h\n" +
            "where a.positionId = p.positionId and p.hrIdPub = h.hrId \n" +
            "and a.hrId is null and a.resumeId = #{resumeId}\n" +
            "order by p.releaseDate;")
    ArrayList<ApplicationPositionHRBO> listAppPosHRPub(@Param("resumeId") int resumeId);

    @Select("select count(*) from application")
    int countAll();

    @Select("select * from application")
    ArrayList<ApplicationEntity> listAll();

    @Select("select * from application where hrId = #{hrId}")
    ArrayList<ApplicationEntity> listByHr(@Param("hrId") int hrId);

    @Select("select count(*) from application where hrId = #{hrId}")
    int countByHr(@Param("hrId") int hrId);

    @Update("update application set state = #{state} where applicationId = #{applicationId}")
    int updateState(@Param("state")String state,@Param("applicationId")int applicationId);

    @Delete("delete from application where applicationId = #{applicationId}")
    int delete(@Param("applicationId") int applicationId);
}
