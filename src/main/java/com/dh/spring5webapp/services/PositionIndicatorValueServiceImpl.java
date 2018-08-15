package com.dh.spring5webapp.services;

import com.dh.spring5webapp.model.IndicatorValue;
import com.dh.spring5webapp.model.Position;
import com.dh.spring5webapp.repositories.PositionIndicatorValueRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

@Service
public class PositionIndicatorValueServiceImpl extends GenericServiceImpl<IndicatorValue> {
    private static Logger logger = LoggerFactory.getLogger(Position.class);

    private PositionIndicatorValueRepository repository;

    public PositionIndicatorValueServiceImpl(PositionIndicatorValueRepository repository)
    {
        this.repository = repository;
    }
    @Override
    protected CrudRepository<IndicatorValue, Long> getRepository() {
        return repository;
    }
}
