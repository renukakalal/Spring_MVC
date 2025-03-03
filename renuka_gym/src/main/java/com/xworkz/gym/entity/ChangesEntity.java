package com.xworkz.gym.entity;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;

@NamedQuery(name = "findChangesById", query = "SELECT d FROM ChangesEntity d WHERE d.UserId = :UserId")


@Data
@Entity
@Getter
@Setter
@Table(name = "changes_table")
public class ChangesEntity {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  int id;
    @Column(name="weight")
    private int weight;
    @Column(name = "filePath")
    private String file;
    @Column(name ="height")
    private float height;
    @Column(name = "UserId")
    private int UserId;
}
