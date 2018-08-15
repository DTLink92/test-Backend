/**
 * (C) Dev : Juan Pablo Mejia
 */
package com.dh.spring5webapp.command;

import com.dh.spring5webapp.model.Employee;
import com.dh.spring5webapp.model.EmployeeAccident;

public class EmployeeAccidentCommand {

    //private Employee employee;
    private Long id;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    private String zonaLesion;
    private String detalleLesion;
    private String tipoLesion;

    // section employee
    private Long idEmployee;
    private String fullname;

    // fields accident
    private Long idAccident;
    private String descriptionAccident;

    public EmployeeAccidentCommand(EmployeeAccident employeeAccident) {
        this.zonaLesion = employeeAccident.getZonaLesion();
        this.detalleLesion = employeeAccident.getDetalleLesion();
        this.tipoLesion = employeeAccident.getTipoLesion();
        this.id = employeeAccident.getId();

        this.setIdEmployee(employeeAccident.getEmployee().getId());
        this.setFullname(employeeAccident.getEmployee().getFirst_name() + " " +employeeAccident.getEmployee().getLast_name());

        this.setIdAccident(employeeAccident.getAccident().getId());
        this.setDescriptionAccident(employeeAccident.getAccident().getDescription_accident());
    }

    public EmployeeAccidentCommand() {

    }


    public EmployeeAccident toDomain() {
        EmployeeAccident employeeAccident = new EmployeeAccident();
        employeeAccident.setZonaLesion(getZonaLesion());
        employeeAccident.setDetalleLesion(getDetalleLesion());
        employeeAccident.setTipoLesion(getTipoLesion());
        return employeeAccident;
    }

    public Long getIdEmployee() {
        return idEmployee;
    }

    public void setIdEmployee(Long idEmployee) {
        this.idEmployee = idEmployee;
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

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getZonaLesion() {
        return zonaLesion;
    }

    public void setZonaLesion(String zonaLesion) {
        this.zonaLesion = zonaLesion;
    }

    public String getDetalleLesion() {
        return detalleLesion;
    }

    public void setDetalleLesion(String detalleLesion) {
        this.detalleLesion = detalleLesion;
    }

    public String getTipoLesion() {
        return tipoLesion;
    }

    public void setTipoLesion(String tipoLesion) {
        this.tipoLesion = tipoLesion;
    }

    public void updateValues(EmployeeAccident employeeAccident) {
        employeeAccident.setTipoLesion(getTipoLesion());
        employeeAccident.setDetalleLesion(getDetalleLesion());
        employeeAccident.setZonaLesion(getZonaLesion());
    }
}
