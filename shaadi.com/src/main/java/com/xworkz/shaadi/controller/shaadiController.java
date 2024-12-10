package com.xworkz.shaadi.controller;

import com.xworkz.shaadi.dto.MatrimoneyDTO;
import com.xworkz.shaadi.service.Shaadiservice;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class shaadiController {

    private Shaadiservice matrimoney;

   public  shaadiController()
   {
       System.out.println("matrimany is running");
   }

   @RequestMapping("/send")
   public String onpress(MatrimoneyDTO matrimoneyDTO)
   {

       boolean valid=matrimoney.validate(matrimoneyDTO);
       if(valid) {
           System.out.println("this is valid");
       }
           else
           {
               System.out.println("this is not valid");
           }

       return "Matrimony.jsp";
   }




}
