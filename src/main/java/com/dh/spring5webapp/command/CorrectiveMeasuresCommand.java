/**
 * (C) Dev : Juan Pablo Mejia
 */
package com.dh.spring5webapp.command;

import com.dh.spring5webapp.model.CorrectiveMeasures;
import com.dh.spring5webapp.model.EmployeeAccident;

public class CorrectiveMeasuresCommand {

    private Long id;

    private String description;
    private int status;

    // section employee
    private Long idEmployee;
    private String fullname;

    // fields accident
    private Long idArea;
    private String descriptionArea;

    public CorrectiveMeasuresCommand(CorrectiveMeasures correctiveMeasures) {
        this.id = correctiveMeasures.getId();
        this.description = correctiveMeasures.getDescription();
        this.status = correctiveMeasures.getStatus();

        this.idArea = correctiveMeasures.getArea().getId();
        this.descriptionArea = correctiveMeasures.getArea().getName();

        this.idEmployee = correctiveMeasures.getSupervisor().getId();
        this.fullname = correctiveMeasures.getSupervisor().getFirst_name() + " " + correctiveMeasures.getSupervisor().getLast_name();

    }

    public CorrectiveMeasuresCommand() {

    }


    public CorrectiveMeasures toDomain() {
        CorrectiveMeasures correctiveMeasures = new CorrectiveMeasures();
        correctiveMeasures.setDescription(getDescription());
        correctiveMeasures.setStatus(getStatus());
        return correctiveMeasures;
    }

    public void updateValues(CorrectiveMeasures correctiveMeasures) {
        correctiveMeasures.setDescription(getDescription());
        correctiveMeasures.setStatus(getStatus());
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Long getIdEmployee() {
        return idEmployee;
    }

    public void setIdEmployee(Long idEmployee) {
        this.idEmployee = idEmployee;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public Long getIdArea() {
        return idArea;
    }

    public void setIdArea(Long idArea) {
        this.idArea = idArea;
    }

    public String getDescriptionArea() {
        return descriptionArea;
    }

    public void setDescriptionArea(String descriptionArea) {
        this.descriptionArea = descriptionArea;
    }
}
