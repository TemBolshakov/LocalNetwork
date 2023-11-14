package com.spring.bolshakov.localnetwork.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "networks")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Network {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
    @Column(name = "name")

    private String name;
    @Column(name = "description", columnDefinition = "text")
    private String description;
    @Column(name = "number")
    private int number;
    @Column(name = "topology")
    private String topology;



}
