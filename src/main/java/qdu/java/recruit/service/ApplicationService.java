package qdu.java.recruit.service;


import com.github.pagehelper.PageInfo;
import qdu.java.recruit.entity.ApplicationEntity;
import qdu.java.recruit.pojo.ApplicationPositionHRBO;

import java.util.List;

public interface ApplicationService {

    boolean applyPosition(int resumeId, int positionId);

    List<ApplicationPositionHRBO> listApplyInfo(int resumeId);

    List<ApplicationPositionHRBO> listApplyInfoPub(int resumeId);

    List<ApplicationPositionHRBO> listApplyInfoByHr(int hrid);

    PageInfo<ApplicationEntity> findByPage(int page, int limit);

    PageInfo<ApplicationEntity> findByHrPage(int page, int limit,int hrId);

    int updateState(String state,int applicationId);

    int deleteApplication(int applicationId);





}
