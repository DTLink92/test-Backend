/**
 * (C) Dev : Juan Pablo Mejia
 */
package com.dh.spring5webapp.command;

import com.dh.spring5webapp.controller.AreaController;
import com.dh.spring5webapp.model.Area;
import com.dh.spring5webapp.model.EmployeeAccident;
import com.dh.spring5webapp.model.ModelBase;
import com.dh.spring5webapp.model.Project;
import com.dh.spring5webapp.services.AreaService;
import com.dh.spring5webapp.services.ProjectService;

import javax.persistence.OneToOne;
import javax.sound.midi.Soundbank;

public class AreaCommand extends ModelBase {

    private String name;
    private String detail;



    public AreaCommand(){

    }

    public AreaCommand(Area area) {

        setId(area.getId());
        setVersion(area.getVersion());
        setCreatedOn(area.getCreatedOn());
        setUpdatedOn(area.getUpdatedOn());

        setName(area.getName());
        setDetail(area.getDetail());
    }

    public String getName() {
        return name;
    }

    public String getDetail() {
        return detail;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }





    public Area toDomain() {
        Area area = new Area();

        area.setId(getId());
        area.setUpdatedOn(getCreatedOn());
       // area.setVersion(getVersion());

        area.setName(getName());
        area.setDetail(getDetail());




      //  area.setProject(getProject());

        return area;
    }

    public void uptateValues(Area area) {
        area.setDetail(getDetail());
        area.setName(getName());

        // area.setProject(getProject());
//        if (getId() != area.getProject().getId()){
//
//            area.setId(getId());
//        } else {
//
//            System.out.println("Error al actualizar El ID del project ESTO NO DEBERIA PASAR" );
//        }

    }


}
