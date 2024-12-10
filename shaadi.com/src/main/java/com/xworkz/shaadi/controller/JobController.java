package com.xworkz.shaadi.controller;

import com.xworkz.shaadi.dto.JobDTO;
import com.xworkz.shaadi.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class JobController {

    @Autowired
    private JobService service;
   public  JobController()
   {
       System.out.println("job controller is running");
   }

   @RequestMapping("/job")
   public String get(JobDTO jobDTO)
   {
       System.out.println(jobDTO);

   if(this.service.validate(jobDTO))
    {
        System.out.println("saved");
    }
    else
    {
        System.out.println("not saved");
    }
    return "Job.jsp";

   }
}
