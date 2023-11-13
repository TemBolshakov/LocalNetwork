package com.spring.bolshakov.localnetwork.repositories;

import com.spring.bolshakov.localnetwork.models.Network;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface NetworkRepository extends JpaRepository<Network, Long> {
    List<Network> findByName(String name);
}
