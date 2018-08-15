package com.dh.spring5webapp.controller;

import com.dh.spring5webapp.command.AccidentTypeCommand;
import com.dh.spring5webapp.model.AccidentType;
import com.dh.spring5webapp.services.AccidentTypeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.ArrayList;
import java.util.List;

@Path("/accidentTypes")
@Produces(MediaType.APPLICATION_JSON)
@Controller
@CrossOrigin
public class AccidentTypeController {
    private AccidentTypeService accidentTypeService;

    public AccidentTypeController(AccidentTypeService accidentTypeService) {
        this.accidentTypeService = accidentTypeService;
    }

    @GET
    public Response getAccidentType() {
        List<AccidentTypeCommand> accidentTypeList = new ArrayList<>();
        accidentTypeService.findAll().forEach(accidentType -> {
          accidentTypeList.add(new AccidentTypeCommand(accidentType));
        });
        Response.ResponseBuilder responseBuilder = Response.ok(accidentTypeList);
        return responseBuilder.build();
    }
    @GET
    @Path("/{id}")
    public AccidentTypeCommand getAccidentById(@PathParam("id") long id) {

        AccidentType accidentType = accidentTypeService.findById(id);
        return new AccidentTypeCommand(accidentType);
    }
    @OPTIONS
    public Response prefligth() {
        Response.ResponseBuilder responseBuilder = Response.ok();
       // addCorsHeader(responseBuilder);
        responseBuilder.allow("OPTIONS").build();
        return responseBuilder.build();
    }
}
