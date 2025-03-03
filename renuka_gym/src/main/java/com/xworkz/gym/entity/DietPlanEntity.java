package com.xworkz.gym.entity;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

//@NamedQuery(name = "getDiet",query = "select ls from DietPlanEntity ls")
@NamedQuery(name = "findByUserId", query = "SELECT d FROM DietPlanEntity d WHERE d.UserId = :UserId")


@Data
@Entity
@Getter
@Setter
@Table(name = "diet_plan")
public class DietPlanEntity {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name="mealTime")
    private String mealTime;
    @Column(name="foodItems")
    private String foodItems;
    @Column(name="calories")
    private int calories;
    @Column(name="exercise")
    private String exercise;
    @Column(name="duration")
    private int duration;
    @Column(name="intensity")
    private String intensity;
   @Column(name="UserId")// Foreign key column
    private int UserId;
}
