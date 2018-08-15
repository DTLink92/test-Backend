package com.dh.spring5webapp.model;
import javax.persistence.*;

@Entity
public class Function extends ModelBase {
    private String Description;
    private String Frecuency;
    private String Contribution;
    private boolean Is_important;

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public String getFrecuency() {
        return Frecuency;
    }

    public void setFrecuency(String frecuency) {
        Frecuency = frecuency;
    }

    public String getContribution() {
        return Contribution;
    }

    public void setContribution(String contribution) {
        Contribution = contribution;
    }

    public boolean isIs_important() {
        return Is_important;
    }

    public void setIs_important(boolean is_important) {
        Is_important = is_important;
    }
}
