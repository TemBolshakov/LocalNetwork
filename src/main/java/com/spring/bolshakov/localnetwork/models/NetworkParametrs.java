package com.spring.bolshakov.localnetwork.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "parametrs")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class NetworkParametrs {
    @Id
    @Column(name = "id")
    private Long id;
    @Column(name = "number")
    private int number;
    @Column(name = "switch_access")
    private int switch_access;
    @Column(name = "switch_access_ports")
    private int switch_access_ports;
    @Column(name = "switch_distribution")
    private int switch_distribution;
    @Column(name = "switch_distribution_ports")
    private int switch_distribution_ports;
    @Column(name = "switch_core")
    private int switch_core;
    @Column(name = "switch_core_ports")
    private int switch_core_ports;
}
