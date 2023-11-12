package com.spring.bolshakov.localnetwork.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NetworkPagesController {

    @GetMapping("/")
    public String startProject() {
        return "start";
    }
    @GetMapping("/create")
    public String createNetwork() {
        return "create";
    }

    @GetMapping("/networks")
    public String listNetworks() {
        return "networks";
    }

}
