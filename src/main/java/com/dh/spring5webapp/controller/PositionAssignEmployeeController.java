package com.dh.spring5webapp.controller;

import com.dh.spring5webapp.command.EmployeeCommand;
import com.dh.spring5webapp.command.PositionAssignEmployeeCommand;
import com.dh.spring5webapp.command.PositionCommand;
import com.dh.spring5webapp.model.Employee;
import com.dh.spring5webapp.model.Position;
import com.dh.spring5webapp.model.Project;
import com.dh.spring5webapp.model.Project_Contract;
import com.dh.spring5webapp.services.EmployeeService;
import com.dh.spring5webapp.services.PositionAssignEmployeeService;
import com.dh.spring5webapp.services.PositionService;
import com.dh.spring5webapp.services.ProjectService;
import org.glassfish.jersey.media.multipart.FormDataContentDisposition;
import org.glassfish.jersey.media.multipart.FormDataParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

@Path("/position_assign_employees")
@Produces(MediaType.APPLICATION_JSON)
@Controller
@CrossOrigin
public class PositionAssignEmployeeController {

    private PositionAssignEmployeeService service;
    private EmployeeService employeeService;
    private PositionService positionService;
    private ProjectService projectService;

    public PositionAssignEmployeeController(PositionAssignEmployeeService service, EmployeeService employeeService,
                                            PositionService positionService, ProjectService projectService) {

        this.service = service;
        this.employeeService = employeeService;
        this.positionService = positionService;
        this.projectService = projectService;
    }

    @GET
    public Response getPositionAssignEmployees() {
        List<PositionAssignEmployeeCommand> posAssEmplList = new ArrayList<>();
        service.findAll().forEach(contract -> {
            posAssEmplList.add(new PositionAssignEmployeeCommand(contract));
        });
        return Response.ok(posAssEmplList).build();
    }

    @GET
    @Path("/position={position_id}")
    public Response getEmployeesByPosition(@PathParam("position_id") Long position_id) {
        List<EmployeeCommand> employees = new ArrayList<EmployeeCommand>();
        service.findByPosition_Id(position_id).forEach(contract -> {
            employees.add(new EmployeeCommand(contract.getEmployee()));
        });
        return Response.ok(employees).build();
    }

    /*@GET
    @Path("/employee_contract={id}")
    public Response getPositionAssignEmployeesByEmployeeId(@PathParam("id") Long id) {
        Project_Contract posAssEmpl = service.findContractByEmployeeId(id);
        return Response.ok(new PositionAssignEmployeeCommand(posAssEmpl)).build();
    }*/

    @GET
    @Path("/employeeByPosition")
    public Response getEmployeesByPosition() {
        List<Object> result = service.GroupEmployeeByPosition();
        return Response.ok(result).build();
    }

    @GET
    @Path("/employeeByGenre")
    public Response getEmployeesByGenre() {
        List<Object> result = service.GroupEmployeeByGenre();
        return Response.ok(result).build();
    }

    @GET
    @Path("/employeeBySalary")
    public Response GroupEmployeeBySalary() {
        List<Object> result = service.GroupEmployeeBySalary();
        return Response.ok(result).build();
    }

    @OPTIONS
    public Response prefligth() {
        return Response.ok().build();
    }

    @POST
    public Response addPositionAssignEmployee(PositionAssignEmployeeCommand posAssEmplCommand) {
        Project_Contract posAssEmpl = posAssEmplCommand.toPositionAssignEmployee();
        Employee employee = employeeService.findById(posAssEmplCommand.getEmployeeId());
        posAssEmpl.setEmployee(employee);
        if (posAssEmplCommand.getSupervisorId() != null && posAssEmplCommand.getSupervisorId() > 0)
        {
            Employee supervisor = employeeService.findById(posAssEmplCommand.getSupervisorId());
            posAssEmpl.setSupervisor(supervisor);
        }
        if ( posAssEmplCommand.getProjectId() != null && posAssEmplCommand.getProjectId() > 0)
        {
            Project project = this.projectService.findById(posAssEmplCommand.getProjectId());
            posAssEmpl.setProject(project);
        }
        posAssEmpl.setPosition(positionService.findById(posAssEmplCommand.getPositionId()));
        posAssEmpl = service.saveContractById(posAssEmpl);
        return Response.ok(new PositionAssignEmployeeCommand(posAssEmpl)).build();
    }

    @PUT
    public Response updatePositionAssignEmployee(PositionAssignEmployeeCommand posAssEmplCommand) {
        Project_Contract posAssEmpl = service.findById(posAssEmplCommand.getId());
        Position position = positionService.findById(posAssEmplCommand.getPositionId());
        if(posAssEmplCommand.getSupervisorId() != null) {
            if(posAssEmplCommand.getSupervisorId() > 0) {
                Employee employee = employeeService.findById(posAssEmplCommand.getSupervisorId());
                posAssEmpl.setSupervisor(employee);
            }
        }
        if(posAssEmplCommand.getProjectId() != null) {
            if (posAssEmplCommand.getProjectId() > 0) {
                Project project = this.projectService.findById(posAssEmplCommand.getProjectId());
                posAssEmpl.setProject(project);
            }
        }
        posAssEmplCommand.updateValues(posAssEmpl, position);
        posAssEmpl = service.save(posAssEmpl);
        return Response.ok(new PositionAssignEmployeeCommand(posAssEmpl)).build();
    }

    @DELETE
    @Path("/{id}")
    public Response deletePositionAssignEmployee(@PathParam("id") long id) {
        service.deleteContractById(id);
        return Response.ok(id).build();
    }
}