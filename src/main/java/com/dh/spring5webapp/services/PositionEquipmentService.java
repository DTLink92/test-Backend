package com.dh.spring5webapp.services;

import com.dh.spring5webapp.model.Position_Equipment;

import java.util.List;

public interface PositionEquipmentService extends GenericService<Position_Equipment> {
    public List<Position_Equipment> getAllPosition(Long id);
}
