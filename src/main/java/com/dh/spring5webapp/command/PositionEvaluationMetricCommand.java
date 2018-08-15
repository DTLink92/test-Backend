package com.dh.spring5webapp.command;

import com.dh.spring5webapp.model.EvaluationMetric;
import com.dh.spring5webapp.model.ModelBase;

public class PositionEvaluationMetricCommand extends ModelBase {

    private String Description;
    private int Value;

    public PositionEvaluationMetricCommand(){}

    public PositionEvaluationMetricCommand(EvaluationMetric metric)
    {
        setId(metric.getId());
        setVersion(metric.getVersion());
        setCreatedOn(metric.getCreatedOn());
        setUpdatedOn(metric.getUpdatedOn());
        setDescription(metric.getDescription());
        setValue(metric.getValue());
    }

    public EvaluationMetric toEvaluationMetric()
    {
        EvaluationMetric entity = new EvaluationMetric();

        entity.setId(getId());
        entity.setVersion(getVersion());
        entity.setCreatedOn(getCreatedOn());
        entity.setUpdatedOn(getUpdatedOn());
        entity.setDescription(getDescription());
        entity.setValue(getValue());

        return entity;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public int getValue() {
        return Value;
    }

    public void setValue(int value) {
        Value = value;
    }
}
