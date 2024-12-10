package com.xworkz.shaadi.dto;


import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class JobDTO {


    private String name;
    private String email;
    private long phoneNumber;
    private String graduation;
    private int collegeName;
    private float cgpa;
    private String skills;
    private int sslcPercentage;
    private int pucPercentage;



}
