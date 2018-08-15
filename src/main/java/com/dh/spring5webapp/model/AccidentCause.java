package com.dh.spring5webapp.model;

import javax.persistence.*;
import java.util.List;

@Entity
public class AccidentCause extends ModelBase {

    private String description;
    @ManyToOne(optional = false)
    private AccidentCauseGroup accidentCauseGroup;

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public AccidentCauseGroup getAccidentCauseGroup() {
        return accidentCauseGroup;
    }

    public void setAccidentCauseGroup(AccidentCauseGroup accidentCauseGroup) {
        this.accidentCauseGroup = accidentCauseGroup;
    }
}
