package com.dh.spring5webapp.model;

import javax.persistence.*;
import java.util.List;

@Entity
public class Evaluation extends ModelBase{

    @OneToOne(optional = false)
    private Employee Evaluated;

    @OneToOne(optional = false)
    private Employee Evaluator;

    @OneToOne(optional = false)
    private TypeEvaluator Type;

    @OneToMany (targetEntity = IndicatorValue.class)
    private List<IndicatorValue> indicatorValues;

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
