package com.spring.bolshakov.localnetwork.controllers;

import com.spring.bolshakov.localnetwork.models.Network;
import com.spring.bolshakov.localnetwork.models.NetworkParametrs;
import com.spring.bolshakov.localnetwork.services.NetworkParametrsService;
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
    private final NetworkParametrsService networkParametrsService;
    @GetMapping("/")
    public String startProject() {
        return "start";
    }
    @GetMapping("/create")
    public String createNetwork(Model model) {
        return "create";
    }


    @GetMapping("/create_parametrs/{id}")
    public String createNetworkParametrs(@PathVariable Long id, Model model) {
        model.addAttribute("networks", networkService.getNetworkById(id));
        return "create_parametrs";
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
    @GetMapping("/network/parametrs/{id}")
    public String InfoParametrs(@PathVariable Long id, Model model) {
        model.addAttribute("parametrs", networkParametrsService.getNetworkParametrsById(id));
        return "parametrs";
    }
    @PostMapping("/network/create")
    public String AddNetwork(Network network) {
        networkService.addNetwork(network);
        return "redirect:/networks";
    }

    @PostMapping("/network/delete/{id}")
    public String DeleteNetwork(@PathVariable Long id) {
        networkService.deleteNetwork(id);
        networkParametrsService.deleteNetworkParametrs(id);
        return "redirect:/networks";
    }

    @PostMapping("/network/parametrs/create/{id}")
    public String AddParametrs(@PathVariable Long id, int access, int distribution, int core) {
        networkParametrsService.calculationAndAddParameters(id, access, distribution, core);
        return "redirect:/network/parametrs/{id}";
    }

}
