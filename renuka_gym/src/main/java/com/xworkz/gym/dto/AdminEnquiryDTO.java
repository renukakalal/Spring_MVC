package com.xworkz.gym.dto;


import lombok.*;


@Getter
@Setter
@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdminEnquiryDTO {

    private int id;
    private String name;
    private String area;
    private long phoneNumber;
    private long distance;
    private int age;
    private String status;
    private String reason;




}
