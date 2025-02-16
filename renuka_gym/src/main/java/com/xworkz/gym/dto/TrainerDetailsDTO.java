package com.xworkz.gym.dto;


import lombok.*;


@Getter
@Setter
@Data
@AllArgsConstructor
@NoArgsConstructor
public class TrainerDetailsDTO {

    private int id;
    private String trainer;
    private long phoneNumber;
    private String slotTimings;
}
