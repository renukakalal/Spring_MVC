package com.xworkz.gym.entity;


import lombok.Data;

import javax.persistence.*;
import java.time.LocalTime;
//
@NamedQuery(name = "getTimeSlotEntity",query = "SELECT a FROM TimeSlotDetailsEntity a")
////
//@NamedQuery(name="getEntityById",query = "SELECT m FROM TrainerDetailsEntity m WHERE m.id= :setId")

@Data
@Entity
@Table(name="slots_timing")
public class TimeSlotDetailsEntity
{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;


    @Column(name="startTime")
    private String startTime;
    @Column(name="endTime")
    private String endTime;
    @Column(name="duration")
    private String duration;

}
