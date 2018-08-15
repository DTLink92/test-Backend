package com.dh.spring5webapp.model;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.util.Date;

@Entity
public class DetailAssignEquipment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Long idAssignEquip;
    private Long idEquipment;
    private Long idEmployee;
    private String nameEmployee;
    private Date dateAssign;
    private String nameEquip;
    private String nameTypeEquip;



    public Long getId() {
        return id;
    }


    public void setId(Long id) {
        this.id = id;
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
}
