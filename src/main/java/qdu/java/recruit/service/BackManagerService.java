package qdu.java.recruit.service;

import qdu.java.recruit.entity.*;

import java.util.ArrayList;

public interface BackManagerService {
    int backLogin(Long userid,String password);
    ArrayList<UserAreaEntity> userArea();
    ArrayList<CompanyEntity> getAllCompanies();
    ArrayList<UserEntity> getAllUsers();
    ArrayList<HREntity> getAllHr();
    ArrayList<ResumeEntity> getAllResume();
    WebCountEntity getWebCount();
    int addCompany(String companyName,String companyCode,String description);
    AdminEntity findById(String userid);
    int updateAdmin(AdminEntity adminEntity);
}
