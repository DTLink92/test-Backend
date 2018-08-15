package com.dh.spring5webapp.command;

import com.dh.spring5webapp.model.ModelBase;
import com.dh.spring5webapp.model.TypeEvaluator;

public class PositionTypeEvaluatorCommand extends ModelBase {

    private String Description;

    public PositionTypeEvaluatorCommand()
    {}

    public PositionTypeEvaluatorCommand(TypeEvaluator type)
    {
        setId(type.getId());
        setVersion(type.getVersion());
        setCreatedOn(type.getCreatedOn());
        setUpdatedOn(type.getUpdatedOn());
        setDescription(type.getDescription());
    }

    public TypeEvaluator toTypeEvaluator()
    {
        TypeEvaluator entity =  new TypeEvaluator();
        entity.setId(getId());
        entity.setVersion(getVersion());
        entity.setCreatedOn(getCreatedOn());
        entity.setUpdatedOn(getUpdatedOn());
        entity.setDescription(getDescription());
        return entity;
    }

    public TypeEvaluator updateTypeEvaluator (TypeEvaluator entity)
    {
        entity.setDescription(this.getDescription());
        return entity;
    }
    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

}
