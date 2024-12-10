package com.xworkz.shaadi.service;

import com.xworkz.shaadi.dto.OrganDTO;
import org.springframework.stereotype.Service;

@Service
public interface OrganService {

    boolean validate(OrganDTO organDTO);
}
