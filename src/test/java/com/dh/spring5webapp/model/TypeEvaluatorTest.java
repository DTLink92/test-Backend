package com.dh.spring5webapp.model;

import org.junit.Test;

import static org.junit.Assert.*;

public class TypeEvaluatorTest {

    private static final String description = "description";

    @Test
    public void getDescription() {
        TypeEvaluator type = new TypeEvaluator();
        type.setDescription(description);
        assertEquals(description, type.getDescription());
    }
}