package com.dh.spring5webapp.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import java.util.List;

@Entity
public class AccidentCauseGroup extends ModelBase {
    private String title;
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "accidentCauseGroup")
    private List<AccidentCause> accidentCause;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public List<AccidentCause> getAccidentCause() {
        return accidentCause;
    }

    public void setAccidentCause(List<AccidentCause> accidentCause) {
        this.accidentCause = accidentCause;
    }
}
