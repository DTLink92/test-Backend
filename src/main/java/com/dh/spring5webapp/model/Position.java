
package com.dh.spring5webapp.model;

import javax.persistence.*;
import javax.persistence.OneToOne;
import java.util.LinkedList;
import java.util.List;

@Entity
public class Position extends ModelBase {

    private String code;
    private String name;

    @OneToOne(cascade = {CascadeType.ALL})
    @JoinColumn(name="higher_work_position_id")
    private Position higher_work_position;

    @OneToOne (optional = true)
    @JoinColumn(name="area_id")
    private Area area;

    private String process;
    private String purpose;

    //@OneToOne
    //private Performance performance;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "position", cascade = CascadeType.REMOVE)
    private List<RecruitmentProfile> profiles;

    public List<RecruitmentProfile> getProfiles() {
        return profiles;
    }

    public void setProfiles(List<RecruitmentProfile> profiles) {
        this.profiles = profiles;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setName(String name) {
        this.name = name;
    }
    public String getName() {
        return name;
    }

    public Position getHigherWorkPosition() {
        return higher_work_position;
    }

    public void setHigherWorkPosition(Position higherWorkPosition) {
        higher_work_position = higherWorkPosition;
    }

    public Area getArea() {
        return area;
    }

    public void setArea(Area area) {
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

    //public Performance getPerformance() {
     //   return performance;
    //}

    //public void setPerformance(Performance performance) {
    //    this.performance = performance;
    //}
}
