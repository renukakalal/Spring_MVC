package com.xworkz.shaadi.controller;

import com.xworkz.shaadi.dto.BankAccountDTO;
import com.xworkz.shaadi.service.BankAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class BankAccountController {

    @Autowired
    public BankAccountService service;

    public BankAccountController() {
        System.out.println("bank Account is running");
    }

    @RequestMapping("/open")
    public String deposite(BankAccountDTO bankAccountDTO) {
        System.out.println(bankAccountDTO);
        if (this.service.validate(bankAccountDTO)) {
            System.out.println("saved");
        } else {
            System.out.println("not saved");

        }
        return "BankAccount.jsp";
    }
}

