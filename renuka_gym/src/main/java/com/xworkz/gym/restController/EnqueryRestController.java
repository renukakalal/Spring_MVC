package com.xworkz.gym.restController;


import com.xworkz.gym.service.AdminService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/")
public class EnqueryRestController {

    @Autowired
    AdminService adminService;


    private static final Logger log = LoggerFactory.getLogger(EnqueryRestController.class);

    public EnqueryRestController()
    {
        log.info("rest controller running in controller");
    }
    @GetMapping(value = "/enquery/name/{name}",produces = MediaType.APPLICATION_JSON_VALUE)
    public String onName(@PathVariable String name, Model model) {

        log.info("name request in controller");

        System.out.println("name" + name);

        long count =adminService.getcountName(name);

        // Add a message to the model based on whether the phone number exists or not
        if (count == 0) {

            return "name is not exist";

        } else {


        }
        return "name exists";

    }
    @GetMapping(value = "/enquery/phoneNumber/{phoneNumber}",produces = MediaType.APPLICATION_JSON_VALUE)
    public String onPhoneNumber(@PathVariable long phoneNumber, Model model) {

        log.info("name request in controller");

        System.out.println("phoneNumber" + phoneNumber);

        long count =adminService.getPhoneNumber(phoneNumber);

        // Add a message to the model based on whether the phone number exists or not
        if (count == 0) {

            return "phoneNumber is not exist";

        } else {


        }
        return "phoneNumber exists";

    }
}
