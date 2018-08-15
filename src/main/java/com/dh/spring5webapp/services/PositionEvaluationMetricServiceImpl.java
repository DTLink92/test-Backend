package com.dh.spring5webapp.services;

import com.dh.spring5webapp.model.EvaluationMetric;
import com.dh.spring5webapp.repositories.PositionEvaluationMetricRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

@Service
public class PositionEvaluationMetricServiceImpl extends GenericServiceImpl<EvaluationMetric> implements PositionEvaluationMetricService
{
    private static Logger logger = LoggerFactory.getLogger(EquipmentServiceImpl.class);

    private PositionEvaluationMetricRepository repository;

    public PositionEvaluationMetricServiceImpl(PositionEvaluationMetricRepository repository) {
        this.repository = repository;
    }
    @Override
    protected CrudRepository<EvaluationMetric, Long> getRepository() {
        return repository;
    }
}
