package com.dh.spring5webapp.controller;

import com.dh.spring5webapp.command.AccidentCauseGroupCommand;
import com.dh.spring5webapp.model.AccidentCauseGroup;
import com.dh.spring5webapp.services.AccidentCauseGroupService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.ArrayList;
import java.util.List;

@Path("/accidentCauseGroup")
@Produces(MediaType.APPLICATION_JSON)
@Controller
@CrossOrigin
public class AccidentCauseGroupController {
    private AccidentCauseGroupService service;


    public AccidentCauseGroupController(AccidentCauseGroupService service) {
        this.service = service;
    }

    @GET
    public Response getAccidentCauseGroup() {
        List<AccidentCauseGroupCommand> accidentCauseGroupCommandList = new ArrayList<>();
        service.findAll().forEach(accidentCauseGroup -> {
            accidentCauseGroupCommandList.add(new AccidentCauseGroupCommand(accidentCauseGroup));
        });
        Response.ResponseBuilder responseBuilder = Response.ok(accidentCauseGroupCommandList);
        //addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @GET
    @Path("/{id}")
    public AccidentCauseGroupCommand getAccidentById(@PathParam("id") long id) {

        AccidentCauseGroup accidentCauseGroup = service.findById(id);
        return new AccidentCauseGroupCommand(accidentCauseGroup);
    }
    @OPTIONS
    public Response prefligth() {
        return Response.ok().build();
    }


    @POST
    public AccidentCauseGroupCommand saveAccident(AccidentCauseGroupCommand accidentCommand) {
        AccidentCauseGroup accidentCauseGroup =service.save( accidentCommand.toAccidentCauseGroup());
        return new AccidentCauseGroupCommand(accidentCauseGroup);

    }

    @DELETE
    @Path("/{id}")
    public void deleteAccident(@PathParam("id") long id) {
        service.deleteById(id);
    }

    private void addCorsHeader(Response.ResponseBuilder responseBuilder) {
        responseBuilder.header("Access-Control-Allow-Origin", "*")
                .header("Access-Control-Allow-Credentials", "true")
                .header("Access-Control-Allow-Methods", "GET, POST, DELETE, PUT")
                .header("Access-Control-Allow-Headers",
                        "Access-Control-Allow-Credentials, Access-Control-Allow-Headers, Origin, Accept, Authorization, X-Requested-With, Content-Type, Access-Control-Request-Method, Access-Control-Request-Headers");
    }
}
