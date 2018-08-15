package com.dh.spring5webapp.repositories;

import com.dh.spring5webapp.model.Equipment;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface EquipmentRepository extends CrudRepository<Equipment, Long> {
    // public List<Equipment> findByTypeEquipment_Id(Long id);
}
