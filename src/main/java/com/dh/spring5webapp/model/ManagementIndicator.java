package com.dh.spring5webapp.model;

import javax.persistence.*;
import java.util.List;

@Entity
public class ManagementIndicator extends ModelBase {

    private String Competence;
    private String Criteria;

    public String getCompetence() {
        return Competence;
    }

    public void setCompetence(String competence) {
        Competence = competence;
    }

    public String getCriteria() {
        return Criteria;
    }

    public void setCriteria(String criteria) {
        Criteria = criteria;
    }
}
