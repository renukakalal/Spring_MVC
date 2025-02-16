package com.xworkz.gym.entity;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalTime;
//@NamedQuery(name = "getTrainerList",query = "SELECT a FROM TrainerDetailsEntity a")
@NamedQuery(
        name = "getTrainerList",
        query = "SELECT a FROM TrainerDetailsEntity a ORDER BY a.slotTimings DESC")
@NamedQuery(name = "deleteById", query = "DELETE FROM TrainerDetailsEntity u WHERE u.id = :SetId")
//@NamedQuery(name = "findByTrainerId", query = "SELECT e FROM TrainerDetailsEntity e WHERE e.trainerId = :SetTrainerId")
@NamedQuery(name = "findByTrainerId", query = "SELECT e FROM TrainerDetailsEntity e WHERE e.id = :SetId"
)
@Data
@Entity
@Table(name="trainer_details")
public class TrainerDetailsEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name="trainer")
    private String trainer;
    @Column(name="phoneNumber")
    private long phoneNumber;

    @Column(name="slotTimings")
    private String slotTimings;
}
