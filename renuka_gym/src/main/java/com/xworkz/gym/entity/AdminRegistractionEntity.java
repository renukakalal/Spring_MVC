package com.xworkz.gym.entity;


import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;


@NamedQuery(name="getRegcountName" , query ="select count(*) from AdminRegistractionEntity rk where rk.name =:SetName")

@NamedQuery(name="getRegcountEmail" , query ="select count(*) from AdminRegistractionEntity rk where rk.email =:SetEmail")

//@NamedQuery(name="getRegList",query = "SELECT a FROM AdminRegistractionEntity a")

@NamedQuery(name = "getRegDetails", query = "SELECT a FROM AdminRegistractionEntity a")
@NamedQuery(name = "updateRegisterDetailsById", query = "UPDATE AdminRegistractionEntity a SET a.packaged=:getPackaged,a.name=:SetName,a.trainer=:getTrainer,a.amount=:getAmount,a.balance=:getBalance where a.id=:getId")
@NamedQuery(name = "findUserEmailAndPassword", query = "SELECT a FROM AdminRegistractionEntity a WHERE a.email = :SetEmail")
//@NamedQuery(name = "updateByEmail",query = "UPDATE AdminRegistractionEntity a SET  a.filePath = :filePath WHERE a.email = :SetEmail")

@NamedQuery(name = "findUserEmail", query = "SELECT a FROM AdminRegistractionEntity a WHERE a.email = :SetEmail")
@NamedQuery(name = "resetByEmail", query = "SELECT a FROM AdminRegistractionEntity a WHERE a.email = :SetEmail")
@NamedQuery(name = "getUseDetailsById", query = "SELECT m FROM AdminRegistractionEntity m WHERE m.id = :setId")
@NamedQuery(name = "findByNameAndEmail", query = "SELECT u FROM AdminRegistractionEntity u WHERE u.name = :SetName AND u.email = :SetEmail")
@NamedQuery(name = "assignSlot",query = "SELECT a FROM AdminRegistractionEntity a")
//@NamedQuery(name = "updateTrainerId",query = "UPDATE AdminRegistractionEntity u SET u.trainerId= :trainerId WHERE u.entityId = :entityId")
@NamedQuery(name = "updateTrainerId", query = "UPDATE AdminRegistractionEntity u SET u.trainer = (SELECT t FROM TrainerDetailsEntity t WHERE t.id = :trainerId) WHERE u.id = :entityId"
)
@NamedQuery(name = "findUserById", query = "SELECT t FROM AdminRegistractionEntity t WHERE t.trainer = :SetId")



@Data
@Getter
@Setter
@Entity
@Table(name="adminRegister_details")
public class AdminRegistractionEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name="name")
    private String name;

    @Column(name="email")
    private String email;

    @Column(name="password")
    private String password;

    @Column(name="gymName")
    private String gymName;


    @Column(name="trainer")
    private String trainer;


    @Column(name="packaged")
    private String packaged;


    @Column(name="discount")
    private String discount;


    @Column(name="amount")
    private double amount;//25000

    @Column(name="amountPaid")
    private long amountPaid;//5000

//    xyz=>5000+10000+10000
    //5000-25000=>20000
    //10000-20000=>10000
    //10000-10000=>0

    @Column(name="balance")
    private double balance;

    @Column(name="instalment")
    private String instalment;

    @Column(name = "ImageFilePath")
    private String filePath;

    @Column(name = "loginCount")
    private int LoginCount;



    @Column(name="lockTime")
    LocalDateTime accountLockTime;

   // @Column(name="isLocked")
   // private boolean isLocked;

    @Column(name="gender")
    private String gender;
    @Column(name="weight")
    private int weight;
    @Column(name="age")
    private int age;
    @Column(name ="height")
    private float height;


}
