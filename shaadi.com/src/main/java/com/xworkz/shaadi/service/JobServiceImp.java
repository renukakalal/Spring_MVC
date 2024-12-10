package com.xworkz.shaadi.service;

import com.xworkz.shaadi.dto.JobDTO;
import org.springframework.stereotype.Service;

@Service
public class JobServiceImp implements JobService {
    @Override
    public boolean validate(JobDTO jobDTO) {


        return false;
    }
}
