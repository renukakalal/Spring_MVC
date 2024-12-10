package com.xworkz.shaadi.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class HospitalDTO {

    private String hospitalName;
    private String location;
    private String patientName;
    private int patientbill;
}
