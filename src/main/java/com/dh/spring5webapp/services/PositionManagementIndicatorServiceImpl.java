package com.dh.spring5webapp.services;

import com.dh.spring5webapp.model.ManagementIndicator;
import com.dh.spring5webapp.model.Position;
import com.dh.spring5webapp.repositories.PositionManagementIndicatorRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

@Service
public class PositionManagementIndicatorServiceImpl extends GenericServiceImpl<ManagementIndicator> {

    private static Logger logger = LoggerFactory.getLogger(Position.class);

    private PositionManagementIndicatorRepository repository;

    public PositionManagementIndicatorServiceImpl(PositionManagementIndicatorRepository repository)
    {
        this.repository = repository;
    }
    @Override
    protected CrudRepository<ManagementIndicator, Long> getRepository() {
        return repository;
    }
}
