package qdu.java.recruit.mapper;

import org.apache.ibatis.annotations.*;
import qdu.java.recruit.entity.NewsEntity;

import java.util.ArrayList;

public interface NewsMapper {

    @Select("select * from news")
    ArrayList<NewsEntity> findAll();

    @Select("select COUNT(*) from news")
    int getTotal();

    @Update("update news set title = #{title},summary = #{summary},content=#{content},icon=#{icon} where id = #{id}")
    int update(NewsEntity newsEntity);

    @Insert("insert into news(title,summary,content,addDate,addUser,icon) " +
            "values(#{title},#{summary},#{content},#{addDate},#{addUser},#{icon})")
    int insert(NewsEntity newsEntity);

    @Delete("delete from news where id = #{id}")
    int delete(@Param("id") int id);

    @Select("select * from news where id = #{id}")
    NewsEntity findById(@Param("id") int id);
}

