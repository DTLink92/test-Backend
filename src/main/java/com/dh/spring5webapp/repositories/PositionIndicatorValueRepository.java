package com.dh.spring5webapp.repositories;

import com.dh.spring5webapp.model.IndicatorValue;
import com.dh.spring5webapp.model.TypeEvaluator;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface PositionIndicatorValueRepository extends CrudRepository<IndicatorValue,Long> {
    @Override
    List<IndicatorValue> findAll();
}
