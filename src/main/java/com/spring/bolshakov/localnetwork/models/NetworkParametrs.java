package com.spring.bolshakov.localnetwork.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "parametrs")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class NetworkParametrs {
    @Id
    @Column(name = "id")
    private Long id;
    @Column(name = "number")
    private String number;
    @Column(name = "switch_access")
    private int switch_access;
    @Column(name = "switch_distribution")
    private int switch_distribution;
    @Column(name = "switch_core")
    private int switch_core;
}
