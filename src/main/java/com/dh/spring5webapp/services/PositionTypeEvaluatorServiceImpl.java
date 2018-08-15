package com.dh.spring5webapp.services;

import com.dh.spring5webapp.model.Position;
import com.dh.spring5webapp.model.TypeEvaluator;
import com.dh.spring5webapp.repositories.PositionTypeEvaluatorRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

@Service
public class PositionTypeEvaluatorServiceImpl extends GenericServiceImpl<TypeEvaluator>  implements PositionTypeEvaluatorService
{
    private static Logger logger = LoggerFactory.getLogger(Position.class);

    private PositionTypeEvaluatorRepository repository;

    public PositionTypeEvaluatorServiceImpl(PositionTypeEvaluatorRepository repository)
    {
        this.repository = repository;
    }
    @Override
    protected CrudRepository<TypeEvaluator, Long> getRepository() {
        return repository;
    }
}
