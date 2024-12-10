package com.xworkz.shaadi.service;

import com.xworkz.shaadi.dto.HospitalDTO;
import org.springframework.stereotype.Service;

@Service
public class HospitalServiceImp implements PatientService{
    @Override
    public boolean validate(HospitalDTO hospitalDTO) {
        return false;
    }
}
