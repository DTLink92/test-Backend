package com.dh.spring5webapp.command;

import com.dh.spring5webapp.model.*;

import java.util.List;

public class PositionEntityCommand extends ModelBase {

    private Employee Evaluated;
    private Employee Evaluator;
    private TypeEvaluator Type;
    private List<IndicatorValue> indicatorValues;

    public PositionEntityCommand(Evaluation evaluation)
    {
        setId(evaluation.getId());
        setVersion(evaluation.getVersion());
        setCreatedOn(evaluation.getCreatedOn());
        setUpdatedOn(evaluation.getUpdatedOn());
        setEvaluated(evaluation.getEvaluated());
        setEvaluator(evaluation.getEvaluator());
        setType(evaluation.getType());
        setIndicatorValues(evaluation.getIndicatorValues());
    }

    public Evaluation toEvaluation()
    {
        Evaluation entity = new Evaluation();
        entity.setId(getId());
        entity.setVersion(getVersion());
        entity.setCreatedOn(getCreatedOn());
        entity.setUpdatedOn(getUpdatedOn());
        entity.setEvaluated(getEvaluated());
        entity.setEvaluator(getEvaluator());
        entity.setType(getType());
        entity.setIndicatorValues(getIndicatorValues());
        return entity;
    }

    public Employee getEvaluated() {
        return Evaluated;
    }

    public void setEvaluated(Employee evaluated) {
        Evaluated = evaluated;
    }

    public Employee getEvaluator() {
        return Evaluator;
    }

    public void setEvaluator(Employee evaluator) {
        Evaluator = evaluator;
    }

    public TypeEvaluator getType() {
        return Type;
    }

    public void setType(TypeEvaluator type) {
        Type = type;
    }


    public List<IndicatorValue> getIndicatorValues() {
        return indicatorValues;
    }

    public void setIndicatorValues(List<IndicatorValue> indicatorValues) {
        this.indicatorValues = indicatorValues;
    }
}
