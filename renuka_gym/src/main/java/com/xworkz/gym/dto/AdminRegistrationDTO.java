package com.xworkz.gym.dto;


import lombok.*;

@Getter
@Setter
@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdminRegistrationDTO {

    private int id;
    private String name;
    private String email;
    private String password;
    private String packaged;
    private String trainer;
    private double amount;
    private long amountPaid;
    private String discount;
    private String gymName;
    private double balance;
    private String instalment;
    private String gender;
    private int weight;
    private int age;
    private double height;


}
