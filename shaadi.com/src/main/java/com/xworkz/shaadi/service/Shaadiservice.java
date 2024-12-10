package com.xworkz.shaadi.service;

import com.xworkz.shaadi.dto.MatrimoneyDTO;
import org.springframework.stereotype.Service;

@Service
public interface Shaadiservice {

    public boolean validate(MatrimoneyDTO matrimoneyDTO);
}
