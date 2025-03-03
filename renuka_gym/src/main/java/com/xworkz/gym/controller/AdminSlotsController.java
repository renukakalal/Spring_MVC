package com.xworkz.gym.controller;


import com.xworkz.gym.dto.TimeSlotDetailsDTO;
import com.xworkz.gym.dto.TrainerDetailsDTO;
import com.xworkz.gym.entity.AdminRegistractionEntity;
import com.xworkz.gym.entity.TimeSlotDetailsEntity;
import com.xworkz.gym.entity.TrainerDetailsEntity;
import com.xworkz.gym.service.AdminService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/")
public class AdminSlotsController {

    @Autowired
    AdminService adminService;

    public AdminSlotsController() {
        log.info("admin sloths is running");
    }

    @GetMapping("/AdminTrainerDetails")
    public String trinerDetails() {
        return "TrainerDetails";
    }

    @GetMapping("/timeSlots")
    public String saveTimeSlot() {

        return "TimingSlots";
    }

    @PostMapping("/TimeSlots")
    public String saveTimeSlots(TimeSlotDetailsDTO timeSlotDetailsDTO) {
        boolean saved = adminService.saveTimeSlots(timeSlotDetailsDTO);

        if (saved) {
            return "TimingSlots";
        } else {
            return "error";
        }

    }

    @GetMapping("/getTimeSlots")
    public String getTimeSlots(Model model) {
        List<TimeSlotDetailsEntity> list = adminService.getTimeSlot();

        log.info("list" + list);

        model.addAttribute("list", list);
        return "TimingSlots";
    }


    @PostMapping("/saveTrainerDetails")
    public String saveTrainerDetails(TrainerDetailsDTO timeSlotDetailsDTO) {
        log.info("printing in controller");
        boolean saved = adminService.saveTrainerDetails(timeSlotDetailsDTO);
        return "TimingSlots";
    }

    @GetMapping("/getTrainerDetails")
    public String getTainerDetails(Model model) {
        List<TimeSlotDetailsEntity> list = adminService.getTimeSlot();
        log.info("list" + list);
        model.addAttribute("list", list);


        log.info("printing in controller....");
        List<TrainerDetailsEntity> listofdto = adminService.getTrainerDetails();
        model.addAttribute("listofdto", listofdto);
        log.info("printing entity" + listofdto);
        return "TimingSlots";
    }

    @GetMapping("/assignSlot")
    public String assignSlot() {
        List<AdminRegistractionEntity> list = adminService.assignSlot();

        log.info("printining list" + list);
        return "AssignSlot";
    }

    @Controller
    public class AdminController {

        @Autowired
        private AdminService adminService;

        @GetMapping("/deleteSlot")
        public String deleteSlot(@RequestParam("id") int id,Model model) {
            log.info("Received request to delete slot with ID: " + id);
            boolean deleted = adminService.deteteById(id);
            if (deleted) {

                model.addAttribute("success","trainer is deleted");
                log.info("Successfully deleted trainer slot with ID: " + id);
            } else {

                model.addAttribute("failure","trainer is deleted");

                log.warn("Failed to delete trainer slot with ID: " + id);
            }
            return "TimingSlots";
        }
    }

    @GetMapping("/searchEntity")
    private String search(@RequestParam("name") String name, @RequestParam("email") String email, Model model) {
        log.info("search in controller");
        AdminRegistractionEntity entity = adminService.searchDetails(name, email);
        log.info("entity" + entity);
        model.addAttribute("entity", entity);

        List<TimeSlotDetailsEntity> list = adminService.getTimeSlot();

        log.info("list" + list);

        model.addAttribute("list", list);

        List<TrainerDetailsEntity> listofdto = adminService.getTrainerDetails();
        model.addAttribute("listofdto", listofdto);
        log.info("printing entity" + listofdto);

        return "AssignSlot";
    }

    @PostMapping("/assignSlot")
    public String assignTrainer(@RequestParam("entityId") int entityId,
                                @RequestParam("trainerId") int trainerId,Model model) {

        log.info("assign slot request in controller ");
        boolean updated = adminService.updateSlot(entityId, trainerId);

        if(updated)
        {
           model.addAttribute("success","updated successfully") ;
        }else {
            model.addAttribute("failure","not updated");
        }
        return "AssignSlot";  // Redirect to a confirmation page
    }

    @GetMapping("/searchUser")
    private String searchTriner(@RequestParam("name") String name, @RequestParam("email") String email, Model model) {


        return "UserTrainerAndSlot";
    }

    @GetMapping("/searchTrainerAndSlot")
    public String searchEntity(@RequestParam String name, @RequestParam String email, Model model) {
        // Fetch entity by name and email
        AdminRegistractionEntity entity = adminService.searchDetails(name, email);

        if (entity != null) {
            model.addAttribute("entity", entity);


        } else {
            model.addAttribute("message", "No record found!");
        }

        return "UserTrainerAndSlot"; // This will return the JSP page to display results
    }
    @GetMapping("/trainerSlotDetails")
    public String getTrainer(@RequestParam int id, Model model) {
        TrainerDetailsEntity trainerDetails = adminService.getDetailsById(id);
        model.addAttribute("trainerDetails", trainerDetails);
        return "UserTrainerAndSlot"; // This JSP should display the details
    }
    @GetMapping("/UserTrainerSlotDetails")
    public String getTrainer1(@RequestParam(name = "id", required = false) Integer id, Model model) {


        TrainerDetailsEntity trainerDetails = adminService.getDetailsById(id);
        model.addAttribute("trainerDetails", trainerDetails);
        model.addAttribute("trainerId", id);

        return "ViewSlot"; // Forward to JSP paget
    }
    @GetMapping("/getAllotedUsers")
    public String getAllotedUsers(@RequestParam("trainer") String trainer, Model model) {
        // Process trainerId (e.g., fetch data, delete trainer, etc.)
        log.info("Request received in controller");

        List<AdminRegistractionEntity> userName = adminService.getUserById(trainer);
        model.addAttribute("userName", userName); // Ensure this is correct


        List<TimeSlotDetailsEntity> list = adminService.getTimeSlot();
        model.addAttribute("list", list);

        List<TrainerDetailsEntity> listofdto = adminService.getTrainerDetails();
        model.addAttribute("listofdto", listofdto); // Pass listofdto

        log.info("list: " + list);
        log.info("listofdto: " + listofdto);
        return "AssignNewTrainer"; // Return to the JSP page
    }
    @GetMapping("/getSlotAndTrainer")
    public  String getSlotandTrainer(Model model)
    {

        List<TimeSlotDetailsEntity> list = adminService.getTimeSlot();

        model.addAttribute("list", list);


        log.info("list" + list);

        List<TrainerDetailsEntity> listofdto = adminService.getTrainerDetails();
        model.addAttribute("listofdto", listofdto);
        log.info("listofdto"+listofdto);


        return "AssignNewTrainer";
    }




}





