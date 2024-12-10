package com.xworkz.shaadi.controller;

import com.xworkz.shaadi.dto.HotelDTO;
import com.xworkz.shaadi.service.HotelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/")
public class HotelController {

    @Autowired
    public HotelService service;

    public HotelController() {
        System.out.println("hotelcontroller is running");
    }
@RequestMapping("/hotel")
    public String book(HotelDTO hotelDTO) {
        if (this.service.validate(hotelDTO)) {
            System.out.println("saved");
        } else {
            System.out.println("not saved");
        }
        return "Hotel.jsp";
    }
}

