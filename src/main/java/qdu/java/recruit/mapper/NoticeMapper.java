package qdu.java.recruit.mapper;

import org.apache.ibatis.annotations.*;
import qdu.java.recruit.entity.NoticeEntity;

import java.util.ArrayList;

public interface NoticeMapper {

    @Select("select * from notice")
    ArrayList<NoticeEntity> findAll();

    @Select("select COUNT(*) from notice")
    int getTotal();

    @Update("update notice set title = #{title},content=#{content} where id = #{id}")
    int update(NoticeEntity noticeEntity);

    @Insert("insert into notice(title,content,addDate,hrId) " +
            "values(#{title},#{content},#{addDate},#{hrId})")
    int insert(NoticeEntity noticeEntity);

    @Delete("delete from notice where id = #{id}")
    int delete(@Param("id") int id);

    @Select("select * from notice where id = #{id}")
    NoticeEntity findById(@Param("id") int id);

    @Select("select count(*) from notice where hrId = #{hrId}")
    int getTotalByHrId(@Param("hrId") int hrId);

    @Select("select * from notice where hrId = #{hrId}")
    ArrayList<NoticeEntity> findByHrId(@Param("hrId") int hrId);
}

