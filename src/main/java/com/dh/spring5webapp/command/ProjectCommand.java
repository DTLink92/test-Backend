/**
 * (C) 2017 Agilysys NV, LLC.  All Rights Reserved.  Confidential Information of Agilysys NV, LLC.
 */
package com.dh.spring5webapp.command;

import com.dh.spring5webapp.model.Equipment;
import com.dh.spring5webapp.model.ModelBase;
import com.dh.spring5webapp.model.Project;

import java.util.Date;

public class ProjectCommand extends ModelBase {

    private String gestion;
    private String name;
    private Date estimatedDate;
    private Date deliveryDate;
    private double economicLoss;
    private double inversion;

    public ProjectCommand(Project project){
        setId(project.getId());
        setVersion(project.getVersion());
        setCreatedOn(project.getCreatedOn());
        setUpdatedOn(project.getUpdatedOn());

        setGestion(project.getGestion());
        setName(project.getName());
        setEstimatedDate(project.getEstimatedDate());
        setDeliveryDate(project.getDeliveryDate());
        setEconomicLoss(project.getEconomicLoss());
        setInversion(project.getInversion());
    }


    //@OneToMany(fetch = FetchType.LAZY, mappedBy = "equipment", cascade = CascadeType.REMOVE)
    //private List<Assign_Equipment> assignEquipments = new LinkedList<Assign_Equipment>();


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public ProjectCommand() {

    }

    public Project toDomain() {
        Project project = new Project();
        project.setGestion(getGestion());
        project.setName(getName());
//        item.setName(getName());
        return project;
    }

    public String getGestion() {
        return gestion;
    }

    public Date getEstimatedDate() {
        return estimatedDate;
    }

    public Date getDeliveryDate() {
        return deliveryDate;
    }

    public double getEconomicLoss() {
        return economicLoss;
    }

    public double getInversion() {
        return inversion;
    }

    public void setGestion(String gestion) {
        this.gestion = gestion;
    }

    public void setEstimatedDate(Date estimatedDate) {
        this.estimatedDate = estimatedDate;
    }

    public void setDeliveryDate(Date deliveryDate) {
        this.deliveryDate = deliveryDate;
    }

    public void setEconomicLoss(double economicLoss) {
        this.economicLoss = economicLoss;
    }

    public void setInversion(double inversion) {
        this.inversion = inversion;
    }

    public void updateValues(Project project) {
        project.setGestion(getGestion());
        project.setName(getName());
        project.setEstimatedDate(getEstimatedDate());
        project.setDeliveryDate(getDeliveryDate());
        project.setEconomicLoss(getEconomicLoss());
        project.setInversion(getInversion());
    }
}
