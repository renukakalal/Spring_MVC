package com.xworkz.shaadi.controller;

import com.xworkz.shaadi.dto.HospitalDTO;
import com.xworkz.shaadi.service.PatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class HospitalController {

    @Autowired
    public PatientService service;

    public HospitalController() {
        System.out.println("hospital is running");
    }


    @RequestMapping("/hospital")
    public String admit(HospitalDTO hospitalDTO) {
        System.out.println(hospitalDTO);
        if (this.service.validate(hospitalDTO)) {
            System.out.println("saved");
        } else {
            System.out.println("not saved");
        }
        return "Hospital.jsp";
    }
}
