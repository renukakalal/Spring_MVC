package com.xworkz.shaadi.service;

import com.xworkz.shaadi.dto.BankAccountDTO;
import org.springframework.stereotype.Service;


public interface BankAccountService {
    boolean validate(BankAccountDTO bankAccountDTO);
}
