package com.dh.spring5webapp.repositories;

import com.dh.spring5webapp.command.PositionAssignEmployeeCommand;
import com.dh.spring5webapp.model.Employee;
import com.dh.spring5webapp.model.Project_Contract;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.Date;
import java.util.List;

public interface PositionAssignEmployeeRepository extends CrudRepository<Project_Contract, Long> {
    public List<Project_Contract> findByPosition_Id(Long id);
}
