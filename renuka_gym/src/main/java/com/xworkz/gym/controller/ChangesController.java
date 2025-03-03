package com.xworkz.gym.controller;


import com.xworkz.gym.dto.ChangesDTO;
import com.xworkz.gym.entity.ChangesEntity;
import com.xworkz.gym.entity.DietPlanEntity;
import com.xworkz.gym.service.AdminService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/")
public class ChangesController {

    @Autowired
    AdminService adminservice;

    @GetMapping("/getChanges")
    public String getChangesByUserId(@RequestParam("UserId") int userId, Model model) {
        List<ChangesEntity> list = adminservice.getChanges(userId); // Call service method

        model.addAttribute("changesList", list);  // Add data to model

        return "ViewChanges";  // Return view name
    }

}



