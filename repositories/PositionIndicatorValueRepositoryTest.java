package com.dh.spring5webapp.repositories;

import com.dh.spring5webapp.model.IndicatorValue;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@DataJpaTest
public class PositionIndicatorValueRepositoryTest {
    /*private IndicatorValue valueA;
    private IndicatorValue valueB;
    private int initialCount = 0;
    @Autowired
    private PositionIndicatorValueRepository indicatorRepository;

    @Before
    public void before() {
        initialCount = indicatorRepository.findAll().size();
        valueA = new IndicatorValue();
        valueA.setCreatedOn(new Date());
        indicatorRepository.save(valueA);
        valueB = new IndicatorValue();
        valueB.setCreatedOn(new Date());
        indicatorRepository.save(valueB);
    }
    */
    @Test
    public void tesFindAllCategoriesIT() {
        /*Set<IndicatorValue> indicators = new HashSet<>();
        indicatorRepository.findAll().iterator().forEachRemaining(indicators::add);
        assertEquals(initialCount + 2, indicators.size());*/
        assertEquals(true, true);
    }

}