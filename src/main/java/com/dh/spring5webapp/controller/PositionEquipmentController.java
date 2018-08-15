package com.dh.spring5webapp.controller;

import com.dh.spring5webapp.command.PositionEquipmentCommand;
import com.dh.spring5webapp.model.Equipment;
import com.dh.spring5webapp.model.Position;
import com.dh.spring5webapp.model.Position_Equipment;
import com.dh.spring5webapp.services.EquipmentService;
import com.dh.spring5webapp.services.PositionEquipmentService;
import com.dh.spring5webapp.services.PositionService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;

import javax.validation.constraints.NotNull;
import javax.ws.rs.*;
import javax.ws.rs.core.Response;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

@Controller
@Path("/position_equipment")
@Produces("application/json")
@CrossOrigin
public class PositionEquipmentController {
    private PositionEquipmentService service;
    private PositionService positionService;
    private EquipmentService equipmentService;

    public PositionEquipmentController(PositionEquipmentService service, PositionService positionService, EquipmentService equipmentService) {
        this.service = service;
        this.positionService = positionService;
        this.equipmentService = equipmentService;
    }

    @GET
    public Response getEmployeesAccidents() {
        List<PositionEquipmentCommand> positionEquipments = new ArrayList<>();
        service.findAll().forEach(positionEquipment -> {
            PositionEquipmentCommand positionEquipmentCommand = new PositionEquipmentCommand(positionEquipment);
            positionEquipments.add(positionEquipmentCommand);
        });

        return Response.ok(positionEquipments).build();
    }

    @GET
    @Path("/{id}")
    public Response getPositionEquipmentById(@PathParam("id") Long id) {
        Position_Equipment positionEquipment = service.findById(id);

        return Response.ok(new PositionEquipmentCommand(positionEquipment)).build();
    }

    @GET
    @Path("/position/{id}")
    public Response getDetailAssignType(@PathParam("id") @NotNull Long id) {
        List<PositionEquipmentCommand> positionEquipments = new LinkedList<>();

        service.getAllPosition(id).forEach(AssignEquipment -> {
            PositionEquipmentCommand model = new PositionEquipmentCommand(AssignEquipment);
            positionEquipments.add(model);
        });
        return Response.ok(positionEquipments).build();
    }

    @OPTIONS
    public Response prefligth() {
        return Response.ok().build();
    }

    @POST
    public Response addPositionEquipment(PositionEquipmentCommand positionEquipmentCommand) {
        Position_Equipment positionEquipment = positionEquipmentCommand.toPositionEquipment();
        Position position = positionService.findById(positionEquipmentCommand.getIdPosition());
        Equipment equipment = equipmentService.findById(positionEquipmentCommand.getIdEquipment());
        positionEquipment.setPosition(position);
        positionEquipment.setEquipment(equipment);
        positionEquipment = service.save(positionEquipment);

        Response.ResponseBuilder responseBuilder = Response.ok(new PositionEquipmentCommand(positionEquipment));
        return responseBuilder.build();
    }

    @PUT
    public Response updatePositionEquipment(PositionEquipmentCommand positionEquipmentCommand) {
        Position_Equipment positionEquipment = service.findById(positionEquipmentCommand.getId());
        if(positionEquipmentCommand.getIdPosition() != null) {
            Position position = positionService.findById(positionEquipmentCommand.getIdPosition());
            positionEquipment.setPosition(position);
        }
        if(positionEquipmentCommand.getIdEquipment() != null){
            Equipment equipment = equipmentService.findById(positionEquipmentCommand.getIdEquipment());
            positionEquipment.setEquipment(equipment);
        }

        positionEquipmentCommand.updateValues(positionEquipment);
        positionEquipment = service.save(positionEquipment);
        Response.ResponseBuilder responseBuilder = Response.ok(new PositionEquipmentCommand(positionEquipment));

        return responseBuilder.build();

    }

    @DELETE
    @Path("/{id}")
    public Response deletePositionEquipment(@PathParam("id") long id) {
        service.deleteById(id);
        return Response.ok(id).build();
    }


}
