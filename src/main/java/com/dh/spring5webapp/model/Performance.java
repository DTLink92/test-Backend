package com.dh.spring5webapp.model;

import javax.persistence.*;
import java.util.Date;

@Entity
public class Performance extends ModelBase{
    private String Description;
    private boolean isImportant;

    private Date registrationDate;  // fecha de registro
    private String abilities; // habilidades.

    //@OneToOne(optional = false, fetch = FetchType.LAZY, mappedBy = "performance")
    //private Position position; // referencia a  modelo Position

    public boolean isImportant() {
        return isImportant;
    }

    public void setImportant(boolean important) {
        this.isImportant = important;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public void setRegistrationDate(Date registrationDate) {
        this.registrationDate = registrationDate;
    }

    public String getAbilities() {
        return abilities;
    }

    public void setAbilities(String abilities) {
        this.abilities = abilities;
    }

    public Date getRegistrationDate() {
        return registrationDate;
    }

    /*public Position getPosition() {
        return position;
    }

    public void setPosition(Position position) {
        this.position = position;
    }
*/
}
