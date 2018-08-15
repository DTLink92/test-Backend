/**
 * (C) 2017 Agilysys NV, LLC.  All Rights Reserved.  Confidential Information of Agilysys NV, LLC.
 */
package com.dh.spring5webapp.command;

import com.dh.spring5webapp.model.Equipment;
import com.dh.spring5webapp.model.ModelBase;
import org.apache.tomcat.util.codec.binary.Base64;


import java.util.Date;



public class EquipmentCommand extends ModelBase {

    private String name;
    private String brand;
    private String status;
    // private int numberAsigment;
    private Long type_equipment_id;
    private String type_equipment_name;
    private  Long id;
    private Date dateofpurchase;
   // private String imageEquipment;




    public EquipmentCommand(Equipment equipment){
       this.name = equipment.getName();

        //this.numberAsigment = equipment.getEmployeeAssignEquipments().size();
        // this.setNumberAsigment(equipment.getEmployeeAssignEquipments().size());

        this.brand = equipment.getBrand();
        this.status = equipment.getStatus();
        this.id = equipment.getId();
        this.setDateofpurchase(equipment.getDateofpurchase());
        // this.setIdEmployee(employeeAccident.getEmployee().getId());
    //    this.setTypeEquipmentID(equipment.getTypeEquipment().getId());
      //  this.setTypeEquipmentName(equipment.getTypeEquipment().getName());
        // this.typeEquipmentID = equipment.getTypeEquipment().getId();
        // this.typeEquipmentName = equipment.getTypeEquipment().getName();

        //  this.numberAsigment = equipment.getEmployeeAssignEquipments().size();
       /* if (equipment.getImageEquipment() != null) {
            byte[] bytes = new byte[equipment.getImageEquipment().length];
            for (int i = 0; i < equipment.getImageEquipment().length; i++) {
                bytes[i] = equipment.getImageEquipment()[i];
            }
            String imageStr = Base64.encodeBase64String(bytes);
            this.setImageEquipment(imageStr);
        } */

    }
    public EquipmentCommand() {

    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }


    //@OneToMany(fetch = FetchType.LAZY, mappedBy = "equipment", cascade = CascadeType.REMOVE)
    //private List<EmployeeAssignEquipment> assignEquipments = new LinkedList<EmployeeAssignEquipment>();


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public Long getTypeEquipmentID() {
        return type_equipment_id;
    }

    public void setTypeEquipmentID(Long type_equipment_id) {
        this.type_equipment_id = type_equipment_id;
    }

    public String getTypeEquipmentName() {
        return type_equipment_name;
    }

    public void setTypeEquipmentName(String type_equipment_name) {
        this.type_equipment_name = type_equipment_name;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getDateofpurchase() {
        return dateofpurchase;
    }

    public void setDateofpurchase(Date dateofpurchase) {
        this.dateofpurchase = dateofpurchase;
    }

    public Equipment toEquipment() {
        Equipment equipment = new Equipment();
        equipment.setBrand(getBrand());
        equipment.setStatus(getBrand());
        equipment.setName(getName());
        equipment.setDateofpurchase(getDateofpurchase());
        // equipment.setImage(this.image);
        //    equipment.setTypeEquipment(this.getTypeEquipmentID());
//
        return equipment;
    }
}
