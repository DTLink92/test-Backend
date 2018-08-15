package com.dh.spring5webapp.command;

import com.dh.spring5webapp.model.DetailAssignEquipment;
import com.dh.spring5webapp.model.Detail_Assign_Equipment;
import com.dh.spring5webapp.model.ModelBase;

import java.util.Date;

public class DetailAssignEquipmentNewCommand extends ModelBase {

    private Long idAssignEquip;
    private Long idEquipment;
    private Long idEmployee;
    private String nameEmployee;
    private Date dateAssign;
    private String nameEquip;
    private String nameTypeEquip;


    public DetailAssignEquipmentNewCommand(DetailAssignEquipment detailAssignEquipment){
        setId(detailAssignEquipment.getId());
        /*setVersion(detailAssignEquipment.getVersion());
        setCreatedOn(detailAssignEquipment.getCreatedOn());
        setUpdatedOn(detailAssignEquipment.getUpdatedOn());*/
        this.idAssignEquip = detailAssignEquipment.getIdAssignEquip();
        this.idEquipment = detailAssignEquipment.getIdEquipment();
        this.idEmployee = detailAssignEquipment.getIdEmployee();
        this.nameEmployee = detailAssignEquipment.getNameEmployee();
        this.dateAssign = detailAssignEquipment.getDateAssign();
        this.nameEquip = detailAssignEquipment.getNameEquip();
        this.nameTypeEquip = detailAssignEquipment.getNameTypeEquip();
    }


    public Long getIdAssignEquip() {
        return idAssignEquip;
    }

    public void setIdAssignEquip(Long idAssignEquip) {
        this.idAssignEquip = idAssignEquip;
    }

    public Long getIdEquipment() {
        return idEquipment;
    }

    public void setIdEquipment(Long idEquipment) {
        this.idEquipment = idEquipment;
    }

    public Long getIdEmployee() {
        return idEmployee;
    }

    public void setIdEmployee(Long idEmployee) {
        this.idEmployee = idEmployee;
    }

    public String getNameEmployee() {
        return nameEmployee;
    }

    public void setNameEmployee(String nameEmployee) {
        this.nameEmployee = nameEmployee;
    }

    public Date getDateAssign() {
        return dateAssign;
    }

    public void setDateAssign(Date dateAssign) {
        this.dateAssign = dateAssign;
    }

    public String getNameEquip() {
        return nameEquip;
    }

    public void setNameEquip(String nameEquip) {
        this.nameEquip = nameEquip;
    }

    public String getNameTypeEquip() {
        return nameTypeEquip;
    }

    public void setNameTypeEquip(String nameTypeEquip) {
        this.nameTypeEquip = nameTypeEquip;
    }

    public DetailAssignEquipment toDetailAssignEquipment() {
        DetailAssignEquipment detailAssignEquipment = new DetailAssignEquipment();
        return detailAssignEquipment;
    }

    public void updateValues(DetailAssignEquipment detailAssignEquipment) {

    }
}
