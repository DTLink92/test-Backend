package com.dh.spring5webapp.repositories;

import com.dh.spring5webapp.model.Position_Equipment;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface PositionEquipmentRepository extends CrudRepository<Position_Equipment, Long> {
    public List<Position_Equipment> findByPosition_Id(Long id);
}
