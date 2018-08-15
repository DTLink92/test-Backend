package com.dh.spring5webapp.command;

import com.dh.spring5webapp.model.ManagementIndicator;
import com.dh.spring5webapp.model.ModelBase;

public class PositionManagementIndicatorCommand extends ModelBase {
    private String Competence;
    private String Criteria;

    public PositionManagementIndicatorCommand(){}

    public PositionManagementIndicatorCommand(ManagementIndicator indicator)
    {
        setId(indicator.getId());
        setVersion(indicator.getVersion());
        setCreatedOn(indicator.getCreatedOn());
        setUpdatedOn(indicator.getUpdatedOn());
        setCompetence(indicator.getCompetence());
        setCriteria(indicator.getCompetence());
    }

    public ManagementIndicator toManagementIndicator()
    {
        ManagementIndicator entity = new ManagementIndicator();

        entity.setId(getId());
        entity.setVersion(getVersion());
        entity.setCreatedOn(getCreatedOn());
        entity.setUpdatedOn(getUpdatedOn());
        entity.setCompetence(getCompetence());
        entity.setCriteria(getCriteria());

        return entity;
    }

    public String getCompetence() {
        return Competence;
    }

    public void setCompetence(String competence) {
        Competence = competence;
    }

    public String getCriteria() {
        return Criteria;
    }

    public void setCriteria(String criteria) {
        Criteria = criteria;
    }
}
