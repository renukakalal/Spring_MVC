package com.xworkz.gym.dto;


import lombok.*;

@Getter
@Setter
@Data
@AllArgsConstructor
@NoArgsConstructor
public class EnqueryViewDTO{


    private int id;
    private int enquiryId;
    private String name;
    private long phoneNumber;
    private String status;
    private String reason;

}
