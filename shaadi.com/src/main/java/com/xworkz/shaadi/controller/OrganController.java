package com.xworkz.shaadi.controller;

import com.xworkz.shaadi.dto.OrganDTO;
import com.xworkz.shaadi.service.OrganService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class OrganController {


    @Autowired
    private OrganService service;

    public OrganController() {
        System.out.println("organ controller is running");
    }
@RequestMapping("/organ")
    public String donate(OrganDTO organDTO) {
        System.out.println(organDTO);

        if (this.service.validate(organDTO)) {
            System.out.println("saved");
        } else {
            System.out.println("not saved");
        }
        return "OrganDonation.jsp";


    }
}
