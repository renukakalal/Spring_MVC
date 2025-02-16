package com.xworkz.gym.dto;


import lombok.*;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.time.LocalTime;

@Getter
@Setter
@Data
@AllArgsConstructor
@NoArgsConstructor
public class TimeSlotDetailsDTO {

    private int id;
    private String startTime;
    private String endTime;
    @NotNull(message = "Duration cannot be null")
    @Min(value = 1, message = "Duration must be greater than 0")
    private String duration;

}

