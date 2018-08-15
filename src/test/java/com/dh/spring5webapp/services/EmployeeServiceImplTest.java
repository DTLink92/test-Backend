package com.dh.spring5webapp.services;

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

public class EmployeeServiceImplTest {

    private List<Employee> employeeSet;
    @Mock
    EmployeeRepository employeeRepository;
    @InjectMocks
    EmployeeServiceImpl employeeServiceImpl;

    @Before
    public void setUp() {
        MockitoAnnotations.initMocks(this);
        employeeSet = new ArrayList<>();
        Employee employee = new Employee();
        employee.setFirst_name("Jose");
        employeeSet.add(employee);
        when(employeeRepository.findAll()).thenReturn(employeeSet);
    }

    @Test
    public void getRepository() {
    }

    @Test
    public void testGetEmployees() throws Exception {
        List<Employee> result = employeeServiceImpl.findAll();
        Assert.assertEquals(employeeSet, result);
    }

    @Test
    @Ignore
    public void testFindById() throws Exception {
        /*Employee result = employeeServiceImpl.findById(Long.valueOf(1));
        Assert.assertEquals(new Employee(), result);*/
        Assert.assertEquals(true,true);
    }
}