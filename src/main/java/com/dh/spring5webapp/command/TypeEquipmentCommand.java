/**
 * (C) 2017 Agilysys NV, LLC.  All Rights Reserved.  Confidential Information of Agilysys NV, LLC.
 */
package com.dh.spring5webapp.command;

import com.dh.spring5webapp.model.Equipment;
import com.dh.spring5webapp.model.ModelBase;
import com.dh.spring5webapp.model.TypeEquipment;

import javax.persistence.Column;
import javax.persistence.Version;
import java.util.Date;

public class TypeEquipmentCommand extends ModelBase {

    private String name;
    private String description_type_equipment;
    private Long id;




    public TypeEquipmentCommand (TypeEquipment typeEquipment){
        this.name=typeEquipment.getName();
        this.description_type_equipment=typeEquipment.getDescriptionTypeEquipment();
        this.setId(typeEquipment.getId());

    }
    public TypeEquipmentCommand(){

    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescriptionTypeEquipment() {
        return description_type_equipment;
    }

    public void setDescriptionTypeEquipment(String description_type_equipment) {
        this.description_type_equipment = description_type_equipment;
    }
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


    public TypeEquipment toTypeEquipment() {
        TypeEquipment typeEquipment = new TypeEquipment();
        typeEquipment.setDescriptionTypeEquipment(getDescriptionTypeEquipment());
        typeEquipment.setName(getName());
        typeEquipment.setVersion(1);
        typeEquipment.setCreated_by(new Long(1));
        typeEquipment.setCreatedOn(new Date());
        typeEquipment.setModify_by(new Long(1));

//        item.setName(getName());
        return typeEquipment;
    }
}
