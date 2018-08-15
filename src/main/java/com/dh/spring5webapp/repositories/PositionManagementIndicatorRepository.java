package com.dh.spring5webapp.repositories;

import com.dh.spring5webapp.model.ManagementIndicator;
import com.dh.spring5webapp.model.TypeEvaluator;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface PositionManagementIndicatorRepository extends CrudRepository<ManagementIndicator,Long> {
    @Override
    List<ManagementIndicator> findAll();
}
