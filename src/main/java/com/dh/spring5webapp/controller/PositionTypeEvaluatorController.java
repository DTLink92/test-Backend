package com.dh.spring5webapp.controller;

import com.dh.spring5webapp.command.PositionTypeEvaluatorCommand;
import com.dh.spring5webapp.model.TypeEvaluator;
import com.dh.spring5webapp.services.PositionTypeEvaluatorService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;

import javax.validation.constraints.NotNull;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.LinkedList;
import java.util.List;

@Path("/typeEvaluators")
@Produces(MediaType.APPLICATION_JSON)
@Controller
@CrossOrigin
public class PositionTypeEvaluatorController {
    private PositionTypeEvaluatorService service;

    public PositionTypeEvaluatorController(PositionTypeEvaluatorService service)
    {
        this.service = service;
    }

    @GET
    public Response getTypes() {
        List<PositionTypeEvaluatorCommand> types = new LinkedList<PositionTypeEvaluatorCommand>();
        service.findAll().forEach(type -> {
            types.add(new PositionTypeEvaluatorCommand(type));
        });
        return Response.ok(types).build();
    }

    @GET
    @Path("/{id}")
    public Response getTypeById(@PathParam("id") @NotNull String id) {
        TypeEvaluator type = service.findById(Long.valueOf(id));
        return Response.ok(new PositionTypeEvaluatorCommand(type)).build();
    }

    @OPTIONS
    public Response prefligth() {
        return Response.ok().build();
    }

    @POST
    public Response addTypeEvaluator(PositionTypeEvaluatorCommand typeCommand) {
        TypeEvaluator type = service.save(typeCommand.toTypeEvaluator());
        return Response.ok(new PositionTypeEvaluatorCommand(type)).build();
    }

    @PUT
    public Response updateTypeEvaluator(PositionTypeEvaluatorCommand typeCommand) {
        TypeEvaluator entity = service.findById(typeCommand.getId());
        entity = typeCommand.updateTypeEvaluator(entity);
        TypeEvaluator type = service.save(entity);
        return Response.ok(new PositionTypeEvaluatorCommand(type)).build();
    }

    @DELETE
    @Path("/{id}")
    public Response deleteTypeEvaluator(@PathParam("id") String id) {
        service.deleteById(Long.valueOf(id));
        return Response.ok().build();
    }
}
