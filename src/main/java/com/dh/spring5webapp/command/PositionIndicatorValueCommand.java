package com.dh.spring5webapp.command;

import com.dh.spring5webapp.model.EvaluationMetric;
import com.dh.spring5webapp.model.IndicatorValue;
import com.dh.spring5webapp.model.ManagementIndicator;
import com.dh.spring5webapp.model.ModelBase;

public class PositionIndicatorValueCommand extends ModelBase {

    private EvaluationMetric metric;
    private Long managementIndicator;

    public PositionIndicatorValueCommand(){}

    public PositionIndicatorValueCommand(IndicatorValue score)
    {
        setId(score.getId());
        setVersion(score.getVersion());
        setCreatedOn(score.getCreatedOn());
        setUpdatedOn(score.getUpdatedOn());
        setMetric(score.getMetric());
        setManagementIndicator(score.getManagementIndicator().getId());
    }

    public IndicatorValue toIndicatorValue()
    {
        IndicatorValue entity = new IndicatorValue();
        entity.setId(getId());
        entity.setVersion(getVersion());
        entity.setCreatedOn(getCreatedOn());
        entity.setUpdatedOn(getUpdatedOn());
        entity.setMetric(getMetric());

        ManagementIndicator indicator = new ManagementIndicator();
        indicator.setId(getManagementIndicator());
        entity.setManagementIndicator(indicator);
        return entity;
    }

    public EvaluationMetric getMetric() {
        return metric;
    }

    public void setMetric(EvaluationMetric metric) {
        this.metric = metric;
    }

    public Long getManagementIndicator() {
        return managementIndicator;
    }

    public void setManagementIndicator(Long managementIndicator) {
        this.managementIndicator = managementIndicator;
    }

}