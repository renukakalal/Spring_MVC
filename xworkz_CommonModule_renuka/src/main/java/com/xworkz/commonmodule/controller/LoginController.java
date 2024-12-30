package com.xworkz.commonmodule.controller;


import com.xworkz.commonmodule.dto.ModuleDTO;
import com.xworkz.commonmodule.entity.ModuleEntity;
import com.xworkz.commonmodule.repository.ModuleRepository;
import com.xworkz.commonmodule.service.ModuleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/")
public class LoginController {


    private static final Logger log = LoggerFactory.getLogger(LoginController.class);
    @Autowired
    ModuleService moduleService;


    public LoginController()
    {
        log.info("configutarion is running");

    }

    @PostMapping("/save")
    public String nosave(Model model,@Valid ModuleDTO moduleDTO, BindingResult bindingResult) {

        log.info("in on save method...");
        System.out.println(bindingResult.getAllErrors());

        if (bindingResult.hasErrors()) {
            // Return the view with errors
          //  System.err.println("getting errors in controller.."+bindingResult.getAllErrors());
          List<ObjectError> errorList= bindingResult.getAllErrors();
          errorList.forEach(y-> System.out.println("getting errors in onSave method.."+y.getObjectName()+"..."+y.getDefaultMessage()));
            model.addAttribute("error",bindingResult.getAllErrors());
            model.addAttribute("user",moduleDTO);
            boolean saved = moduleService.save(moduleDTO);

            if (saved) {
                return "Success";
            }
            return "errorPage";  // Replace with actual error page name
        }


        return  "errorPage";
    }

    @PostMapping("/login")
    public String onDisplay(@RequestParam String email, @RequestParam String password, Model model) {

        log.info("getting request parameter" +email+"    "+password);

        ModuleEntity entity =moduleService.login(email, password);
        System.out.println("entity.getLoginCount()=="+entity.getLoginCount());

        if (entity == null) {
            return "SignIn";
        }

        if (entity.getLoginCount() == -1) {
            return "SignIn";
        }

        if (entity.getLoginCount() == 3) {
            return "SignIn";
        }

        if (entity.getLoginCount() == 0) {
            return "password";
        }

        return "SignIn";
    }
        @PostMapping("/updatePassword")
        public String resetPassword(@RequestParam String email,@RequestParam String newPassword,@RequestParam String confirmPassword) {
            log.info("new password is equal to conform password");
        if (!newPassword.equals(confirmPassword)) {
                return "password";
            }
            boolean isValid = moduleService.resetPassword(email,newPassword,confirmPassword);
            if (isValid) {
                return "SignIn";
            } else {
                return "password";
            }
        }

    }









