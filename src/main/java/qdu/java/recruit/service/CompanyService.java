package qdu.java.recruit.service;

import qdu.java.recruit.entity.CompanyEntity;

import java.util.List;

public interface CompanyService {

    CompanyEntity getCompany(int comId);

    CompanyEntity getCompany(String companyCode);

    boolean registerCompany(CompanyEntity companyEntity);

    List<CompanyEntity> getAll();

    int delete(int companyId);


}
