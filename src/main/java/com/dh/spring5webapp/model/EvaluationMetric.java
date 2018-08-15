package com.dh.spring5webapp.model;

import javax.persistence.Entity;

@Entity
public class EvaluationMetric extends ModelBase{
    private String Description;
    private int Value;

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
