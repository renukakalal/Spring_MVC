package com.xworkz.gym.controller;


import com.xworkz.gym.dto.AdminRegistrationDTO;
import com.xworkz.gym.dto.ChangesDTO;
import com.xworkz.gym.entity.AdminRegistractionEntity;
import com.xworkz.gym.service.AdminService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/")
public class UserloginController {

    @Autowired
    AdminService adminService;

    public UserloginController() {
        log.info("user controller is running");
    }


    @GetMapping("/UserSignIn")
    public String showLoginPage() {
        return "UserSignIn";
    }
    @GetMapping("/image")
    public void display(HttpServletResponse response, @RequestParam String filePath) throws Exception {
        System.out.println("this is image: " + filePath);  // Debug log
        response.setContentType("image/jpeg");  // Fix content type (case-sensitive)

        File file = new File("C:\\projectimages\\" + filePath);
        if (!file.exists()) {
            System.out.println("File not found: " + file.getAbsolutePath());  // Debug log
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        InputStream inputStream = new BufferedInputStream(new FileInputStream(file));
        ServletOutputStream outputStream = response.getOutputStream();
        IOUtils.copy(inputStream, outputStream);
        response.flushBuffer();
    }








    @PostMapping("/userSignIn")
    public String userLogin(@RequestParam("email") String email, @RequestParam("password") String password, Model model) {
        log.info("User request is in the controller");

        // Attempt to authenticate the user based on email and password
        AdminRegistractionEntity isAuthenticated = adminService.userlogin(email, password);

        if (isAuthenticated != null) {
            log.info("Login count is: " + isAuthenticated.getLoginCount());
            model.addAttribute("isAuthenticated", isAuthenticated);

            if (isAuthenticated.getLoginCount() == 0) {
                model.addAttribute("isAuthenticated", isAuthenticated);

                return "Profile"; // Redirect to profile page if the login count is 0
            }

            if (isAuthenticated.getLoginCount() == 3) {
                log.warn("Account is locked");
                model.addAttribute("user", "Account is locked");
                return "UserSignIn";
            }

            if (isAuthenticated.getLoginCount() == -1) {
                return "UserSignIn"; // Some custom state (possibly an unactivated user, etc.)
            }
        }

        // If authentication fails, add an error message to the model
        model.addAttribute("errorMessage", "Invalid email or password.");
        return "UserSignIn"; // Stay on the login page with the error message
    }




    @GetMapping("/ResetPassword")
    public String resetPassword() {
        return "ResetPassword";
    }

    @PostMapping("/resetPassword")
    public String resetPassword(@RequestParam String email, @RequestParam String newPassword, @RequestParam String confirmPassword) {
        log.info("new password is equal to conform password");
        // if (!newPassword.equals(confirmPassword)) {
        //  return "password";
        // }
        boolean isValid = adminService.resetPassword(email, newPassword, confirmPassword);

        if (isValid) {

            return "UserSignIn";
        } else {

            return "ResetPassword";
        }
    }

    @GetMapping("/editDetails")
    public String updateUserDetails(@RequestParam("id") int id, Model model) {


        AdminRegistractionEntity entity = adminService.updateUserDetails(id);
        log.info("Entity ID: " + entity.getId());

        model.addAttribute("entity", entity);
        log.info("printying entity" + entity);

        return "EditProfile";
    }

    @PostMapping("/EditDetails")
    public String updateUserDetailsAndPhoto(
            @RequestParam("files") MultipartFile multipartFile,
            @RequestParam("id") int id,
            @RequestParam("name") String name,
            @RequestParam("trainer") String trainer,
            @RequestParam("packaged") String packaged,
            @RequestParam("amount") double amount,
            @RequestParam("amountPaid") double amountPaid,
            @RequestParam("balance") double balance,
            @RequestParam("weight") int weight,
            @RequestParam("height") float height,
             // For the profile photo
            AdminRegistrationDTO dto,ChangesDTO changesDTO, Model model)  {

        log.info("Updating user details and profile photo===============================================");

        // 1. Handle profile photo upload if a file is selected
        String filePath = null;
        if (!multipartFile.isEmpty()) {
            try {
                // Save the file to the desired location (e.g., C:\\projectimages\\)
                byte[] bytes = multipartFile.getBytes();
                Path path = Paths.get("C:\\projectimages\\" + System.currentTimeMillis() + ".jpg");
                Files.write(path, bytes);

                // Save the file path (or image reference) to the database
                filePath = path.getFileName().toString();
            } catch (Exception e) {
                e.printStackTrace();
                model.addAttribute("errorMessage", "Error saving the file.");
                return "error"; // Return an error page if the file upload fails
            }
        }


        boolean saved=adminService.saveChanges(changesDTO,filePath);

        // 2. Update user details
        boolean detailsUpdated = adminService.updateUserDetails1(id, name, trainer, packaged, amount, amountPaid, balance, filePath,weight,height);


        if (!detailsUpdated) {
            model.addAttribute("success", "Failed to update user details.");
            return "error"; // Return an error page if the details update fails
        }

        // Add success message
        model.addAttribute("failure", "User details and profile photo updated successfully.");

        // Redirect to the Profile page
        return "Profile";
    }



    @GetMapping("/ForgotPassword")
    public String forgotPassword() {
        return "ForgotPassword";
    }

    @PostMapping("/forgotPassword")
    public String forgotPassword1() {
        // boolean isValid=adminServicel

        return "UserSignIn";
    }

    @GetMapping("/profilePhoto")
    public String profilePhoto(Model model) {


        return "UpdateProfilePhoto";
    }






}




