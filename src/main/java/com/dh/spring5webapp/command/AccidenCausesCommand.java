/**
 * (C) Dev : Juan Pablo Mejia
 */
package com.dh.spring5webapp.command;

import com.dh.spring5webapp.model.AccidentCauses;

public class AccidenCausesCommand {

    private Long id;

    private int status;
    // section cause
    private Long idCause;
    private String nameCause;

    // fields accident
    private Long idAccident;
    private String descriptionAccident;

    public AccidenCausesCommand(AccidentCauses accidentCauses) {
        this.status = accidentCauses.getStatus();
        this.id = accidentCauses.getId();

        this.setIdCause(accidentCauses.getCause().getId());
        this.setNameCause(accidentCauses.getCause().getDescription());

        this.setIdAccident(accidentCauses.getAccident().getId());
        this.setDescriptionAccident(accidentCauses.getAccident().getDescription_accident());
    }

    public AccidenCausesCommand() {

    }


    public AccidentCauses toDomain() {
        AccidentCauses accidentCauses = new AccidentCauses();
        accidentCauses.setStatus(getStatus());
        return accidentCauses;
    }

    public void updateValues(AccidentCauses accidentCauses) {
        accidentCauses.setStatus(getStatus());
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Long getIdCause() {
        return idCause;
    }

    public void setIdCause(Long idCause) {
        this.idCause = idCause;
    }

    public String getNameCause() {
        return nameCause;
    }

    public void setNameCause(String nameCause) {
        this.nameCause = nameCause;
    }

    public Long getIdAccident() {
        return idAccident;
    }

    public void setIdAccident(Long idAccident) {
        this.idAccident = idAccident;
    }

    public String getDescriptionAccident() {
        return descriptionAccident;
    }

    public void setDescriptionAccident(String descriptionAccident) {
        this.descriptionAccident = descriptionAccident;
    }
}
