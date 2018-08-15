package com.dh.spring5webapp.controller;

import com.dh.spring5webapp.command.AssignEquipmentCommand;
import com.dh.spring5webapp.model.Assign_Equipment;
import com.dh.spring5webapp.model.Employee;
import com.dh.spring5webapp.services.AssignEquipmentService;
import com.dh.spring5webapp.services.EmployeeService;
import com.dh.spring5webapp.services.EquipmentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;

import javax.ws.rs.*;
import javax.ws.rs.core.Response;
import java.util.ArrayList;
import java.util.List;


@Path("/assign_equipment")
@Controller
@Produces("application/json")
@CrossOrigin
public class AssignEquipmentController {
    private AssignEquipmentService service;
    private EmployeeService employeeService;
    private EquipmentService equipmentService;

    public AssignEquipmentController(AssignEquipmentService service, EmployeeService employeeService, EquipmentService equipmentService) {
        this.service = service;
        this.employeeService = employeeService;
        this.equipmentService = equipmentService;
    }

    @GET
    public Response getPositionAssignEmployees() {
        List<AssignEquipmentCommand> assignEquiList = new ArrayList<>();
        service.findAll().forEach(assignEquipment -> {
            assignEquiList.add(new AssignEquipmentCommand(assignEquipment));
        });

        return Response.ok(assignEquiList).build();
    }

    @GET
    @Path("/{id}")
    public Response getAssignEquipmentById(@PathParam("id") long id) {
        Assign_Equipment assigEq = service.findById(id);
        return Response.ok(new AssignEquipmentCommand(assigEq)).build();
    }

    @OPTIONS
    public Response prefligth() {
        return Response.ok().build();
    }

    @POST
    public Response addAssignEquipment(AssignEquipmentCommand assignEquipmentCommand) {
        Assign_Equipment assignEquipment = assignEquipmentCommand.toAssignEquipment();
        Employee employee = employeeService.findById(assignEquipmentCommand.getIdEmployee());
        assignEquipment.setEmployee(employee);

        assignEquipment = service.save(assignEquipment);

        return Response.ok(new AssignEquipmentCommand(assignEquipment)).build();

    }

    @PUT
    public Response updateAssignEquipment(AssignEquipmentCommand assignEquipmentCommand) {

        Assign_Equipment assignEquipment = service.findById(assignEquipmentCommand.getId());
        if (assignEquipmentCommand.getIdEmployee() != null){
            Employee employee = employeeService.findById(assignEquipmentCommand.getIdEmployee());
            assignEquipment.setEmployee(employee);
        }

        assignEquipmentCommand.updateValues(assignEquipment);
        assignEquipment = service.save(assignEquipment);

        return Response.ok(new AssignEquipmentCommand(assignEquipment)).build();
    }

    @DELETE
    @Path("/{id}")
    public Response deleteAssignEquipment(@PathParam("id") long id) {
        service.deleteById(id);
        return Response.ok(id).build();
    }

}
