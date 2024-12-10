package com.xworkz.shaadi.service;

import com.xworkz.shaadi.dto.HotelDTO;
import org.springframework.stereotype.Service;

@Service
public class HotellServiceImp implements HotelService{
    @Override
    public boolean validate(HotelDTO hotelDTO) {
        return false;
    }
}
