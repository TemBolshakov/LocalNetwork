package com.spring.bolshakov.localnetwork.services;

import com.spring.bolshakov.localnetwork.models.Network;
import com.spring.bolshakov.localnetwork.models.NetworkParametrs;
import com.spring.bolshakov.localnetwork.repositories.NetworkParametrsRepository;
import com.spring.bolshakov.localnetwork.repositories.NetworkRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@Slf4j
@RequiredArgsConstructor
public class NetworkParametrsService {
    private final NetworkRepository networkRepository;
    private final NetworkParametrsRepository networkParametrsRepository;

    List<NetworkParametrs> parametrs = new ArrayList<>();

    public List<NetworkParametrs> listNetworkParametrs() {
        return networkParametrsRepository.findAll();
    }

    public void calculationAndAddParameters(Long networkId, int access, int distribution, int core) {
        Optional<Network> optionalNetwork = networkRepository.findById(networkId);

        if(optionalNetwork.isPresent()) {
            Network network = optionalNetwork.get();

            long id = network.getId();
            int number = network.getNumber();
            double switch_access = Math.ceil((double) number /access/0.7);
            double switch_distribution = Math.ceil(switch_access /distribution/0.7);
            double switch_core = Math.ceil(switch_distribution/core/0.7);

            NetworkParametrs networkParametrs = new NetworkParametrs();

            networkParametrs.setId(id);
            networkParametrs.setNumber(number);
            networkParametrs.setSwitch_access((int)switch_access);
            networkParametrs.setSwitch_distribution((int)switch_distribution);
            networkParametrs.setSwitch_core((int)switch_core);

            networkParametrsRepository.save(networkParametrs);
        }

    }

    public NetworkParametrs getNetworkParametrsById(Long id) {
        return networkParametrsRepository.findById(id).orElse(null);
    }

    public void deleteNetworkParametrs(Long id) {
        networkParametrsRepository.deleteById(id);
    }
}
