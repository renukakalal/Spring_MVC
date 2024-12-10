package com.xworkz.shaadi.service;

import com.xworkz.shaadi.dto.DeathCerificateDTO;
import org.springframework.stereotype.Service;

@Service
public class DeathCerificateServiceImp implements DeathCertificateService{
    @Override
    public boolean validate(DeathCerificateDTO deathCerificateDTO) {
        return false;
    }
}
