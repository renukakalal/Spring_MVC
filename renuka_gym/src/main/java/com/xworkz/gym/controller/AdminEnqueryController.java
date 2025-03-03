package com.xworkz.gym.controller;


import com.xworkz.gym.constant.GymNameEnum;
import com.xworkz.gym.constant.PackageEnum;
import com.xworkz.gym.constant.StatusEnum;
import com.xworkz.gym.constant.TrainerEnum;
import com.xworkz.gym.dto.AdminEnquiryDTO;
import com.xworkz.gym.dto.AdminRegistrationDTO;
import com.xworkz.gym.dto.EnqueryViewDTO;
import com.xworkz.gym.entity.AdminEnquiryEntity;
import com.xworkz.gym.entity.AdminRegistractionEntity;
import com.xworkz.gym.entity.EnqueryViewEntity;
import com.xworkz.gym.service.AdminService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/")
public class AdminEnqueryController {

    private static final Logger log = LoggerFactory.getLogger(AdminEnqueryController.class);
    List<StatusEnum> listOfstatus = new ArrayList<>(Arrays.asList(StatusEnum.values()));

    @Autowired
    AdminService adminService;


    @PostMapping("/enquiry")
    public String nosave(AdminEnquiryDTO adminDTO, Model model) {


        boolean saved = adminService.save(adminDTO);


        if (saved) {

            model.addAttribute("success","your Enquiry details are successfull");
            return "Success";
        } else {
            model.addAttribute("failure","your details not saved");
            return "Enquiry";
        }
    }

    @GetMapping("/follow")
    public String follow(AdminEnquiryEntity adminEnquiryEntity, AdminEnquiryDTO adminDTO, Model model) {

        List<AdminEnquiryEntity> listofentity = adminService.getall();
        log.info("printing entity" + listofentity);
        model.addAttribute("list", listofentity);
        model.addAttribute("listOfstatus", listOfstatus);
        model.addAttribute("entity",listofentity);

        return "Follow";
    }

    @RequestMapping(value = "/updateStatus", method = RequestMethod.POST)
    public String updateStatus(@RequestParam("enquiryId") int enquiryId,@RequestParam("updatedBy") String updatedBy,@RequestParam("status") String status,
            @RequestParam("reason") String reason,@RequestParam("name") String name,
            Model model,EnqueryViewDTO enqueryViewDTO)
    {
        log.info("requesting status for enquiryId.....");
        System.out.println(updatedBy + " " + enquiryId + " " + status + " " + reason);

        int updatedValue = adminService.updateUserEnquiryDetails(enquiryId,name,updatedBy,status, reason,enqueryViewDTO);

//        log.info("enqury requesting is going to databse");
//        boolean saved=adminService.saveEnq(enqueryViewDTO);

        if (updatedValue > 0) {
            model.addAttribute("enquiryName", "Successfully Updated Details Of " + updatedBy);
        } else {
            model.addAttribute("notUpdated", "Failed to Update Details of " + updatedBy);
        }

        return "Success";


    }

    @GetMapping("/EnquiryView")
    public String viewEnquiryDetails(@RequestParam("id") int enquiryId, Model model) {
        log.info("requesting to admin controller");
        List<EnqueryViewEntity> list = adminService.enqHistory(enquiryId);
        System.out.println("EnquiryView " + list);
        model.addAttribute("list", list);
        log.info("getting enquiry history " + list);
        if (list != null) {
            model.addAttribute("enqHistory", list);
            return "EnqueryView";
        } else {
            model.addAttribute("message", "Enquiry not found");
            return "error";
        }
    }

}





