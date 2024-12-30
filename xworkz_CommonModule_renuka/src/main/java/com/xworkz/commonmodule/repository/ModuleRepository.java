package com.xworkz.commonmodule.repository;

import com.xworkz.commonmodule.entity.ModuleEntity;

import java.util.List;

public interface ModuleRepository {

    boolean  save(ModuleEntity moduleEntity);



    Long getcountName(String name);
    Long getcountemail(String email);
    Long getcountaltEmail(String alternativeEmail);
    Long getcountNumber(String phoneNumber);
    Long getcountalternumber(String alternativePhoneNumber);
    boolean update (ModuleEntity moduleEntity);


    public ModuleEntity login(String email, String password);
    ModuleEntity findByEmail(String email);


}
