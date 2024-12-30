package com.xworkz.commonmodule.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Email;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ModuleDTO {

    private int id;
    @NotNull(message = "Name cannot be null")
    @Size(min = 2, max = 5, message = "Name must be between 2 and 5 characters")
    private String name;
    @Email(message = "Invalid email format")
    private String email;
    @Email(message = "Invalid email format")
    private String alternativeEmail;
    @Min(value = 9, message = "Phone number must be at least 1 digit")
    private long phoneNumber;
    @Min(value = 9, message = "Phone number must be at least 1 digit")
    private long alternativePhoneNumber;
    @Size(min = 2, max = 5, message = "Name must be between 2 and 5 characters")
    private String location;


}
