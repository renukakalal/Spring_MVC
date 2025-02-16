package com.xworkz.gym.restController;

import com.xworkz.gym.service.AdminService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/")
public class RegRestController {

    @Autowired
    AdminService adminService;

    private static final Logger log = Logger.getLogger(RegRestController.class);

    public RegRestController()
    {
        log.info("reg rest controller is running");
    }

    @GetMapping(value = "/reg/name/{name}",produces = MediaType.APPLICATION_JSON_VALUE)
    public String onName(@PathVariable String name, Model model) {

        log.info("name request in controller");

        System.out.println("name" + name);

        long count =adminService.getRegcountName(name);

        // Add a message to the model based on whether the phone number exists or not
        if (count == 0) {

            return "name is not exist";

        } else {


        }
        return "name exists";

    }

//    @GetMapping(value = "/phoneNumber/{phoneNumber}",produces = MediaType.APPLICATION_JSON_VALUE)
//    public String onPhoneNumber(@PathVariable long phoneNumber, Model model) {
//
//        log.info("phoneNumber request in controller");
//
//        System.out.println("phoneNumber" + phoneNumber);
//
//        long count =adminService.getRegCountPhoneNumber(phoneNumber);
//
//        // Add a message to the model based on whether the phone number exists or not
//        if (count == 0) {
//
//            return "phoneNumber is not exist";
//
//        } else {
//
//
//        }
//        return "phoneNumber exists";
//
//    }
    @GetMapping(value = "/reg/email/{email}",produces = MediaType.APPLICATION_JSON_VALUE)
    public String onEmail(@PathVariable String email, Model model) {

        log.info("email request in controller");

        System.out.println("email" + email);

        long count =adminService.getRegCountEmail(email);

        // Add a message to the model based on whether the phone number exists or not
        if (count == 0) {

            return "email is not exist";

        } else {


        }
        return "email exists";

    }
}
