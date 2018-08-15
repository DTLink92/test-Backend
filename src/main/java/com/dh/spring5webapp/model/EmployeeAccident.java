
package com.dh.spring5webapp.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

import javax.persistence.*;
import java.util.Date;

@Entity
public class EmployeeAccident { //extends ModelBase {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne(targetEntity = Employee.class)
    private Employee employee;

    @ManyToOne(targetEntity = Accident.class)
    private Accident accident;

    private String zonaLesion;
    private String detalleLesion;
    private String tipoLesion;

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
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


    public Accident getAccident() {
        return accident;
    }

    public void setAccident(Accident accident) {
        this.accident = accident;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
