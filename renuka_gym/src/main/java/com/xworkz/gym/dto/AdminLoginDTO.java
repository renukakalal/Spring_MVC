package com.xworkz.gym.dto;


import lombok.*;

@Getter
@Setter
@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdminLoginDTO {

    private int id;
    private String name;
    private String email;
    private String password;
}

