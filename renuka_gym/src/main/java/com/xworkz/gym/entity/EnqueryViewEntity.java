package com.xworkz.gym.entity;


import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;

@NamedQuery(
        name = "getEnqHistoryById",
        query = "SELECT ls FROM EnqueryViewEntity ls WHERE ls.enquiryId = :Setid ORDER BY ls.updatedDate DESC"
)
@Data
@Getter
@Setter
@Entity
@Table(name="enq_history")


//@NamedQuery(name = "getEnqHistory", query = "SELECT e FROM EnqueryViewEntity e")

//@NamedQuery(name = "getEnqHistoryById", query = "select ls from EnqueryViewEntity ls where ls.enquiryId = :Setid")

public class EnqueryViewEntity extends AbstractAductEntity {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name="name")
    private String name;

    @Column(name="enq_id")
    private int enquiryId;
    @Column(name="status")
    private String status;

    @Column(name="reason")
    private String reason;

}
