package com.xworkz.commonmodule.controller;


import com.sun.xml.internal.ws.api.server.Module;
import com.xworkz.commonmodule.service.ModuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import sun.security.pkcs11.Secmod;

@RestController
@RequestMapping("/")
public class ModuleRestController {


    @Autowired
    private ModuleService moduleservice1;


    @GetMapping(value = "/name/{name}",produces = MediaType.APPLICATION_JSON_VALUE)
    public String onName(@PathVariable String name, Model model) {

        System.out.println("name" + name);

        long count = moduleservice1.getcountName(name);

        // Add a message to the model based on whether the phone number exists or not
        if (count == 0) {

            return "name is not exist";

        } else {


        }
        return "name exists";

    }


    @GetMapping(value = "/email/{email}", produces = MediaType.APPLICATION_JSON_VALUE)
    public String onemail(@PathVariable String email) {
        System.out.println("email" + email);
        long count = moduleservice1.getcountName(email);
        if (count == 0) {
            System.out.println("email is not exist");
            return  "not exist";
        } else {
            System.out.println("email is exist");
        }
        return "exist";

    }


    @GetMapping(value = "/alternativeEmail/{alternativeEmail}", produces = MediaType.APPLICATION_JSON_VALUE)
    public String onaltremail(@PathVariable String alternativeEmail) {
        System.out.println("alternativeEmail" + alternativeEmail);
        long count = moduleservice1.getcountName(alternativeEmail);
        if (count == 0) {
            System.out.println("alternativeEmail is not exist");
            return "alternativeEmail not exist";
        } else {
            System.out.println("alternativeEmail is exist");
        }
        return " alternativeEmail exist";

    }
    @GetMapping(value = "/phoneNumber/{phoneNumber}", produces = MediaType.APPLICATION_JSON_VALUE)
    public String onaltemail(@PathVariable String phoneNumber) {
        System.out.println("phoneNumber" + phoneNumber);
        long count = moduleservice1.getcountName(phoneNumber);
        if (count == 0) {
            System.out.println("phoneNumber is not exist");
        } else {
            System.out.println("phoneNumber is exist");
        }
        return "exist";

    }
    @GetMapping(value = "/alternativePhoneNumber/{alternativePhoneNumber}", produces = MediaType.APPLICATION_JSON_VALUE)
    public String onaltnumber(@PathVariable String alternativePhoneNumber) {
        System.out.println("alternativePhoneNumber: " + alternativePhoneNumber);
        long count = moduleservice1.getcountName(alternativePhoneNumber);
        if (count == 0) {
            System.out.println("alternativePhoneNumber is not exist");
            return "alt number not exist";
        } else {
            System.out.println("alternativePhoneNumber is exist");
        }
        return "alt number exist";
    }


}



