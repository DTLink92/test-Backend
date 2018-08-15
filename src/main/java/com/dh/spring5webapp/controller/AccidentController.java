package com.dh.spring5webapp.controller;

import com.dh.spring5webapp.command.AccidentAreaCommand;
import com.dh.spring5webapp.command.AccidentCommand;
import com.dh.spring5webapp.command.AccidentTypeCommand;
import com.dh.spring5webapp.command.AreaCommand;
import com.dh.spring5webapp.model.Accident;
import com.dh.spring5webapp.services.AccidentService;
import com.dh.spring5webapp.services.AccidentTypeService;
import com.dh.spring5webapp.services.AreaService;
import com.dh.spring5webapp.services.AreaServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.ArrayList;
import java.util.List;

@Path("/accidents")
@Produces(MediaType.APPLICATION_JSON)
@Controller
@CrossOrigin
public class AccidentController {
    private AccidentService service;
    private AccidentTypeService accidentTypeService;
    private AreaService areaService;

    public AccidentController(AccidentService service, AccidentTypeService accidentTypeService, AreaService areaService) {
        this.service = service;
        this.accidentTypeService = accidentTypeService;
        this.areaService = areaService;
    }

    @GET
    public Response getAccident() {
        List<AccidentCommand> accidentList = new ArrayList<>();
        service.findAll().forEach(accident -> {
            AccidentCommand aux = new AccidentCommand(accident);
            aux.setType(new AccidentTypeCommand(accidentTypeService.findById((long) accident.getAccidentTypeID())));
            aux.setArea(new AccidentAreaCommand(areaService.findByIdArea((long) accident.getAreaID())));
            accidentList.add(aux);
        });
        Response.ResponseBuilder responseBuilder = Response.ok(accidentList);
        return responseBuilder.build();
    }

    @GET
    @Path("/{id}")
    public AccidentCommand getAccidentById(@PathParam("id") long id) {
        Accident accident = service.findById(id);
        return new AccidentCommand(accident);
    }

    @OPTIONS
    public Response prefligth() {
        return Response.ok().build();
    }


    @POST
    public AccidentCommand saveAccident(AccidentCommand accidentCommand) {
        int accident_id = service.saveAccident(accidentCommand.toAccident());
        Accident accident = service.findById((long)accident_id);
        return new AccidentCommand(accident);
    }

    @PUT
    public AccidentCommand updateAccident(AccidentCommand accidentComand) {
        int accident_id = service.editAccident(accidentComand.toAccident());
        Accident accident = service.findById((long)accident_id);
        return new AccidentCommand(accident);
    }


    @DELETE
    @Path("/{id}")
    public void deleteAccident(@PathParam("id") long id) {
        service.deleteById(id);
    }


}
