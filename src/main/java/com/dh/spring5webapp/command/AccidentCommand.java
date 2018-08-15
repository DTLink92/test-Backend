package com.dh.spring5webapp.command;

import com.dh.spring5webapp.model.Accident;

import java.util.Date;


public class AccidentCommand {
    private Long id;
    private String nameAccidentado;
    private Date date_accident;
    private Date hour_accident;
    private String place_accident;
    private String gravity_accident;
    private String description_accident;
    private int accidentTypeId;
    private int areaId;
    private AccidentAreaCommand area;
    private AccidentTypeCommand type;

    public AccidentCommand() {
    }

    public AccidentCommand(Accident accident) {
        this.id = accident.getId();
        this.setNameAccidentado(accident.getNameAccidentado());
        this.setDate_accident(accident.getDate_accident());
        this.setHour_accident(accident.getHour_accident());
        this.setPlace_accident(accident.getPlace_accident ());
        this.setGravity_accident(accident.getGravity_accident());
        this.setDescription_accident(accident.getDescription_accident());
        // this.setType(new AccidentTypeCommand(accident.getAccidentType()));
        // @TODO this.setArea(new AreaCommand(accident.getArea()));
        this.areaId = accident.getAreaID();
        this.accidentTypeId = accident.getAccidentTypeID();
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

    public void setPlace_accident(String place_accident) {
        this.place_accident = place_accident;
    }

    public String getGravity_accident() {
        return gravity_accident;
    }

    public void setGravity_accident(String gravity_accident) {
        this.gravity_accident = gravity_accident;
    }


    public Accident toAccident() {
        Accident accident = new Accident();

        accident.setId(getId());
        accident.setNameAccidentado(getNameAccidentado());
        accident.setDate_accident(getDate_accident());
        accident.setHour_accident(getHour_accident());
        accident.setPlace_accident(getPlace_accident());
        accident.setGravity_accident(getGravity_accident());
        accident.setDescription_accident(getDescription_accident());

        accident.setAreaID(this.getAreaId());
        accident.setAccidentTypeID(this.getAccidentTypeId());

        return accident;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getAccidentTypeId() {
        return accidentTypeId;
    }

    public void setAccidentTypeId(int accidentTypeId) {
        this.accidentTypeId = accidentTypeId;
    }

    public int getAreaId() {
        return areaId;
    }

    public void setAreaId(int areaId) {
        this.areaId = areaId;
    }

    public AccidentAreaCommand getArea() {
        return area;
    }

    public void setArea(AccidentAreaCommand area) {
        this.area = area;
    }

    public AccidentTypeCommand getType() {
        return type;
    }

    public void setType(AccidentTypeCommand type) {
        this.type = type;
    }
}
