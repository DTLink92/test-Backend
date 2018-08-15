
package com.dh.spring5webapp.model;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;

@Entity
public class AccidentCauses extends ModelBase {

    @ManyToOne(targetEntity = Accident.class)
    private Accident accident;

    @ManyToOne(targetEntity = Employee.class)
    private AccidentCause cause;

    private int status;

    public Accident getAccident() {
        return accident;
    }

    public void setAccident(Accident accident) {
        this.accident = accident;
    }

    public AccidentCause getCause() {
        return cause;
    }

    public void setCause(AccidentCause cause) {
        this.cause = cause;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
