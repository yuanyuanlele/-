package qdu.java.recruit.service;

import com.github.pagehelper.PageInfo;
import qdu.java.recruit.entity.NewsEntity;

import java.util.List;

public interface NewsService {

    NewsEntity findById(int id);

    boolean update(NewsEntity newsEntity);

    boolean add(NewsEntity newsEntity);

    int delete(int id);

    PageInfo<NewsEntity> findByPage(int page, int limit);


}
