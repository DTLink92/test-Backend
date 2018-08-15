/**
 * @author: Juan Pablo Mejia.
 */

package com.dh.spring5webapp.controller;

import com.dh.spring5webapp.command.CorrectiveMeasuresCommand;
import com.dh.spring5webapp.model.Area;
import com.dh.spring5webapp.model.CorrectiveMeasures;
import com.dh.spring5webapp.model.Employee;
import com.dh.spring5webapp.services.AreaService;
import com.dh.spring5webapp.services.CorrectiveMeasuresService;
import com.dh.spring5webapp.services.EmployeeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;

import javax.validation.constraints.NotNull;
import javax.ws.rs.*;
import javax.ws.rs.core.Response;
import java.util.ArrayList;
import java.util.List;

@Controller
@Path("/corrective_measures")
@Produces("application/json")
@CrossOrigin
public class CorrectiveMeasuresController {
    private CorrectiveMeasuresService service;
    private EmployeeService serviceEmployee;
    private AreaService serviceArea;

    public CorrectiveMeasuresController(CorrectiveMeasuresService service,
                                        EmployeeService serviceEmployee,
                                        AreaService serviceArea
                                      ) {
        this.service = service;
        this.serviceEmployee = serviceEmployee;
        this.serviceArea = serviceArea;
    }

    @GET
    public Response getCorrectiveMeasures() {
        List<CorrectiveMeasuresCommand> correctiveMeasuresCommands = new ArrayList<>();
        service.findAll().forEach(correctiveMeasures -> {
            CorrectiveMeasuresCommand correctiveMeasuresCommand = new CorrectiveMeasuresCommand(correctiveMeasures);
            correctiveMeasuresCommands.add(correctiveMeasuresCommand);
        });
        Response.ResponseBuilder responseBuilder = Response.ok(correctiveMeasuresCommands);
        //addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @GET
    @Path("/{id}")
    public Response getCorrectiveMeasureById(@PathParam("id") @NotNull Long id) {
        CorrectiveMeasures correctiveMeasures = service.findById(id);
        Response.ResponseBuilder responseBuilder = Response.ok(new CorrectiveMeasuresCommand(correctiveMeasures));
        //addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @POST
    public Response saveCorrectiveMeasures(CorrectiveMeasuresCommand correctiveMeasuresCommand) {
        CorrectiveMeasures model = correctiveMeasuresCommand.toDomain();
        model.setSupervisor(serviceEmployee.findById(correctiveMeasuresCommand.getIdEmployee()));
        model.setArea(serviceArea.findById(correctiveMeasuresCommand.getIdArea()));

        CorrectiveMeasures itemPersisted = service.save(model);
        Response.ResponseBuilder responseBuilder = Response.ok(new CorrectiveMeasuresCommand(itemPersisted));
        //addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }

    @PUT
    public Response updateItem(CorrectiveMeasuresCommand correctiveMeasuresCommand) {
        CorrectiveMeasures correctiveMeasures = service.findById(correctiveMeasuresCommand.getId());
        if(correctiveMeasuresCommand.getIdEmployee() != null) {
            Employee employee = serviceEmployee.findById(correctiveMeasuresCommand.getIdEmployee());
            correctiveMeasures.setSupervisor(employee);
        }
        if(correctiveMeasuresCommand.getIdArea() != null) {
            Area area = serviceArea.findById(correctiveMeasuresCommand.getIdArea());
            correctiveMeasures.setArea(area);
        }
        correctiveMeasuresCommand.updateValues(correctiveMeasures);
        correctiveMeasures = service.save(correctiveMeasures);
        Response.ResponseBuilder responseBuilder = Response.ok(new CorrectiveMeasuresCommand(correctiveMeasures));
        //addCorsHeader(responseBuilder);
        return responseBuilder.build();
    }


    @DELETE
    @Path("/{id}")
    public void deleteItem(@PathParam("id") String id) {
        service.deleteById(Long.valueOf(id));

    }

    @OPTIONS
    public Response prefligth() {
        return Response.ok().build();
    }


}    