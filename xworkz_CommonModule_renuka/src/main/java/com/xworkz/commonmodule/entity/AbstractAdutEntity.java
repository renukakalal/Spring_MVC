package com.xworkz.commonmodule.entity;

import lombok.Data;
import sun.util.calendar.BaseCalendar;

import javax.persistence.MappedSuperclass;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

@MappedSuperclass
@Data
public class AbstractAdutEntity implements Serializable {

    private String createdBy;
    private LocalDateTime createDate =LocalDateTime.now();
    private String updatedBy;
    private LocalDateTime updatedDate =LocalDateTime.now();


}
