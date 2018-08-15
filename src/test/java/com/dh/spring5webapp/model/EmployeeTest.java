package com.dh.spring5webapp.model;

import org.junit.Before;
import org.junit.Test;

import java.util.Date;

import static org.junit.Assert.*;

public class EmployeeTest {

    private String name = "Jhon";
    private Employee employee;

    @Before
    public void setUp() {
        this.employee = new Employee();
    }

    @Test
    public void getFirstName() {
       this.employee.setFirst_name(name);
       assertEquals(employee.getFirst_name(), name);
    }

    @Test
    public void setFirstName() {
        this.employee.setFirst_name(name);
        assertEquals(employee.getFirst_name(), name);
    }

    @Test
    public void getLastName() {
        this.employee.setLast_name(name);
        assertEquals(employee.getLast_name(), name);
    }

    @Test
    public void setLastName() {
        this.employee.setLast_name(name);
        assertEquals(employee.getLast_name(), name);
    }

    @Test
    public void getBirthday() {
        Date testDate = new Date();
        this.employee.setBirthdate(testDate);
        assertEquals(employee.getBirthdate(), testDate);
    }

    @Test
    public void setBirthday() {
        Date testDate = new Date();
        this.employee.setBirthdate(testDate);
        assertEquals(employee.getBirthdate(), testDate);
    }

    @Test
    public void getPhoneNumber() {
        assertEquals(true, true);
    }

    @Test
    public void setPhoneNumber() {
        assertEquals(true, true);
    }

    @Test
    public void getCivilState() {
    }

    @Test
    public void setCivilState() {
    }

    @Test
    public void getDependenciesAmount() {
    }

    @Test
    public void setDependenciesAmount() {
    }

    @Test
    public void getExperience() {
    }

    @Test
    public void setExperience() {
    }

    @Test
    public void getPositions() {
    }

    @Test
    public void setPositions() {
    }

    @Test
    public void getCi() {
    }

    @Test
    public void setCi() {
    }

    @Test
    public void getProfileImage() {
    }

    @Test
    public void setProfileImage() {
    }
}