package com.dh.spring5webapp.services;

import com.dh.spring5webapp.command.PositionAssignEmployeeCommand;
import com.dh.spring5webapp.model.Employee;
import com.dh.spring5webapp.model.Project;
import com.dh.spring5webapp.model.Project_Contract;

import java.util.Date;
import java.util.List;

public interface PositionAssignEmployeeService extends GenericService<Project_Contract> {
    public List<Project_Contract>  findByPosition_Id(Long id);
    public List<Object> GroupEmployeeByPosition();
    public List<Object> GroupEmployeeByGenre();
    public List<Object> GroupEmployeeBySalary();
    public void deleteContractById(Long id);
    public Project_Contract saveContractById(Project_Contract pc);
}
