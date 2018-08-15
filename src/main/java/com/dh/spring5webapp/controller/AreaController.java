package com.dh.spring5webapp.controller;

import com.dh.spring5webapp.command.AreaCommand;

import com.dh.spring5webapp.command.ProjectCommand;
import com.dh.spring5webapp.model.Area;

import com.dh.spring5webapp.model.Project;
import com.dh.spring5webapp.services.AreaService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;


import javax.persistence.EntityManager;
import javax.persistence.ParameterMode;
import javax.persistence.StoredProcedureQuery;
import javax.validation.constraints.NotNull;
import javax.ws.rs.*;
import javax.ws.rs.core.Response;
import java.util.ArrayList;
import java.util.List;

@Controller
@Path("/areas")
@Produces("application/json")
@CrossOrigin
public class AreaController {


    private AreaService service;
    private EntityManager entityManager;

    public AreaController(AreaService service, EntityManager entityManager ) {
        this.service = service;
        this.entityManager = entityManager;
    }


    @GET
    public Response getItems() {

        List<AreaCommand> items = new ArrayList<>();
        service.findAll().forEach(area -> {
            items.add(new AreaCommand(area));
        });
        return Response.ok(items).build();
//        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("get_all_area",Area.class);
//        query.execute();
//        List<Area> res = query.getResultList();
//        List<AreaCommand> listAreasCommand = new ArrayList<>();
//        res.forEach(area -> {
//            listAreasCommand.add(new AreaCommand(area));
//        });
//        entityManager.clear();
//        entityManager.close();
//
//        return Response.ok(listAreasCommand).build();
    }

    @GET
    @Path("/{id}")
    public Response getAreaById(@PathParam("id") @NotNull Long id) {

        Area area = service.findById(id);
        //Response.ResponseBuilder responseBuilder = Response.ok(new ProjectCommand(item));
        //addCorsHeader(responseBuilder);
        //return responseBuilder.build();
        return Response.ok(new AreaCommand(area)).build();
        //        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("get_area_by_id",Area.class);
//        query.registerStoredProcedureParameter("id_area", Integer.class, ParameterMode.IN);
//        query.registerStoredProcedureParameter("UserLogin", Integer.class, ParameterMode.IN);
//        Integer id_integer = Integer.valueOf(id.intValue());
//        query.setParameter("id_area", id_integer); // OJO CON EL TIPO DE DATO
//        query.setParameter("UserLogin", 1); // OJO AUN NO SE MANDEJA CONTROL DE USUARIOS
//        query.execute();
//        List<Area> res = query.getResultList();
//        List<AreaCommand> lisAreaCommand = new ArrayList<>();
//        res.forEach(area -> {
//            lisAreaCommand.add(new AreaCommand(area));
//        });
//        entityManager.clear();
//        entityManager.close();
//        return Response.ok(lisAreaCommand).build();

    }

    @POST
    public AreaCommand addArea(AreaCommand areaCommand){

        Area area = service.save(areaCommand.toDomain());
        return new AreaCommand(area);
//            Area area = areaCommand.toDomain();
//            StoredProcedureQuery query = entityManager.createStoredProcedureQuery("add_area");
//            query.registerStoredProcedureParameter("detail", String.class, ParameterMode.IN);
//            query.registerStoredProcedureParameter("name", String.class, ParameterMode.IN);
//            query.registerStoredProcedureParameter("user_id", Integer.class, ParameterMode.IN);
//
//            query.setParameter("detail", area.getDetail());
//            query.setParameter("name", area.getName());
//            query.setParameter("user_id", 1); // OJO AUN NO SE MANDEJA CONTROL DE USUARIOS
//            query.execute();
//
//        entityManager.clear();
//        entityManager.close();
//
//
//        return new AreaCommand(area);



    }

    @PUT
    public Response updateArea(AreaCommand areaCommand){
        Area area = service.findById(areaCommand.getId());
        areaCommand.uptateValues(area);
        service.save(area);
        //Response.ResponseBuilder responseBuilder = Response.ok(new ProjectCommand(project));
        //addCorsHeader(responseBuilder);
        //return responseBuilder.build();
        return Response.ok(new AreaCommand(area)).build();
//        Area area = areaCommand.toDomain();
//        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("update_area");
//        query.registerStoredProcedureParameter("id_area", Integer.class, ParameterMode.IN);
//        query.registerStoredProcedureParameter("detail", String.class, ParameterMode.IN);
//        query.registerStoredProcedureParameter("name", String.class, ParameterMode.IN);
//        query.registerStoredProcedureParameter("user_id", Integer.class, ParameterMode.IN);
//
//        Integer id_integer = Integer.valueOf(area.getId().intValue());
//        query.setParameter("id_area", id_integer);
//        query.setParameter("detail", area.getDetail());
//        query.setParameter("name", area.getName());
//        query.setParameter("user_id", 1); // OJO AUN NO SE MANDEJA CONTROL DE USUARIOS
//        query.execute();
//
//        entityManager.clear();
//        entityManager.close();
//        return Response.ok(new AreaCommand(area)).build();
    }

    @DELETE
    @Path("/{id}")
    public void deleteArea(@PathParam("id") long id ){
        service.deleteById(id);
    }

}
