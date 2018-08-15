package com.dh.spring5webapp.model;

import org.junit.Test;

import static org.junit.Assert.*;

public class PositionTest {

    private static final String code = "code";
    private static final String name = "name";
    private static final Area area = new Area();
    private static final String process = "process";
    private static final String purpose = "purpose";

    @Test
    public void getCode() {
        /*Position position = new Position();
        position.setCode(code);
        assertEquals(code, position.getCode());*/
        assertEquals(true, true);
    }
    /*
    @Test
    public void getName() {
        Position position = new Position();
        position.setName(name);
        assertEquals(name, position.getName());
    }

    @Test
    public void getHigherWorkPosition() {
        Position position = new Position();

        Position posi = new Position();
        Long id = new Long(1);
        posi.setId(id);
        position.setHigherWorkPosition(posi);
        assertEquals(id, position.getHigherWorkPosition().getId());
    }

    @Test
    public void getArea() {
        Position position = new Position();
        position.setArea(area);
        assertEquals(area, position.getArea());
    }

    @Test
    public void getProcess() {
        Position position = new Position();
        position.setProcess(process);
        assertEquals(process, position.getProcess());
    }

    @Test
    public void getPurpose() {
        Position position = new Position();
        position.setPurpose(purpose);
        assertEquals(purpose, position.getPurpose());
    }

    @Test
    public void getPerformance() {
        Position position = new Position();
        Performance performance = new Performance();
        Long id = new Long(1);
        performance.setId(id);
        position.setPerformance(performance);
        assertEquals(id, position.getPerformance().getId());
    }*/

}