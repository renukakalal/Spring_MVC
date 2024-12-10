package com.xworkz.shaadi.controller;

import com.xworkz.shaadi.dto.DeathCerificateDTO;
import com.xworkz.shaadi.service.DeathCertificateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class DeathCertificateController {
    @Autowired
    public DeathCertificateService service;
   public  DeathCertificateController()
   {
       System.out.println("death certificate running");
   }
   @RequestMapping("/certificate")
   public String register(DeathCerificateDTO deathCerificateDTO)
   {
       System.out.println(deathCerificateDTO);

   if(this.service.validate(deathCerificateDTO))
    {
        System.out.println("saved");
    }
   else
    {
        System.out.println("not saved");
    }
   return "DeathCertificate.jsp";
}
}
