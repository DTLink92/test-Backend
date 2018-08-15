
package com.dh.spring5webapp.model;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;

@Entity
public class CorrectiveMeasures extends ModelBase {

    @ManyToOne(targetEntity = Area.class)
    private Area area;

    @ManyToOne(targetEntity = Employee.class)
    private Employee supervisor;

    private String description;
    // 0 Todo , 1 Doing ,2 Done
    private int status;

    public Area getArea() {
        return area;
    }

    public void setArea(Area area) {
        this.area = area;
    }

    public Employee getSupervisor() {
        return supervisor;
    }

    public void setSupervisor(Employee supervisor) {
        this.supervisor = supervisor;
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
}
