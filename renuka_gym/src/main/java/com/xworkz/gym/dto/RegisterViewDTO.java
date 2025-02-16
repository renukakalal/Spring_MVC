package com.xworkz.gym.dto;


import lombok.*;

@Getter
@Setter
@Data
@AllArgsConstructor
@NoArgsConstructor
public class RegisterViewDTO {

    private int id;
    private int registerId;
    private String name;
    private String packaged;
    private String trainer;
    private String instalment;
    private double amount;
    private double balance;
    private double amountPaid;
}
