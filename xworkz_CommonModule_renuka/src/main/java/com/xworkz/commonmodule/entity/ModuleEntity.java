package com.xworkz.commonmodule.entity;


import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Data
@Table(name="module_table4")

@NamedQuery(name="getcountName" , query ="select count(*) from ModuleEntity rk where rk.name =:SetName")
@NamedQuery(name = "getcountemail", query = "SELECT COUNT(*) FROM ModuleEntity rk WHERE rk.email = :SetEmail")
@NamedQuery(name="getcountaltEmail",query = "select count(*) from ModuleEntity rk where rk.alternativeEmail =:SetAlternativeEmail")
@NamedQuery(name="getcountNumber",query = "select count(*) from ModuleEntity rk where rk.phoneNumber =:SetphoneNumber")
@NamedQuery(name="getcountalternumber",query ="select count(*) from ModuleEntity rk where rk.alternativePhoneNumber =:SetalternativePhoneNumber")
@NamedQuery(name="findbyemail",query = "Select em from ModuleEntity em where em.email=:emailid")
@NamedQuery(name="getAll",query = "select ls from ModuleEntity ls where ls.email = :setEmail and ls.password = :setPassword")
@NamedQuery(name="getByEmail",query = "select ls from ModuleEntity ls where ls.email =: setEmail")
@NamedQuery(name = "getNameByPassword",query = "SELECT c FROM ModuleEntity c WHERE c.name= :name")
@NamedQuery(name="getName",query ="select ls from ModuleEntity ls where ls.email = :setEmail and ls.password = :setPassword")
@NamedQuery(name="login",query = "select ls from ModuleEntity ls where ls.email = :setEmail")
public class ModuleEntity extends AbstractAdutEntity{


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name="user_name")
    private String name;
    @Column(name="user_email")
    private String email;
    @Column(name = "loginCount")
    private int LoginCount;
    @Column(name="altEmail")
    private String alternativeEmail;
    @Column(name="user_phNumber")
    private long phoneNumber;
    @Column(name="altph_Number")
    private long alternativePhoneNumber;
    @Column(name="user_location")
    private String location;
    @Column(name="password")
    private String password;


    }


