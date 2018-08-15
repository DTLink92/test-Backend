package com.dh.spring5webapp.command;

import com.dh.spring5webapp.model.Area;
import com.dh.spring5webapp.model.ModelBase;
import com.dh.spring5webapp.model.Performance;
import com.dh.spring5webapp.model.Position;

import java.util.LinkedList;
import java.util.List;

public class PositionCommand extends ModelBase {
    private String code;
    private String name;
    private Long higherWorkPosition;
    private Long area;
    private String process;
    private String purpose;
    private List<String> profilesName;
    private String areaName;
    private String performanceName;
    private Long performanceId;
    private String performanceAbility;

    public PositionCommand()
    {}
    public PositionCommand(Position position) {
        setId(position.getId());
        setVersion(position.getVersion());
        setCreatedOn(position.getCreatedOn());
        setUpdatedOn(position.getUpdatedOn());
        setCode(position.getCode());
        setName(position.getName());
        if (position.getHigherWorkPosition() != null){
            setHigherWorkPosition(position.getHigherWorkPosition().getId());
        }else{
            setHigherWorkPosition(new Long(0));
        }
        if(position.getArea()!=null) {
            setArea(position.getArea().getId());
        }else{
            setArea(new Area().getId());
        }
        setProcess(position.getProcess());
        setPurpose(position.getPurpose());
        setProfilesName(new LinkedList<String>());
        //if(position.getPerformance()!=null) {
        //    setPerformanceName(position.getPerformance().getDescription());
        //    setPerformanceId(position.getPerformance().getId());
        //    setPerformanceAbility(position.getPerformance().getAbilities());
        //}
    }

    public Position toPosition() {
        Position position = new Position();
        position.setId(getId());
        position.setVersion(1);
        position.setCreatedOn(getCreatedOn());
        position.setUpdatedOn(getUpdatedOn());
        position.setCode(getCode());
        position.setName(getName());

        Position higher = new Position();
        higher.setId(getHigherWorkPosition());
        position.setHigherWorkPosition(higher);

        Area areaEntity= new Area();
        areaEntity.setId(getArea());
        position.setArea(areaEntity);
        position.setProcess(getProcess());
        position.setPurpose(getPurpose());
        position.setCreatedBy(1);
        position.setModifiedBy(1);
        //position.setPerformance(getPerformance());

        return position;
    }

    public Position UpdatePosition(Position pos)
    {
        if(getCode() != null)
            pos.setCode(getCode());

        if(getName() != null)
            pos.setName(getName());

        if(getHigherWorkPosition() != null) {
            Position higher = new Position();
            higher.setId(getHigherWorkPosition());
            pos.setHigherWorkPosition(higher);
        }

        if(getArea() != null) {
            Area areaEntity = new Area();
            areaEntity.setId(getArea());
            pos.setArea(areaEntity);
        }

        if(getProcess() != null)
            pos.setProcess(getProcess());

        if(getPurpose() != null)
            pos.setPurpose(getPurpose());
        //if(getPerformance()!= null)
        //    pos.setPerformance(getPerformance());

        return pos;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getHigherWorkPosition() {
        return this.higherWorkPosition;
    }

    public void setHigherWorkPosition(Long higherWorkPositionId) {
        this.higherWorkPosition = higherWorkPositionId;
    }

    public Long getArea() {
        return area;
    }

    public void setArea(Long area) {
        this.area = area;
    }

    public String getProcess() {
        return process;
    }

    public void setProcess(String process) {
        this.process = process;
    }

    public String getPurpose() {
        return purpose;
    }

    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }

    public List<String> getProfilesName() {
        return profilesName;
    }

    public void setProfilesName(List<String> profilesName) {
        this.profilesName = profilesName;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }


    public String getPerformanceName() {
        return performanceName;
    }

    public void setPerformanceName(String performanceName) {
        this.performanceName = performanceName;
    }

    public Long getPerformanceId() {
        return performanceId;
    }

    public void setPerformanceId(Long performanceId) {
        this.performanceId = performanceId;
    }

    public String getPerformanceAbility() {
        return performanceAbility;
    }

    public void setPerformanceAbility(String performanceAbility) {
        this.performanceAbility = performanceAbility;
    }
}
