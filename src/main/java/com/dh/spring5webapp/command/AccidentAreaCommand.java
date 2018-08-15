/**
 * (C) Dev : Juan Pablo Mejia
 */
package com.dh.spring5webapp.command;

import com.dh.spring5webapp.model.AccidentArea;
import com.dh.spring5webapp.model.Area;
import com.dh.spring5webapp.model.ModelBase;

public class AccidentAreaCommand extends ModelBase {

    private String name;
    private String detail;

    public AccidentAreaCommand(){

    }

    public AccidentAreaCommand(AccidentArea area) {

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
        area.setCreatedOn(getUpdatedOn());
        area.setUpdatedOn(getCreatedOn());
        area.setVersion(getVersion());
        area.setName(getName());
        area.setDetail(getDetail());
return area;
    }

    public void uptateValues(Area area) {
        area.setDetail(getDetail());
        area.setName(getName());


    }


}
