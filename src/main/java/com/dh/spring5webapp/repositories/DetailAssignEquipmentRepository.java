package com.dh.spring5webapp.repositories;

import com.dh.spring5webapp.model.Detail_Assign_Equipment;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface DetailAssignEquipmentRepository extends CrudRepository <Detail_Assign_Equipment, Long> {
    /*public List<Detail_Assign_Equipment> findByAssignEquipment_Id(Long id);*/
    /*public void deleteByAssignEquipment_Id(Long id);*/
}
