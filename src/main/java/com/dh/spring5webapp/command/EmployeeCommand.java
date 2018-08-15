/**
 * (C) 2017 Agilysys NV, LLC.  All Rights Reserved.  Confidential Information of Agilysys NV, LLC.
 */
package com.dh.spring5webapp.command;

import com.dh.spring5webapp.controller.EmployeeController;
import com.dh.spring5webapp.model.Employee;
import com.dh.spring5webapp.model.ModelBase;
import com.dh.spring5webapp.model.Project_Contract;
import com.dh.spring5webapp.repositories.EmployeeRepository;
import com.dh.spring5webapp.services.EmployeeService;
import com.dh.spring5webapp.services.EmployeeServiceImpl;
import com.dh.spring5webapp.services.PositionAssignEmployeeService;

import java.util.Date;
import java.util.List;

public class EmployeeCommand extends ModelBase {

    private String firstName;
    private String lastName;
    private Long ci;
    //private string position;
    private String positionName;
    private String supervisorName;
    private String description;
    private Date initDate;
    private Date finishDate;
    private String projectName;

    public String getPositionName() {
        return positionName;
    }

    public void setPositionName(String positionName) {
        this.positionName = positionName;
    }

    public String getSupervisorName() {
        return supervisorName;
    }

    public void setSupervisorName(String supervisorName) {
        this.supervisorName = supervisorName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getInitDate() {
        return initDate;
    }

    public void setInitDate(Date initDate) {
        this.initDate = initDate;
    }

    public Date getFinishDate() {
        return finishDate;
    }

    public void setFinishDate(Date finishDate) {
        this.finishDate = finishDate;
    }

    public EmployeeCommand(Employee employee) {
        setId(employee.getId());
        setFirstName( employee.getFirst_name());
        setLastName(employee.getLast_name());
        setCi(employee.getCi());
        List<Project_Contract> positions = employee.getPositions();
        if(positions != null) {
            if(positions.size() > 0) {
                positions.forEach(position -> {
                    setDescription(position.getContract_description());
                    setInitDate(position.getHire_date());
                    setFinishDate(position.getEnd_date());
                    setPositionName(position.getPosition().getName());
                    if(position.getSupervisor() != null) {
                        setSupervisorName(position.getSupervisor().getFirst_name());
                    }
                    if(position.getProject() != null) {
                        setProjectName(position.getProject().getName());
                    }
                });
            }
        }
    }

    public EmployeeCommand() {
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Long getCi() {
        return ci;
    }

    public void setCi(Long ci) {
        this.ci = ci;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }
}
