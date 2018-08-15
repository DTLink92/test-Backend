package com.dh.spring5webapp.model;

import org.junit.Test;

import static org.junit.Assert.*;

public class ManagementIndicatorTest {

    @Test
    public void getCompetence() {
        ManagementIndicator indicator = new ManagementIndicator();
        String competence = "competence";
        indicator.setCompetence(competence);
        assertEquals(competence, indicator.getCompetence());
    }

    @Test
    public void getCriteria() {
        ManagementIndicator indicator = new ManagementIndicator();
        String criteria = "criteria";
        indicator.setCriteria(criteria);
        assertEquals(criteria, indicator.getCriteria());
    }
}