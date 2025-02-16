package com.xworkz.gym.entity;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@NamedQuery(name = "getEmail",query = "select ls from AdminLoginEntity ls where ls.email =: setEmail")

@Data
@Getter
@Setter
@Entity
@Table(name="admin_details")
public class AdminLoginEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name="name")
    private String name;
    @Column(name="email")
    private String email;
    @Column(name="password")
    private String password;

}
