package com.dh.spring5webapp.model;

import javax.persistence.Entity;

@Entity
public class TypeEvaluator extends ModelBase{
    private String Description;

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }
}
