package qdu.java.recruit.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import qdu.java.recruit.entity.ApplicationEntity;
import qdu.java.recruit.entity.HREntity;
import qdu.java.recruit.entity.PositionEntity;
import qdu.java.recruit.mapper.ApplicationMapper;
import qdu.java.recruit.mapper.HRMapper;
import qdu.java.recruit.mapper.PositionMapper;
import qdu.java.recruit.pojo.ApplicationPositionHRBO;
import qdu.java.recruit.service.ApplicationService;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.List;

@Service
public class ApplicationServiceImpl implements ApplicationService {

    @Resource
    private ApplicationMapper applicationMapper;

    @Resource
    private PositionMapper positionMapper;

    @Override
    public boolean applyPosition(int resumeId, int positionId) {

        //获取当前日期时间
        java.util.Date date = new java.util.Date();
        Timestamp recentTime = new Timestamp(date.getTime());
        PositionEntity positionEntity=positionMapper.getPosition(positionId);
        int result = applicationMapper.saveApplication(recentTime, resumeId, positionId,positionEntity.getHrIdPub());
        if (result > 0) {
            return true;
        }
        return false;
    }

    /**
     * 申请处理完成
     * @param resumeId
     * @return
     */
    @Override
    public List<ApplicationPositionHRBO> listApplyInfo(int resumeId){

        return applicationMapper.listAppPosHR(resumeId);
    }

    /**
     * 申请待处理
     * @param resumeId
     * @return
     */
    @Override
    public List<ApplicationPositionHRBO> listApplyInfoPub(int resumeId){

        return applicationMapper.listAppPosHRPub(resumeId);
    }


    @Override
    public List<ApplicationPositionHRBO> listApplyInfoByHr(int hrid) {
        return applicationMapper.listAppPosHR(hrid);

    }

    @Override
    public PageInfo<ApplicationEntity> findByPage(int page, int limit) {
        int total = applicationMapper.countAll();
        PageHelper.startPage(page, limit);
        List<ApplicationEntity> posList = applicationMapper.listAll();
        PageInfo<ApplicationEntity> pagination = new PageInfo<>(posList);
        pagination.setTotal(total);
        return pagination;
    }

    @Override
    public PageInfo<ApplicationEntity> findByHrPage(int page, int limit,int hrId) {
        int total = applicationMapper.countByHr(hrId);
        PageHelper.startPage(page, limit);
        List<ApplicationEntity> posList = applicationMapper.listByHr(hrId);
        PageInfo<ApplicationEntity> pagination = new PageInfo<>(posList);
        pagination.setTotal(total);
        return pagination;
    }

    @Override
    public int updateState(String state, int applicationId) {
        return applicationMapper.updateState(state,applicationId);
    }

    @Override
    public int deleteApplication(int applicationId) {
        return applicationMapper.delete(applicationId);
    }
}
