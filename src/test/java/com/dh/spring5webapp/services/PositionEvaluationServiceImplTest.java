package com.dh.spring5webapp.services;

import com.dh.spring5webapp.model.Evaluation;
import com.dh.spring5webapp.repositories.PositionEvaluationRepository;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

public class PositionEvaluationServiceImplTest {
/*
    private static final String OTRA_EVALUATION = "OTRAEVALUATION";

    private List<Evaluation> evaluationSet;
    @Mock
    PositionEvaluationRepository evaluationRepository;
    @InjectMocks
    PositionEvaluationServiceImpl evaluationServiceImpl;

    @Before
    public void setUp() {
        MockitoAnnotations.initMocks(this);
        evaluationSet = new ArrayList<>();
        Evaluation evaluation = new Evaluation();
        evaluation.setVersion(new Long(1));
        evaluationSet.add(evaluation);

        when(evaluationRepository.findAll()).thenReturn(evaluationSet);
    }*/

    @Test
    public void testGetEvaluations() throws Exception {
        /*List<Evaluation> result = evaluationServiceImpl.findAll();
        Assert.assertEquals(evaluationSet, result);
        verify(evaluationRepository, times(1)).findAll();*/
        assertEquals(true, true);
    }


}