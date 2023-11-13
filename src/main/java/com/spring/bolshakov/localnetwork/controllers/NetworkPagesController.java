package com.spring.bolshakov.localnetwork.controllers;

import com.spring.bolshakov.localnetwork.models.Network;
import com.spring.bolshakov.localnetwork.services.NetworkService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
public class NetworkPagesController {
    private final NetworkService networkService;
    @GetMapping("/")
    public String startProject() {
        return "start";
    }
    @GetMapping("/create")
    public String createNetwork(Model model) {
        return "create";
    }

    @GetMapping("/networks")
    public String listNetworks(Model model) {
        model.addAttribute("networks", networkService.listNetworks());
        return "networks";
    }

    @GetMapping("/network/{id}")
    public String InfoNetwork(@PathVariable Long id, Model model) {
        model.addAttribute("networks", networkService.getNetworkById(id));
        return "network";
    }
    @PostMapping("/network/create")
    public String AddNetwork(Network network) {
        networkService.addNetwork(network);
        return "redirect:/networks";
    }

    @PostMapping("/network/delete/{id}")
    public String DeleteNetwork(@PathVariable Long id) {
        networkService.deleteNetwork(id);
        return "redirect:/networks";
    }


}
