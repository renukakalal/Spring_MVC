package com.xworkz.gym.entity;


import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;


@NamedQuery(name="getcountName" , query ="select count(*) from AdminEnquiryEntity rk where rk.name =:SetName")
@NamedQuery(name="getcountPhoneNumber" , query ="select count(*) from AdminEnquiryEntity rk where rk.phoneNumber =:SetPhoneNumber")


@NamedQuery(name = "getAll",query = "select ls from AdminEnquiryEntity ls")
@NamedQuery(name = "getId",query = "select ls from AdminLoginEntity ls where ls.id =: Setid")
@NamedQuery(name = "updateUserEnquiryDetailsById", query = "UPDATE AdminEnquiryEntity a SET a.status=:getStatus,a.name=:SetName,a.updatedBy=:getupdatedBy,a.reason=:getReason where a.id=:getId")
@NamedQuery(name = "getAllUserDetailsById", query = "select a from AdminEnquiryEntity a WHERE a.id=:SetId")




@Data
@Getter
@Setter
@Entity
@Table(name="admin_table")
public class AdminEnquiryEntity extends AbstractAductEntity{


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name="name")
    private String name;
    @Column(name="area")
    private String area;
    @Column(name="phoneNumber")
    private long phoneNumber;
    @Column(name="distance")
    private long distance;
    @Column(name="age")
    private int age;
    @Column(name="status")
    private String status;
    @Column(name="reason")
    private String reason;



}
