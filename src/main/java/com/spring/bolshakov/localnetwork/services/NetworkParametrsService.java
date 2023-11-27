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

            double switch_access_ports = Math.ceil((double) access * 0.7);
            double switch_distibution_ports = Math.ceil(distribution * 0.7);
            double switch_core_ports = Math.ceil(core * 0.7);

            double switch_access = Math.ceil((double) number / switch_access_ports);
            double switch_distribution = Math.ceil(switch_access / switch_distibution_ports);
            double switch_core = Math.ceil(switch_distribution / switch_core_ports);

            NetworkParametrs networkParametrs = new NetworkParametrs();

            networkParametrs.setId(id);
            networkParametrs.setNumber(number);
            networkParametrs.setSwitch_access((int)switch_access);
            networkParametrs.setSwitch_distribution((int)switch_distribution);
            networkParametrs.setSwitch_core((int)switch_core);

            networkParametrs.setSwitch_access_ports((int) switch_access_ports);
            networkParametrs.setSwitch_distribution_ports((int) switch_distibution_ports);
            networkParametrs.setSwitch_core_ports((int) switch_core_ports);

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
