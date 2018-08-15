package com.dh.spring5webapp.controller;


import com.dh.spring5webapp.command.PositionEvaluationMetricCommand;
import com.dh.spring5webapp.model.EvaluationMetric;
import com.dh.spring5webapp.services.PositionEvaluationMetricService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.LinkedList;
import java.util.List;

@Path("/metrics")
@Produces(MediaType.APPLICATION_JSON)
@Controller
@CrossOrigin
public class PositionEvaluationMetricController {

    private PositionEvaluationMetricService service;

    public PositionEvaluationMetricController(PositionEvaluationMetricService service) {
        this.service = service;
    }

    @GET
    public Response getMetrics() {
        List<PositionEvaluationMetricCommand> metrics = new LinkedList<PositionEvaluationMetricCommand>();
        service.findAll().forEach(metric -> {
            metrics.add(new PositionEvaluationMetricCommand(metric));
        });
        return Response.ok(metrics).build();
    }

    @GET
    @Path("/{id}")
    public Response getMetricById(@PathParam("id") long id) {
        EvaluationMetric metric = service.findById(id);
        return Response.ok(new PositionEvaluationMetricCommand(metric)).build();
    }

    @OPTIONS
    public Response prefligth() {
        return Response.ok().build();

    }

    @POST
    public Response addMetric(PositionEvaluationMetricCommand metricCommand) {
        EvaluationMetric metric = service.save(metricCommand.toEvaluationMetric());
        return Response.ok(new PositionEvaluationMetricCommand(metric)).build();
    }

    @PUT
    public Response updateMetric(PositionEvaluationMetricCommand metricCommand) {
        EvaluationMetric metric = service.save(metricCommand.toEvaluationMetric());
        return Response.ok(new PositionEvaluationMetricCommand(metric)).build();
    }

    @DELETE
    @Path("/{id}")
    public Response deleteMetric(@PathParam("id") long id) {
        service.deleteById(id);
        return Response.ok().build();
    }

}
