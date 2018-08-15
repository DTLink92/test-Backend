package com.dh.spring5webapp.model;

import org.junit.Test;

import static org.junit.Assert.*;

public class IndicatorValueTest {

    @Test
    public void getMetric() {
        IndicatorValue indicator = new IndicatorValue();
        Long id = new Long(1);
        EvaluationMetric metric = new EvaluationMetric();
        metric.setId(id);
        indicator.setMetric(metric);
        assertEquals(id, indicator.getMetric().getId());
    }

    @Test
    public void getManagementIndicator() {
        IndicatorValue indicator = new IndicatorValue();
        Long id = new Long(1);
        ManagementIndicator descripInd = new ManagementIndicator();
        descripInd.setId(id);
        indicator.setManagementIndicator(descripInd);
        assertEquals(id, indicator.getManagementIndicator().getId());
    }
}