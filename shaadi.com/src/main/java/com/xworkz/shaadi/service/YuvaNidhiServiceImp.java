package com.xworkz.shaadi.service;

import com.xworkz.shaadi.dto.YuvaNidhiDTO;
import org.springframework.stereotype.Service;

@Service
public class YuvaNidhiServiceImp implements YuvaNidhiService{

    @Override
    public boolean validate(YuvaNidhiDTO yuvaNidhiDTO) {
        return true;
    }
}
