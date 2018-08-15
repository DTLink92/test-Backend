package com.dh.spring5webapp.repositories;


import com.dh.spring5webapp.model.Performance;
import org.springframework.data.repository.CrudRepository;

public interface PerformanceRepository extends CrudRepository<Performance, Long > {
}
