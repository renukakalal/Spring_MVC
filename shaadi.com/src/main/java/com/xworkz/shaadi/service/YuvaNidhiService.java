package com.xworkz.shaadi.service;

import com.xworkz.shaadi.dto.YuvaNidhiDTO;
import org.springframework.stereotype.Service;

@Service
public interface YuvaNidhiService {

    boolean validate(YuvaNidhiDTO yuvaNidhiDTO);

}
