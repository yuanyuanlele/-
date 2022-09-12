
package qdu.java.recruit.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;
import qdu.java.recruit.entity.NoticeEntity;
import qdu.java.recruit.entity.UserEntity;
import qdu.java.recruit.mapper.NoticeMapper;
import qdu.java.recruit.mapper.UserMapper;
import qdu.java.recruit.service.NoticeService;
import qdu.java.recruit.service.UserService;
import sun.misc.BASE64Encoder;

import javax.annotation.Resource;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService {
    private static final Logger LOGGER = LogManager.getLogger();

    @Resource
    private NoticeMapper noticeMapper;


    @Override
    public NoticeEntity findById(int id) {
        return noticeMapper.findById(id);
    }

    @Override
    public boolean update(NoticeEntity noticeEntity) {
        int state=noticeMapper.update(noticeEntity);
        if(state>0){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public boolean add(NoticeEntity noticeEntity) {
        boolean flag=false;
        int state=noticeMapper.insert(noticeEntity);
        if(state>0){
            flag=true;
        }
        return flag;
    }

    @Override
    public int delete(int id) {
        return noticeMapper.delete(id);
    }

    @Override
    public PageInfo<NoticeEntity> findByPage(int hrId, int page, int limit) {
        int total = noticeMapper.getTotalByHrId(hrId);
        PageHelper.startPage(page, limit);
        List<NoticeEntity> noticeEntities = noticeMapper.findByHrId(hrId);
        PageInfo<NoticeEntity> pagination = new PageInfo<>(noticeEntities);
        pagination.setTotal(total);
        return pagination;
    }

    @Override
    public PageInfo<NoticeEntity> findByPage1(int page, int limit) {
        int total = noticeMapper.getTotal();
        PageHelper.startPage(page, limit);
        List<NoticeEntity> noticeEntities = noticeMapper.findAll();
        PageInfo<NoticeEntity> pagination = new PageInfo<>(noticeEntities);
        pagination.setTotal(total);
        return pagination;
    }

    @Override
    public List<NoticeEntity> findAllByHrId(int hrId) {
        return noticeMapper.findByHrId(hrId);
    }
}

