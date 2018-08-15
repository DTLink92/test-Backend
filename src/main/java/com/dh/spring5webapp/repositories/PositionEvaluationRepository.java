package com.dh.spring5webapp.repositories;

import com.dh.spring5webapp.model.Evaluation;
import com.dh.spring5webapp.model.TypeEvaluator;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface PositionEvaluationRepository extends CrudRepository<Evaluation,Long> {
    @Override
    List<Evaluation> findAll();
}
