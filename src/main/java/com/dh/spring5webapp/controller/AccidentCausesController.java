/*
 * @author: Juan Pablo Mejia
 */

package com.dh.spring5webapp.controller;

import com.dh.spring5webapp.command.AccidenCausesCommand;
import com.dh.spring5webapp.command.AccidentCauseCommand;
import com.dh.spring5webapp.command.EmployeeAccidentCommand;
import com.dh.spring5webapp.model.*;
import com.dh.spring5webapp.services.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;

import javax.ws.rs.*;
import javax.ws.rs.core.Response;
import java.util.ArrayList;
import java.util.List;

@Controller
@Path("/accidents_cause")
@Produces("application/json")
@CrossOrigin
public class AccidentCausesController {
    private AccidentCausesService service;
    private AccidentCauseService serviceCause;
    private AccidentService serviceAccident;


    public AccidentCausesController(AccidentCausesService service, AccidentCauseService serviceCause, AccidentService serviceAccident) {
        this.service = service;
        this.serviceCause = serviceCause;
        this.serviceAccident = serviceAccident;
    }

    @GET
    public Response getEmployeesAccidents() {
        List<AccidenCausesCommand> accidentCauses = new ArrayList<>();
        service.findAll().forEach(accidentCause -> {
            AccidenCausesCommand accidentCauseCommand = new AccidenCausesCommand(accidentCause);
            accidentCauses.add(accidentCauseCommand);
        });
        return Response.ok(accidentCauses).build();
    }

    @GET
    @Path("/{id}")
    public Response getById(@PathParam("id") long id) {
        AccidentCauses accidentCauses = service.findById(id);
        Response.ResponseBuilder responseBuilder = Response.ok(new AccidenCausesCommand(accidentCauses));
        return responseBuilder.build();
    }

    @OPTIONS
    public Response prefligth() {
        return Response.ok().build();
    }

    @POST
    public Response saveItem(AccidenCausesCommand item) {
        AccidentCauses accidentCauses = item.toDomain();
        accidentCauses.setCause(serviceCause.findById(item.getIdCause()));
        // enlace con accident
        accidentCauses.setAccident(serviceAccident.findById(item.getIdAccident()));
        AccidentCauses itemPersisted = service.save(accidentCauses);
        Response.ResponseBuilder responseBuilder = Response.ok(new AccidenCausesCommand(itemPersisted));
        return responseBuilder.build();
    }

    @PUT
    public Response updateItem(AccidenCausesCommand accidenCausesCommand) {
        AccidentCauses accidentCauses = service.findById(accidenCausesCommand.getId());
        if(accidenCausesCommand.getIdCause() != null) {
            AccidentCause cause = serviceCause.findById(accidenCausesCommand.getIdCause());
            accidentCauses.setCause(cause);
        }
        if(accidenCausesCommand.getIdAccident() != null) {
            Accident accident = serviceAccident.findById(accidenCausesCommand.getIdAccident());
            accidentCauses.setAccident(accident);
        }
        accidenCausesCommand.updateValues(accidentCauses);
        accidentCauses = service.save(accidentCauses);
        Response.ResponseBuilder responseBuilder = Response.ok(new AccidenCausesCommand(accidentCauses));
        return responseBuilder.build();
    }


    @DELETE
    @Path("/{id}")
    public void deleteItem(@PathParam("id") long id) {
        service.deleteById(id);
    }
}    