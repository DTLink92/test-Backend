package com.dh.spring5webapp.controller;

import com.dh.spring5webapp.command.AccidentCauseCommand;
import com.dh.spring5webapp.model.AccidentCause;
import com.dh.spring5webapp.services.AccidentCauseGroupService;
import com.dh.spring5webapp.services.AccidentCauseService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.ArrayList;
import java.util.List;
@Path("/accidentCauseController")
@Produces(MediaType.APPLICATION_JSON)
@Controller
@CrossOrigin
public class AccidentCauseController {
    private AccidentCauseService accidentCauseService;
    private AccidentCauseGroupService groupService;

    public AccidentCauseController(AccidentCauseService accidentCauseService
            , AccidentCauseGroupService groupService) {
        this.accidentCauseService = accidentCauseService;
        this.groupService = groupService;
    }
    @GET
    public Response getAccident() {
        List<AccidentCauseCommand> accidentCauseList = new ArrayList<>();
        accidentCauseService.findAll().forEach(accidentCause -> {
            accidentCauseList.add(new AccidentCauseCommand(accidentCause));
        });
        Response.ResponseBuilder responseBuilder = Response.ok(accidentCauseList);
        //addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @GET
    @Path("/{id}")
    public AccidentCauseCommand getAccidentById(@PathParam("id") long id) {

        AccidentCause accidentCause = accidentCauseService.findById(id);
        return new AccidentCauseCommand(accidentCause);
    }
    @OPTIONS
    public Response prefligth() {
        return Response.ok().build();
    }

    @POST
    public AccidentCauseCommand saveAccident(AccidentCauseCommand  accidentCommand) {
        AccidentCause cause = accidentCommand.toAccidentCause();
        cause.setAccidentCauseGroup(groupService.findById(accidentCommand.getIdGroup()));
        AccidentCause accidentCause = accidentCauseService.save(cause);
        return new AccidentCauseCommand(accidentCause);

    }
    @DELETE
    @Path("/{id}")
    public void deleteAccidentCause(@PathParam("id") long id) {
        accidentCauseService.deleteById(id);
    }

    private void addCorsHeader(Response.ResponseBuilder responseBuilder) {
        responseBuilder.header("Access-Control-Allow-Origin", "*")
                .header("Access-Control-Allow-Credentials", "true")
                .header("Access-Control-Allow-Methods", "GET, POST, DELETE, PUT")
                .header("Access-Control-Allow-Headers",
                        "Access-Control-Allow-Credentials, Access-Control-Allow-Headers, Origin, Accept, Authorization, X-Requested-With, Content-Type, Access-Control-Request-Method, Access-Control-Request-Headers");
    }

}
