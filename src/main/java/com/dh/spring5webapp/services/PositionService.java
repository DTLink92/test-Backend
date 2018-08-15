package com.dh.spring5webapp.services;

import com.dh.spring5webapp.model.Position;
import com.dh.spring5webapp.model.PositionNew;

import java.util.List;

public interface PositionService extends GenericService<Position>{
    void DeletePosition(Long id);

    List<Position> findAll();

    List<PositionNew> findAllPositions();
    PositionNew findByIdPosition(Long id);
    PositionNew savePosition (PositionNew model);
}
