package com.xworkz.gym.controller;


import com.xworkz.gym.dto.DietPlanDTO;
import com.xworkz.gym.entity.AdminRegistractionEntity;
import com.xworkz.gym.entity.DietPlanEntity;
import com.xworkz.gym.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/")
public class DietPlanController {

    @Autowired
    AdminService adminService;

    @PostMapping("/saveDietPlan")
    public String saveDietPlan(@ModelAttribute DietPlanDTO dietPlanDTO) {
        System.out.println("Saving Diet Plan: " + dietPlanDTO);

        boolean saved = adminService.saveDietPlan(dietPlanDTO);
        if (saved) {
            return "DietPlan";  // Return the success page
        } else {
            return "error";  // Redirect to an error page
        }
    }

    @GetMapping("/getDietList")
    public String searchEntity(@RequestParam String name, @RequestParam String email, Model model) {
        // Fetch entity by name and email
        AdminRegistractionEntity entity = adminService.searchDetails(name, email);


        if (entity != null) {
            model.addAttribute("entity", entity);


        } else {
            model.addAttribute("message", "No record found!");
        }
        return "DietPlan";
    }

    @GetMapping("/getByUserId")
    public String getDietPlanByUserId(@RequestParam("UserId") int UserId, Model model) {
        List<DietPlanEntity> list = adminService.getDietPlan(UserId); // Call service method

        model.addAttribute("dietPlans", list);  // Add data to model

        return "ViewDietPlan";  // Return view name
    }

}