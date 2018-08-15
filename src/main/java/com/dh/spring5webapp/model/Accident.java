package com.dh.spring5webapp.model;

import javax.persistence.*;
import java.util.Date;

@Entity
public class Accident { //extends ModelBase {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "accidentID")
    private Long accidentId;
    @Column(name = "nameAccidentado")
    private String nameAccidentado;
    private Date date_accident;
    private Date hour_accident;
    private String place_accident;
    private String gravity_accident;
    private  String description_accident;
    //@ManyToOne(optional = false)
    @Column(name = "accidentTypeID")
    private int accidentTypeID;
    // @ManyToOne(optional = true)
    @Column(name = "areaID", nullable = true)
    private int areaID;

    public Long getId() {
        return accidentId;
    }

    public void setId(Long id) {
        this.accidentId = id;
    }

    public String getNameAccidentado() {
        return nameAccidentado;
    }

    public void setNameAccidentado(String nameAccidentado) {
        this.nameAccidentado = nameAccidentado;
    }



    public String getDescription_accident() {
        return description_accident;
    }

    public void setDescription_accident(String description_accident) {
        this.description_accident = description_accident;
    }

   /* public AccidentType getAccidentType() {
        return accidentType;
    }

    public void setAccidentType(AccidentType accidentType) {
        this.accidentType = accidentType;
    }*/

    public Date getDate_accident() {
        return date_accident;
    }

    public void setDate_accident(Date date_accident) {
        this.date_accident = date_accident;
    }

    public Date getHour_accident() {
        return hour_accident;
    }

    public void setHour_accident(Date hour_accident) {
        this.hour_accident = hour_accident;
    }

    public String getPlace_accident() {
        return place_accident;
    }

    public void setPlace_accident(String palce_accident) {
        this.place_accident = palce_accident;
    }

    public String getGravity_accident() {
        return gravity_accident;
    }

    public void setGravity_accident(String gravity_accident) {
        this.gravity_accident = gravity_accident;
    }

    public int getAccidentTypeID() {
        return accidentTypeID;
    }

    public void setAccidentTypeID(int accidentTypeID) {
        this.accidentTypeID = accidentTypeID;
    }

    public int getAreaID() {
        return areaID;
    }

    public void setAreaID(Integer areaId) {
        this.areaID = areaId;
    }
}
