package com.dh.spring5webapp.repositories;

import com.dh.spring5webapp.model.Position;
import com.dh.spring5webapp.model.TypeEvaluator;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface PositionRepository extends CrudRepository<Position, Long> {
    @Override
    List<Position> findAll();
}
