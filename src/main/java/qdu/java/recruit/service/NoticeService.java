package qdu.java.recruit.service;

import com.github.pagehelper.PageInfo;
import qdu.java.recruit.entity.NoticeEntity;

import java.util.List;

public interface NoticeService {

    NoticeEntity findById(int id);

    boolean update(NoticeEntity noticeEntity);

    boolean add(NoticeEntity noticeEntity);

    int delete(int id);

    PageInfo<NoticeEntity> findByPage(int hrId, int page, int limit);

    PageInfo<NoticeEntity> findByPage1(int page, int limit);

    List<NoticeEntity> findAllByHrId(int hrId);

}
