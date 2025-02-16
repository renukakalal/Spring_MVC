package com.xworkz.gym.entity;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import java.io.Serializable;
import java.time.LocalDateTime;


@MappedSuperclass
@Data
public class AbstractAductEntity  implements Serializable
{

    //private String createdBy;
    private LocalDateTime createDate =LocalDateTime.now();
    private String updatedBy;
    @Column(name = "updatedDate")
    private LocalDateTime updatedDate =LocalDateTime.now();

}
