package com.xworkz.shaadi.service;

import com.xworkz.shaadi.dto.HotelDTO;
import org.springframework.stereotype.Service;

@Service
public interface HotelService {

    boolean validate(HotelDTO hotelDTO);
}
