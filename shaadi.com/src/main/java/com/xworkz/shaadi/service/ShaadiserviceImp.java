package com.xworkz.shaadi.service;

import com.xworkz.shaadi.dto.MatrimoneyDTO;
import org.springframework.stereotype.Service;

@Service
public class ShaadiserviceImp implements Shaadiservice{

    @Override
    public boolean validate(MatrimoneyDTO matrimoneyDTO) {


        return false;
    }
}
