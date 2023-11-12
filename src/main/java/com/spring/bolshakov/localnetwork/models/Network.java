package com.spring.bolshakov.localnetwork.models;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Network {
    private Long id;
    private String name;
    private String description;
    private int number;
    private String topology;



}
