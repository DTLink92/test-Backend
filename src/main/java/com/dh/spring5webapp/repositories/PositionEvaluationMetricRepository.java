package com.dh.spring5webapp.repositories;

import com.dh.spring5webapp.model.EvaluationMetric;
import com.dh.spring5webapp.model.TypeEvaluator;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface PositionEvaluationMetricRepository extends CrudRepository<EvaluationMetric,Long> {
    @Override
    List<EvaluationMetric> findAll();
}
