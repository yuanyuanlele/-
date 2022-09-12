
package qdu.java.recruit.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;
import qdu.java.recruit.entity.NewsEntity;
import qdu.java.recruit.mapper.NewsMapper;
import qdu.java.recruit.service.NewsService;

import javax.annotation.Resource;
import java.util.List;

@Service
public class NewsServiceImpl implements NewsService {
    private static final Logger LOGGER = LogManager.getLogger();

    @Resource
    private NewsMapper newsMapper;


    @Override
    public NewsEntity findById(int id) {
        return newsMapper.findById(id);
    }

    @Override
    public boolean update(NewsEntity noticeEntity) {
        int state=newsMapper.update(noticeEntity);
        if(state>0){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public boolean add(NewsEntity noticeEntity) {
        boolean flag=false;
        int state=newsMapper.insert(noticeEntity);
        if(state>0){
            flag=true;
        }
        return flag;
    }

    @Override
    public int delete(int id) {
        return newsMapper.delete(id);
    }

    @Override
    public PageInfo<NewsEntity> findByPage(int page, int limit) {
        int total = newsMapper.getTotal();
        PageHelper.startPage(page, limit);
        List<NewsEntity> noticeEntities = newsMapper.findAll();
        PageInfo<NewsEntity> pagination = new PageInfo<>(noticeEntities);
        pagination.setTotal(total);
        return pagination;
    }


}

