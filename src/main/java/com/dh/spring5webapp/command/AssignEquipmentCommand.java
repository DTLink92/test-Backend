package com.dh.spring5webapp.command;

import com.dh.spring5webapp.model.Assign_Equipment;
import com.dh.spring5webapp.model.Employee;
import com.dh.spring5webapp.model.ModelBase;

import java.util.Date;

public class AssignEquipmentCommand extends ModelBase {

    private Long idEmployee;
    private String nameEmployee;
    public String lastnameEmployee;
    private String fullNameEmployee;
    private Date dateAssign;
    private Date dateReturn;
    private String description;
    private int statusEmployee;

    public AssignEquipmentCommand(){

    }

    public AssignEquipmentCommand(Assign_Equipment assignEquipment){
        setId(assignEquipment.getId());
        setVersion(assignEquipment.getVersion());
        setCreatedOn(assignEquipment.getCreatedOn());
        setUpdatedOn(assignEquipment.getUpdatedOn());
        this.idEmployee = assignEquipment.getEmployee().getId();
        this.nameEmployee = assignEquipment.getEmployee().getFirst_name();
        this.lastnameEmployee = assignEquipment.getEmployee().getLast_name();
        this.fullNameEmployee = getFullName(assignEquipment.getEmployee());
        this.dateAssign = assignEquipment.getDateAssign();
        this.dateReturn = assignEquipment.getDateReturn();
        this.description = assignEquipment.getDescription();
        this.statusEmployee = assignEquipment.getStatusEmployee();
    }

    public String getFullName(Employee employee){
        String res = "";
        String name = employee.getFirst_name();
        String lastname = employee.getLast_name();
        res = name +" "+  lastname;
        return res;
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

    public String getLastnameEmployee() {
        return lastnameEmployee;
    }

    public void setLastnameEmployee(String lastnameEmployee) {
        this.lastnameEmployee = lastnameEmployee;
    }

    public String getFullNameEmployee() {
        return fullNameEmployee;
    }

    public void setFullNameEmployee(String fullNameEmployee) {
        this.fullNameEmployee = fullNameEmployee;
    }

    public Date getDateAssign() {
        return dateAssign;
    }

    public void setDateAssign(Date dateAssign) {
        this.dateAssign = dateAssign;
    }

    public Date getDateReturn() {
        return dateReturn;
    }

    public void setDateReturn(Date dateReturn) {
        this.dateReturn = dateReturn;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStatusEmployee() {
        return statusEmployee;
    }

    public void setStatusEmployee(int statusEmployee) {
        this.statusEmployee = statusEmployee;
    }

    public Assign_Equipment toAssignEquipment() {
        Assign_Equipment assignEquipment = new Assign_Equipment();
        assignEquipment.setDescription(getDescription());
        assignEquipment.setDateAssign(getDateAssign());
        assignEquipment.setDateReturn(getDateReturn());
        assignEquipment.setStatusEmployee(getStatusEmployee());
        return assignEquipment;
    }

    public void updateValues(Assign_Equipment assignEquipment) {
        assignEquipment.setDateAssign(getDateAssign());
        assignEquipment.setDateReturn(getDateReturn());
        assignEquipment.setDescription(getDescription());
    }
}
