package com.xworkz.gym.dto;


import lombok.*;

@Getter
@Setter
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChangesDTO {



    private  int id;
    private int weight;
    private String file;
    private float height;
    private int UserId;
}
