package com.spring.bolshakov.localnetwork.services;

import com.spring.bolshakov.localnetwork.models.Network;
import com.spring.bolshakov.localnetwork.repositories.NetworkRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class NetworkService {
    private final NetworkRepository networkRepository;
    private List<Network> networks = new ArrayList<>();

    public List<Network> listNetworks() {
        return networkRepository.findAll();
    }

    public void addNetwork(Network network) {
        log.info("Saving new {}", network);
        networkRepository.save(network);
    }

    public void deleteNetwork(Long id) {
        networkRepository.deleteById(id);
    }

    public Network getNetworkById(Long id) {
        return networkRepository.findById(id).orElse(null);
    }
}
