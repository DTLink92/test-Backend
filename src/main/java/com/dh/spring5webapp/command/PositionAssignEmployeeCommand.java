package com.dh.spring5webapp.command;

import com.dh.spring5webapp.model.*;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Currency;
import java.util.Date;

public class PositionAssignEmployeeCommand extends ModelBase {

    DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
    DateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
    private String description;
    private String initDate;
    private String finishDate;
    private Long employeeId;
    private Long positionId;
    private Long supervisorId;
    private Long salary;
    //Employee Fields
    private String employeeFirstName;
    private String employeeLastName;
    private Long employeeCi;
    //Position fields
    private String positionName;
    private Long projectId;

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getInitDate() {
        return initDate;
    }

    public void setInitDate(String initDate) {
        this.initDate = initDate;
    }

    public String getFinishDate() {
        return finishDate;
    }

    public void setFinishDate(String finishDate) {
        this.finishDate = finishDate;
    }

    public PositionAssignEmployeeCommand(Project_Contract positionAssignEmployee) {
        setSalary(positionAssignEmployee.getSalary());
        setId(positionAssignEmployee.getId());
        setCreatedOn(positionAssignEmployee.getCreated_on());
        setUpdatedOn(positionAssignEmployee.getUpdated_on());
        initDate = df.format(positionAssignEmployee.getHire_date());
        finishDate = df.format(positionAssignEmployee.getEnd_date());
        description = positionAssignEmployee.getContract_description();
        if (positionAssignEmployee.getEmployee() != null)
        {
            setEmployeeId(positionAssignEmployee.getEmployee().getId());
            Employee employee = positionAssignEmployee.getEmployee();
            setEmployeeCi(employee.getCi());
            setEmployeeFirstName(employee.getFirst_name());
            setEmployeeLastName(employee.getLast_name());
        }
        if(positionAssignEmployee.getPosition() != null) {

            setPositionId(positionAssignEmployee.getPosition().getId());
            Position position = positionAssignEmployee.getPosition();
            setPositionName(position.getName());
        }
        if (toPositionAssignEmployee().getSupervisor() != null)
        {
            setSupervisorId(toPositionAssignEmployee().getSupervisor().getId());
        }
        if (toPositionAssignEmployee().getProject() != null)
        {
            setProjectId(toPositionAssignEmployee().getProject().getId());
        }
    }

    public PositionAssignEmployeeCommand()
    {

    }

    public Project_Contract toPositionAssignEmployee() {
        Project_Contract positionAssignEmployee = new Project_Contract();
        positionAssignEmployee.setContract_description(getDescription());
        try {
            positionAssignEmployee.setEnd_date(inputFormat.parse(getFinishDate()));
            positionAssignEmployee.setHire_date(inputFormat.parse(getInitDate()));
        } catch (Exception e)
        {

        }
        positionAssignEmployee.setSalary(getSalary());
        return positionAssignEmployee;
    }

    public Long getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Long employeeId) {
        this.employeeId = employeeId;
    }

    public Long getPositionId() {
        return positionId;
    }

    public void setPositionId(Long positionId) {
        this.positionId = positionId;
    }

    public void updateValues(Project_Contract posAssEmpl, Position position) {
        posAssEmpl.setContract_description(getDescription());
        posAssEmpl.setSalary(getSalary());
        try {
            posAssEmpl.setEnd_date(inputFormat.parse(getFinishDate()));
            posAssEmpl.setHire_date(inputFormat.parse(getInitDate()));
        } catch (Exception e)
        {

        }
        posAssEmpl.setPosition(position);
    }

    public Long getSupervisorId() {
        return supervisorId;
    }

    public void setSupervisorId(Long supervisorId) {
        this.supervisorId = supervisorId;
    }

    public String getEmployeeFirstName() {
        return employeeFirstName;
    }

    public void setEmployeeFirstName(String employeeFirstName) {
        this.employeeFirstName = employeeFirstName;
    }

    public String getEmployeeLastName() {
        return employeeLastName;
    }

    public void setEmployeeLastName(String employeeLastName) {
        this.employeeLastName = employeeLastName;
    }

    public Long getEmployeeCi() {
        return employeeCi;
    }

    public void setEmployeeCi(Long employeeCi) {
        this.employeeCi = employeeCi;
    }

    public String getPositionName() {
        return positionName;
    }

    public void setPositionName(String positionName) {
        this.positionName = positionName;
    }

    public Long getSalary() {
        return salary;
    }

    public void setSalary(Long salary) {
        this.salary = salary;
    }

    public Long getProjectId() {
        return projectId;
    }

    public void setProjectId(Long projectId) {
        this.projectId = projectId;
    }
}
