package com.xworkz.commonmodule.service;

import com.xworkz.commonmodule.dto.ModuleDTO;
import com.xworkz.commonmodule.entity.ModuleEntity;

public interface ModuleService {

    boolean save(ModuleDTO moduleDTO);

    Long getcountName(String name);
    Long getcountemail(String email);
    Long getcountaltEmail(String alternativeEmail);
    Long getcountNumber(String phoneNumber);
    Long getcountalternumber(String alternativePhoneNumber);
    public ModuleEntity login(String email, String password);


    boolean resetPassword(String email, String newPassword, String conformPassword);


    boolean saveEmail(String email, String password);

}








