package qdu.java.recruit.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import qdu.java.recruit.entity.*;
import qdu.java.recruit.mapper.BackManagerMapper;
import qdu.java.recruit.mapper.HRMapper;
import qdu.java.recruit.mapper.ResumeMapper;
import qdu.java.recruit.service.BackManagerService;

import java.util.ArrayList;

@Service
public class BackManagerServiceImpl implements BackManagerService{

    @Autowired
    private BackManagerMapper backManagerMapper;

    @Autowired
    private HRMapper hrMapper;

    @Autowired
    private ResumeMapper resumeMapper;

    @Override
    public int backLogin(Long userid, String password) {
        return backManagerMapper.backLogin(userid,password);
    }

    @Override
    public ArrayList<UserAreaEntity> userArea(){
        return backManagerMapper.userArea();
    }

    @Override
    public ArrayList<CompanyEntity> getAllCompanies() {
        return backManagerMapper.getAllCompanies();
    }

    @Override
    public ArrayList<UserEntity> getAllUsers() {
        return backManagerMapper.getAllUsers();
    }

    @Override
    public ArrayList<HREntity> getAllHr() {
        return hrMapper.listHR();
    }

    @Override
    public ArrayList<ResumeEntity> getAllResume() {
        return resumeMapper.listResume();
    }

    @Override
    public WebCountEntity getWebCount(){
        return backManagerMapper.getWebCount();
    }

    @Override
    public int addCompany(String companyName,String companyCode,String description){
        return backManagerMapper.addCompany(companyName,companyCode,description);
    }

    @Override
    public AdminEntity findById(String userid) {
        return backManagerMapper.findById(userid);
    }

    @Override
    public int updateAdmin(AdminEntity adminEntity) {
        return backManagerMapper.updateAdmin(adminEntity);
    }
}
