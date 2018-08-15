package com.dh.spring5webapp.model;

public class DWEquipment {
    private Long equipment_id;
    private String equipmentname;
    private String equipmentbrand;

    public Long getEquipment_id() {
        return equipment_id;
    }

    public void setEquipment_id(Long equipment_id) {
        this.equipment_id = equipment_id;
    }

    public String getEquipmentname() {
        return equipmentname;
    }

    public void setEquipmentname(String equipmentname) {
        this.equipmentname = equipmentname;
    }

    public String getEquipmentbrand() {
        return equipmentbrand;
    }

    public void setEquipmentbrand(String equipmentbrand) {
        this.equipmentbrand = equipmentbrand;
    }
}
