package com.dh.spring5webapp.model;

import javax.persistence.Entity;
import java.util.Date;

//@Entity
public class DWAccident {

    private Long area_id;
    private String areaname;
    private String positionname;
    private String equipmentname;
    private String equipmentbrand;
    private String employeeName;
    private String name_Accidentado;
    private Date date;
    private String place;
    private String gravity;
    private String description;
    private String type;
    private Long equipment_id;

    public Long getEquipment_id() {
        return equipment_id;
    }

    public void setEquipment_id(Long equipment_id) {
        this.equipment_id = equipment_id;
    }

    public Long getArea_id() {
        return area_id;
    }

    public void setArea_id(Long area_id) {
        this.area_id = area_id;
    }

    public String getAreaname() {
        return areaname;
    }

    public void setAreaname(String areaname) {
        this.areaname = areaname;
    }

    public String getPositionname() {
        return positionname;
    }

    public void setPositionname(String positionname) {
        this.positionname = positionname;
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

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public String getName_Accidentado() {
        return name_Accidentado;
    }

    public void setName_Accidentado(String name_Accidentado) {
        this.name_Accidentado = name_Accidentado;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public String getGravity() {
        return gravity;
    }

    public void setGravity(String gravity) {
        this.gravity = gravity;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
