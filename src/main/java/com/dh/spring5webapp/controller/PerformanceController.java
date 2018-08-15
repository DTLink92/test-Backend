package com.dh.spring5webapp.controller;


import com.dh.spring5webapp.command.PerformanceCommand;
import com.dh.spring5webapp.model.Performance;
import com.dh.spring5webapp.services.PerformanceService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import sun.print.resources.serviceui;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.ArrayList;
import java.util.List;

@Path("/performances")
@Produces(MediaType.APPLICATION_JSON)
@Controller
@CrossOrigin
public class PerformanceController {
    private PerformanceService performanceService;


    public PerformanceController(PerformanceService performanceService) {
        this.performanceService = performanceService;
    }

    @GET
    public Response getPerformances(){
        List<PerformanceCommand> performanceCommandList = new ArrayList<>();
        performanceService.findAll().forEach(performance -> { performanceCommandList.add(new PerformanceCommand(performance));
        });
        Response.ResponseBuilder responseBuilder = Response.ok(performanceCommandList);
        addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }


    @OPTIONS
    public Response prefligth() {
        Response.ResponseBuilder responseBuilder = Response.ok();
        addCorsHeader(responseBuilder);
        responseBuilder.allow("OPTIONS").build();
        return responseBuilder.build();
    }


    @POST
    public  PerformanceCommand addPerformance(PerformanceCommand performanceCommand){
        Performance performance = performanceService.save(performanceCommand.toPerformance());
        return  new PerformanceCommand(performance);

    }

    @PUT
    public Response updatePerformance(PerformanceCommand performanceCommand) {
        Performance performance = performanceService.findById(performanceCommand.getId());
        performanceCommand.updateValues(performance);
        performanceService.save(performance);
        Response.ResponseBuilder responseBuilder = Response.ok(new PerformanceCommand(performance));
        addCorsHeader(responseBuilder);
        return responseBuilder.build();

    }

    @GET
    @Path("/{id}")
    public PerformanceCommand getPerformanceById(@PathParam("id") Long id) {
        Performance performance = performanceService.findById(id);
        return new PerformanceCommand(performance);
    }

    @DELETE
    @Path("/{id}")
    public void deletePerformance(@PathParam("id") long id) {
        performanceService.deleteById(id);
    }


    private void addCorsHeader(Response.ResponseBuilder responseBuilder) {
        responseBuilder.header("Access-Control-Allow-Origin", "*")
                .header("Access-Control-Allow-Credentials", "true")
                .header("Access-Control-Allow-Methods", "GET, POST, DELETE, PUT")
                .header("Access-Control-Allow-Headers",
                        "Access-Control-Allow-Credentials, Access-Control-Allow-Headers, Origin, Accept, Authorization, X-Requested-With, Content-Type, Access-Control-Request-Method, Access-Control-Request-Headers");
    }

}
