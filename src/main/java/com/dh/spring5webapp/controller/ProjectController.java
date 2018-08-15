/**
 * @author: Edson A. Terceros T.
 */

package com.dh.spring5webapp.controller;

import com.dh.spring5webapp.command.AreaCommand;
import com.dh.spring5webapp.command.EquipmentCommand;
import com.dh.spring5webapp.command.ProjectCommand;
import com.dh.spring5webapp.model.Equipment;
import com.dh.spring5webapp.model.Project;
import com.dh.spring5webapp.model.Area;
import com.dh.spring5webapp.services.AreaService;
import com.dh.spring5webapp.services.EquipmentService;
import com.dh.spring5webapp.services.ProjectService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;

import javax.persistence.EntityManager;
import javax.persistence.ParameterMode;
import javax.persistence.StoredProcedureQuery;
import javax.validation.constraints.NotNull;
import javax.ws.rs.*;
import javax.ws.rs.core.Response;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@Path("/projects")
@Produces("application/json")
@CrossOrigin
public class ProjectController {
    private ProjectService service;
    private AreaService areaService;
    //private EntityManager entityManager;
    // private SubCategoryService subCategoryService;
    public ProjectController(ProjectService service, AreaService areaService/*,EntityManager entityManager*/) {
        this.service = service;
        this.areaService = areaService;
        //this.entityManager = entityManager;
    }

    @GET
    public Response getItems() {

        List<ProjectCommand> projectCommands = new ArrayList<>();
        service.findAll().forEach(project -> projectCommands.add(new ProjectCommand(project)));
        Response.ResponseBuilder responseBuilder = Response.ok(projectCommands);
        return responseBuilder.build();
    }



    @GET
    @Path("/{id}")
    public Response getProjectsById(@PathParam("id")  Long id) {

        Project project =service.findById(id);
        Response.ResponseBuilder responseBuilder = Response.ok(new ProjectCommand(project));
        return responseBuilder.build();


    }



    @POST
    public ProjectCommand addProject(ProjectCommand projectCommand) {
      Project project = service.save(projectCommand.toDomain());
      return new ProjectCommand(project);

    }


    @PUT
    public Response updateProject( ProjectCommand projectCommand) {
        Project project = service.findById(projectCommand.getId());
        projectCommand.updateValues(project);
        service.save(project);
        //Response.ResponseBuilder responseBuilder = Response.ok(new ProjectCommand(project));
        //addCorsHeader(responseBuilder);
        //return responseBuilder.build();
        return Response.ok(new ProjectCommand(project)).build();
    }



    @DELETE
    @Path("/{id}")
    public void deleteProject(@PathParam("id") Long id) {
        // se debe optimizar este proceso
        // areaService.findAll().forEach(area->{
        //     if(area.getProject().getId() == id) {
        //         System.out.println("cambiando refrencia de " + area.getId());
        //        areaService.findById(area.getId()).setProject(null);
        // }
        // });
        System.out.println("borrando projecto con id: " + id);
        service.deleteById(id);
    }

    /*
    * @return las Areas que tiene asignado un project de id: = @id
    *
    * */
    @GET
    @Path("/areas/{id}")
    public Response getAreasByProject(@PathParam("id") Long id) {
        List<AreaCommand> areaslist = new ArrayList<>();
        areaService.getAreasAsigned(id).forEach(area->{
            areaslist.add(new AreaCommand(area));
        });
//        // se debe optimizar este proceso
//        areaService.findAll().forEach(area -> {
//            System.out.println(area.getProject().getId());
//            if ( area.getProject().getId() == (Long)id )
//                 areaslist.add(new AreaCommand(area));
//        });


        return Response.ok(areaslist).build();

    }



}