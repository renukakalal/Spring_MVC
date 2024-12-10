package com.xworkz.shaadi.service;

import com.xworkz.shaadi.dto.HospitalDTO;
import org.springframework.stereotype.Service;

@Service
public interface PatientService {
    boolean validate(HospitalDTO hospitalDTO);
}
