package com.dh.spring5webapp.services;

import com.dh.spring5webapp.model.Performance;
import com.dh.spring5webapp.repositories.PerformanceRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;


@Service
public class PerformanceServiceImpl extends GenericServiceImpl<Performance> implements PerformanceService {

    private static Logger logger = LoggerFactory.getLogger(PerformanceServiceImpl.class);

    private PerformanceRepository performanceRepository;

    public PerformanceServiceImpl(PerformanceRepository performanceRepository ){
        this.performanceRepository = performanceRepository;
    }


    @Override
    protected CrudRepository<Performance, Long> getRepository() {
        return performanceRepository ;
    }
}
