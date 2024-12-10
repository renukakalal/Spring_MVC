package com.xworkz.shaadi.service;

import com.xworkz.shaadi.dto.JobDTO;
import org.springframework.stereotype.Service;

@Service
public interface JobService {
    boolean validate(JobDTO jobDTO);
}
