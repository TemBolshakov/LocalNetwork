package com.spring.bolshakov.localnetwork.services;

import com.spring.bolshakov.localnetwork.models.Network;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class NetworkService {
    private List<Network> networks = new ArrayList<>();
    private long ID =0;

    public List<Network> listNetworks() {
        return networks;
    }

    public void addNetwork(Network network) {
        network.setId(++ID);
        networks.add(network);
    }

    public void deleteNetwork(Long id) {
        networks.removeIf(network -> network.getId().equals(id));

    }

    public Network getNetworkById(Long id) {
        for(Network network : networks) {
            if(network.getId().equals(id)) return network;
        }
        return null;
    }
}
