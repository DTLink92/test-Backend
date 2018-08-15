package com.dh.spring5webapp.model;

import org.junit.Test;

import static org.junit.Assert.*;

public class EvaluationMetricTest {

    @Test
    public void getDescription() {
        EvaluationMetric metric = new EvaluationMetric();
        String description = "description";
        metric.setDescription(description);
        assertEquals(description, metric.getDescription());
    }

    @Test
    public void getValue() {
        EvaluationMetric metric = new EvaluationMetric();
        int value = 10;
        metric.setValue(value);
        assertEquals(value, metric.getValue());
    }
}