package com.dh.spring5webapp.repositories;

import com.dh.spring5webapp.model.TypeEvaluator;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface PositionTypeEvaluatorRepository extends CrudRepository<TypeEvaluator,Long> {
    @Override
    List<TypeEvaluator> findAll();
}
