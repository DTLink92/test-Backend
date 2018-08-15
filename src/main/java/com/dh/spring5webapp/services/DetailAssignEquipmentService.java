package com.dh.spring5webapp.services;

import com.dh.spring5webapp.model.DetailAssignEquipment;
import com.dh.spring5webapp.model.Detail_Assign_Equipment;

import java.util.List;

public interface DetailAssignEquipmentService extends GenericService<Detail_Assign_Equipment>{
    public List<DetailAssignEquipment> getAllAssignEquip(Long id);
    public List<Object> GroupEquipmentByAssign();
    public List<Object> GroupEquipmentByDateAssign();
    /*public List<Detail_Assign_Equipment> getDetailByAssignEquip(Long id);*/
}
