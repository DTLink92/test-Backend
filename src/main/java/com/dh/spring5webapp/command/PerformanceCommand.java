package com.dh.spring5webapp.command;

import com.dh.spring5webapp.model.ModelBase;
import com.dh.spring5webapp.model.Performance;

import java.util.Date;

public class PerformanceCommand extends ModelBase {

    private Date registrationDate;
    private String abilities;

    private String Description;
    private boolean isImportant;

   // private String position; // referencia a  modelo Position


    public PerformanceCommand(){
        //System.out.println("ESTE PRINT ");

    }
    public PerformanceCommand(Performance performance) {

       // System.out.println("ESTE  OTROOOO PRINT ");
       // System.out.println("id"+performance.getId());
       // System.out.println("habilidad"+performance.getAbilities());

        setId(performance.getId());
        setVersion(performance.getVersion());
        setCreatedOn(performance.getCreatedOn());
        setUpdatedOn(performance.getUpdatedOn());

        setAbilities(performance.getAbilities());
        setRegistrationDate(performance.getRegistrationDate());

        setDescription(performance.getDescription());
        setImportant(performance.isImportant());
    }


    public Date getRegistrationDate() {
        return registrationDate;
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

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public boolean isImportant() {
        return isImportant;
    }

    public void setImportant(boolean important) {
        isImportant = important;
    }


    public Performance toPerformance(){

        Performance performance = new Performance();

        performance.setId(getId());
        performance.setCreatedOn(getUpdatedOn());
        performance.setUpdatedOn(getCreatedOn());
        performance.setVersion(getVersion());
        performance.setRegistrationDate(getRegistrationDate());
        performance.setAbilities(getAbilities());
        performance.setDescription(getDescription());
        performance.setImportant(isImportant());

        return  performance;

    }


    public void updateValues(Performance performance) {
        performance.setRegistrationDate(getRegistrationDate());
        performance.setAbilities(getAbilities());
        performance.setDescription(getDescription());
        performance.setImportant(isImportant());

    }


}
