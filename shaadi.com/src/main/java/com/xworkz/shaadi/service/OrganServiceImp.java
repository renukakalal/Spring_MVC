package com.xworkz.shaadi.service;

import com.xworkz.shaadi.dto.OrganDTO;
import org.springframework.stereotype.Service;

@Service
public class OrganServiceImp implements OrganService{
    @Override
    public boolean validate(OrganDTO organDTO) {
        return false;
    }
}
