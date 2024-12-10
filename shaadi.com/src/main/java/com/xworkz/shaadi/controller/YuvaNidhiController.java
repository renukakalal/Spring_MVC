package com.xworkz.shaadi.controller;

import com.xworkz.shaadi.dto.YuvaNidhiDTO;
import com.xworkz.shaadi.service.YuvaNidhiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class YuvaNidhiController {

    @Autowired
    private YuvaNidhiService service;

    public YuvaNidhiController()
    {

        System.out.println("yuvaNidhi is running");
    }

@RequestMapping("/uvaNidhi")
    public String sansaction(YuvaNidhiDTO yuvaNidhiDTO)
    {
        System.out.println("Running yuvanidhi");
        System.out.println(yuvaNidhiDTO);
        
        if(this.service.validate(yuvaNidhiDTO)){
            System.out.println("saved");
        }else{
            System.out.println("Not saved");
        }
        return "YuvaNidhi.jsp";
    }


}
