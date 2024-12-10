package com.xworkz.shaadi.service;

import com.xworkz.shaadi.dto.BankAccountDTO;
import org.springframework.stereotype.Service;

@Service
public class BankAccountServiceImp implements BankAccountService{

    @Override
    public boolean validate(BankAccountDTO bankAccountDTO) {
        return false;
    }
}
