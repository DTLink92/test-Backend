package com.dh.spring5webapp.controller;

import com.dh.spring5webapp.command.DetailAssignEquipmentCommand;
import com.dh.spring5webapp.command.DetailAssignEquipmentNewCommand;
import com.dh.spring5webapp.model.*;
import com.dh.spring5webapp.services.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;

import javax.ws.rs.*;
import javax.ws.rs.core.Response;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;


@Path("/detail_assignEquipment")
@Controller
@Produces("application/json")
@CrossOrigin
public class DetailAssignEquipmentController {
    private DetailAssignEquipmentService service;
    private AssignEquipmentService assignEquipmentService;
    private EquipmentService equipmentService;
    private EmployeeService employeeService;

    public DetailAssignEquipmentController(DetailAssignEquipmentService service, AssignEquipmentService assignEquipmentService, EquipmentService equipmentService, EmployeeService employeeService) {
        this.service = service;
        this.assignEquipmentService = assignEquipmentService;
        this.equipmentService = equipmentService;
        this.employeeService = employeeService;
    }

    @GET
    public Response getDetailAssignEquipmet() {
        List<DetailAssignEquipmentCommand> detailAssignEquipList = new ArrayList<>();
        service.findAll().forEach(detailAssignEquipment -> {
            detailAssignEquipList.add(new DetailAssignEquipmentCommand(detailAssignEquipment));
        });

        return Response.ok(detailAssignEquipList).build();
    }

    @GET
    @Path("/{id}")
    public Response getDetailAssignEquipmentById(@PathParam("id") long id) {
        Detail_Assign_Equipment detailAssignEquipment = service.findById(id);
        return Response.ok(new DetailAssignEquipmentCommand(detailAssignEquipment)).build();
    }

    /*@GET
    @Path("/assignEquip/{id}")
    public Response getDetailAssignType(@PathParam("id") Long id) {
        List<DetailAssignEquipmentCommand> detailAssignEquipments = new LinkedList<>();

        service.getAllAssignEquip(id).forEach(Assign_Equipment -> {
            DetailAssignEquipmentCommand model = new DetailAssignEquipmentCommand(Assign_Equipment);
        detailAssignEquipments.add(model);
    });
        return Response.ok(detailAssignEquipments).build();
    }*/

    /*@GET
    @Path("/assignEquipBy/{id}")
    public Response getDetailByAssign(@PathParam("id") Long id) {
        List<DetailAssignEquipmentCommand> detailAssignEquipments = new LinkedList<>();

        service.getDetailByAssignEquip(id).forEach(Assign_Equipment -> {
            DetailAssignEquipmentCommand model = new DetailAssignEquipmentCommand(Assign_Equipment);
        detailAssignEquipments.add(model);
    });
        return Response.ok(detailAssignEquipments).build();
    }*/

    @GET
    @Path("/assignEquip/{id}")
    public Response getDetailAssignType(@PathParam("id") Long id) {
        List<DetailAssignEquipmentNewCommand> detailAssignEquipments = new LinkedList<>();

        service.getAllAssignEquip(id).forEach(AssignEquipment -> {
            DetailAssignEquipmentNewCommand model = new DetailAssignEquipmentNewCommand(AssignEquipment);
            detailAssignEquipments.add(model);
        });
        return Response.ok(detailAssignEquipments).build();
    }

    @GET
    @Path("/equipmentByAssign")
    public Response getEquipmentByAssign() {
        List<Object> result = service.GroupEquipmentByAssign();
        return Response.ok(result).build();
    }

    @GET
    @Path("/equipmentByDateAssign")
    public Response getEquipmentByDateAssign() {
        List<Object> result = service.GroupEquipmentByDateAssign();
        return Response.ok(result).build();
    }

    @OPTIONS
    public Response prefligth() {
        return Response.ok().build();
    }

    @POST
    public Response addDetailAssignEquipment(DetailAssignEquipmentCommand detailAssignEquipComand) {
        Detail_Assign_Equipment detailAssignEquipment = detailAssignEquipComand.toDetailAssignEquipment();
        Assign_Equipment assignEquipment = assignEquipmentService.findById(detailAssignEquipComand.getIdAssignEquip());
        Equipment equipment = equipmentService.findById(detailAssignEquipComand.getIdEquipment());
        detailAssignEquipment.setAssignEquipment(assignEquipment);
        detailAssignEquipment.setEquipment(equipment);

        detailAssignEquipment = service.save(detailAssignEquipment);

        return Response.ok(new DetailAssignEquipmentCommand(detailAssignEquipment)).build();

    }

    @PUT
    public Response updateDetailAssignEquipment(DetailAssignEquipmentCommand detailAssignEquipCommand) {
        Detail_Assign_Equipment detailAssignEquipment = service.findById(detailAssignEquipCommand.getId());
        if(detailAssignEquipCommand.getIdAssignEquip() != null) {
            Assign_Equipment assignEquipment = assignEquipmentService.findById(detailAssignEquipCommand.getIdAssignEquip());
            detailAssignEquipment.setAssignEquipment(assignEquipment);
        }
        if(detailAssignEquipCommand.getIdEquipment() != null) {
            Equipment equipment = equipmentService.findById(detailAssignEquipCommand.getIdEquipment());
            detailAssignEquipment.setEquipment(equipment);
        }
        detailAssignEquipCommand.updateValues(detailAssignEquipment);
        detailAssignEquipment = service.save(detailAssignEquipment);

        return Response.ok(new DetailAssignEquipmentCommand(detailAssignEquipment)).build();
    }

    @DELETE
    @Path("/{id}")
    public Response deleteDetailAssignEquipment(@PathParam("id") long id) {
        service.deleteById(id);
        return Response.ok(id).build();
    }

}
