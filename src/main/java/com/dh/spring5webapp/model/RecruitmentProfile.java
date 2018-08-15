package com.dh.spring5webapp.model;

import javax.persistence.*;

@Entity
public class RecruitmentProfile extends ModelBase{
    private String requirement;
    private String description;
    private String verification;

    @OneToOne (optional = true)//(cascade = {CascadeType.ALL})
    @JoinColumn(name="position_id")
    private Position position;

    /*@OneToMany(fetch = FetchType.LAZY, mappedBy = "recruitmentProfile", cascade = CascadeType.REMOVE)
    private List<PerformanceRepository> performances = new ArrayList<>();*/

    public String getRequirement() {
        return requirement;
    }

    public void setRequirement(String requirement) {
        this.requirement = requirement;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getVerification() {
        return verification;
    }

    public void setVerification(String verification) {
        this.verification = verification;
    }

    public Position getPosition() {
        return position;
    }

    public void setPosition(Position position) {
        this.position = position;
    }

    /*public List<PerformanceRepository> getPerformances() {
        return performances;
    }

    public void setPerformances(List<PerformanceRepository> performances) {
        this.performances = performances;
    }*/
}
