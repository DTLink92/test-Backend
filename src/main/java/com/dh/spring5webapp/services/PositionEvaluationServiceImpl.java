package com.dh.spring5webapp.services;

import com.dh.spring5webapp.model.Evaluation;
import com.dh.spring5webapp.model.Position;
import com.dh.spring5webapp.repositories.PositionEvaluationRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

@Service
public class PositionEvaluationServiceImpl extends GenericServiceImpl<Evaluation> {

    private static Logger logger = LoggerFactory.getLogger(Position.class);

    private PositionEvaluationRepository repository;

    public PositionEvaluationServiceImpl(PositionEvaluationRepository repository)
    {
        this.repository = repository;
    }
    @Override
    protected CrudRepository<Evaluation, Long> getRepository() {
        return repository;
    }
}
