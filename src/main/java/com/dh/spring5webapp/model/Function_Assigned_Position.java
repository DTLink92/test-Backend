package com.dh.spring5webapp.model;

import javax.persistence.*;

@Entity
public class Function_Assigned_Position extends ModelBase {
    private Long position_id;
    private Long function_id;

    public Long getPosition_id() {
        return position_id;
    }

    public void setPosition_id(Long position_id) {
        this.position_id = position_id;
    }

    public Long getFunction_id() {
        return function_id;
    }

    public void setFunction_id(Long function_id) {
        this.function_id = function_id;
    }

}
