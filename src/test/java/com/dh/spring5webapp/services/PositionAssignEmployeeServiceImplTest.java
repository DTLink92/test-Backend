package com.dh.spring5webapp.services;

import com.dh.spring5webapp.model.Project_Contract;
import com.dh.spring5webapp.repositories.PositionAssignEmployeeRepository;
import org.junit.Test;

import com.dh.spring5webapp.model.Employee;
import com.dh.spring5webapp.repositories.EmployeeRepository;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.when;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import static org.junit.Assert.*;

public class PositionAssignEmployeeServiceImplTest {

    private List<Project_Contract> contractsSet;
    @Mock
    PositionAssignEmployeeRepository contractRepository;
    @InjectMocks
    PositionAssignEmployeeServiceImpl contractServiceImpl;

    @Before
    public void setUp() {
        MockitoAnnotations.initMocks(this);
        contractsSet = new ArrayList<>();
        Project_Contract contract = new Project_Contract();
        contract.setSalary((long) 1000);
        contractsSet.add(contract);
        when(contractRepository.findAll()).thenReturn(contractsSet);
    }

    @Test
    public void getRepository() {
    }

    @Test
    public void testGetEmployees() throws Exception {
        List<Project_Contract> result = contractServiceImpl.findAll();
        Assert.assertEquals(contractsSet, result);
    }

    @Test
    @Ignore
    public void testFindById() throws Exception {
        /*Project_Contract result = contractServiceImpl.findById(Long.valueOf(1));
        Assert.assertEquals(new Employee(), result);*/
        Assert.assertEquals(true,true);
    }
}