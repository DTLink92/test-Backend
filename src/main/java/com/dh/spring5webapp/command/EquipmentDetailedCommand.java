package com.dh.spring5webapp.command;

import com.dh.spring5webapp.model.Equipment;
import com.dh.spring5webapp.model.ModelBase;
import org.apache.tomcat.util.codec.binary.Base64;

import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;
import java.util.Calendar;
import java.util.Date;

public class EquipmentDetailedCommand extends ModelBase {
    private String name;
    private String brand;
    private String code;
    private String manufactured;
    private String warranty;
    private Date dateofpurchase;
    private String status;
    private String description;
    private String image_equipment;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getManufactured() {
        return manufactured;
    }

    public void setManufactured(String manufactured) {
        this.manufactured = manufactured;
    }

    public String getWarranty() {
        return warranty;
    }

    public void setWarranty(String warranty) {
        this.warranty = warranty;
    }

    public Date getDateofpurchase() {
        return dateofpurchase;
    }

    public void setDateofpurchase(Date dateofpurchase) {
        this.dateofpurchase = dateofpurchase;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImageEquipment() {
        return image_equipment;
    }

    public void setImageEquipment(String image_equipment) {
        this.image_equipment = image_equipment;
    }
    public EquipmentDetailedCommand() {

    }
    public  EquipmentDetailedCommand(Equipment equipment){
        setId(equipment.getId());
        setVersion(equipment.getVersion());
        setCreatedOn(equipment.getCreatedOn());
        setUpdatedOn(equipment.getUpdatedOn());
        setName(equipment.getName());
        setBrand(equipment.getBrand());
        setCode(equipment.getCode());
        setManufactured(equipment.getManufactured());
        setWarranty(equipment.getWarranty());
        setDateofpurchase(equipment.getDateofpurchase());
        setStatus(equipment.getStatus());
        setDescription(equipment.getDescription());
        if (equipment.getImageEquipment() != null) {
            try {
                byte[] decodedString = Base64.decodeBase64(new String(equipment.getImageEquipment()).getBytes("UTF-8"));
                this.setImageEquipment(new String(decodedString));
            }
            catch (Exception e)
            {
                System.out.println(e.getMessage());
            }
        }


    }
    public Equipment toEquipment() {
        Equipment equipment = new Equipment();
        equipment.setName(getName());
        equipment.setBrand(getBrand());
        equipment.setCode(getCode());
        equipment.setManufactured(getManufactured());
        equipment.setWarranty(getWarranty());
        equipment.setDateofpurchase(getDateofpurchase());
        equipment.setStatus(getStatus());
        equipment.setDescription(getDescription());
        if (this.getImageEquipment() != null) {
            byte[] codedString = Base64.encodeBase64(this.getImageEquipment().getBytes());
            equipment.setImageEquipment(codedString);
        }
        return equipment;

    }
    private static int oldEquipment(Date dateofpurchase) {
        if (dateofpurchase == null) return 0;
        LocalDate localDatePurchase = dateofpurchase.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        Calendar calendar = Calendar.getInstance();
        LocalDate currentDate = calendar.getTime().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        if ((localDatePurchase != null) && (currentDate != null)) {
            return Period.between(localDatePurchase, currentDate).getYears();
        } else {
            return 0;
        }
    }
    public void updateValues(Equipment equipment){
        equipment.setName(getName());
        equipment.setBrand(getBrand());
        equipment.setCode(getCode());
        equipment.setManufactured(getManufactured());
        equipment.setWarranty(getWarranty());
        equipment.setDateofpurchase(getDateofpurchase());
        equipment.setStatus(getStatus());
        equipment.setDescription(getDescription());
        byte[] codedString = Base64.encodeBase64(this.getImageEquipment().getBytes());
        equipment.setImageEquipment(codedString);

    }
}
