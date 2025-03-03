package com.xworkz.gym.dto;


import lombok.*;

@Getter
@Setter
@Data
@AllArgsConstructor
@NoArgsConstructor

public class DietPlanDTO {

    private int id;
    private String mealTime;
    private String foodItems;
    private int calories;
    private String exercise;
    private int duration;
    private String intensity;
    private int UserId;

}
