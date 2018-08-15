/**
 * @author: edson
 */

package com.dh.spring5webapp.controller;

import com.dh.spring5webapp.command.EmployeeAccidentCommand;
import com.dh.spring5webapp.command.EmployeeCommand;
import com.dh.spring5webapp.command.EmployeeDetailedCommand;
import com.dh.spring5webapp.model.Employee;
import com.dh.spring5webapp.model.EmployeeAccident;
import com.dh.spring5webapp.model.Project;
import com.dh.spring5webapp.model.Project_Contract;
import com.dh.spring5webapp.services.EmployeeService;
import com.dh.spring5webapp.services.PositionAssignEmployeeService;
import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.CrossOrigin;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.ArrayList;
import java.util.List;

@Path("/employees")
@Produces(MediaType.APPLICATION_JSON)
@Controller
@CrossOrigin
public class EmployeeController {
    private EmployeeService service;
    private PositionAssignEmployeeService contractService;

    public EmployeeController(EmployeeService service, PositionAssignEmployeeService contractService)
    {
        this.service = service;
        this.contractService = contractService;
    }

    @GET
    public Response getEmployees() {
        List<EmployeeCommand> employeeList = new ArrayList<>();
        service.findAll().forEach(employee -> {
            employeeList.add(new EmployeeCommand(employee));
        });
        return Response.ok(employeeList).build();
    }

    @GET
    @Path("/{id}")
    public Response getEmployeeById(@PathParam("id") long id) {
        Employee employee = service.findById(id);
        return Response.ok(new EmployeeDetailedCommand(employee)).build();
    }

    @OPTIONS
    public Response prefligth() {
        return Response.ok().build();
    }

    @POST
    public Response addEmployee(EmployeeDetailedCommand employeeCommand) {
        Employee employee = service.saveEmployeeById(employeeCommand.toEmployee());
        return Response.ok(new EmployeeDetailedCommand(employee)).build();
    }

    @PUT
    public Response updateEmployee(EmployeeDetailedCommand employeeCommand) {
        Employee employee = service.findById(employeeCommand.getId());
        employeeCommand.updateValues(employee);
        employee = service.save(employee);
        return Response.ok(new EmployeeDetailedCommand(employee)).build();
    }

    @DELETE
    @Path("/{id}")
    public Response deleteEmployee(@PathParam("id") long id) {
        service.deleteEmployeeById(id);
        return Response.ok(id).build();
    }
}