

package com.dh.spring5webapp.controller;


import com.dh.spring5webapp.command.EquipmentCommand;
import com.dh.spring5webapp.model.Equipment;
import com.dh.spring5webapp.services.EquipmentService;
import com.dh.spring5webapp.services.TypeEquipmentService;
import org.glassfish.jersey.media.multipart.FormDataContentDisposition;
import org.glassfish.jersey.media.multipart.FormDataParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;

import javax.validation.constraints.NotNull;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

@Controller
@Path("/equipments")
@Produces(MediaType.APPLICATION_JSON)
@CrossOrigin(origins = "http://localhost:4200")
public class EquipmentController {
    private EquipmentService service;
    private TypeEquipmentService typeEquipmentService;
    // private SubCategoryService subCategoryService;

    public EquipmentController(EquipmentService service, TypeEquipmentService typeEquipmentService)
    {
        this.service = service;
        this.typeEquipmentService = typeEquipmentService;
    }

    @GET
    public Response getEquipment() {
        //List<EquipmentCommand> equipments = new ArrayList<>();
        List<EquipmentCommand> equipments = new LinkedList<EquipmentCommand>();

        service.findAll().forEach(equipment -> {
            EquipmentCommand model = new EquipmentCommand(equipment);
            equipments.add(model);
        });
       // Response.ResponseBuilder responseBuilder = Response.ok(equipments);
       // addCorsHeader(responseBuilder);
       // return responseBuilder.build();
        return Response.ok(equipments).build();
    }

    /*@GET
    @Path("/type/{id}")
    public Response getEquipmentType(@PathParam("id") @NotNull Long id) {

        List<EquipmentCommand> equipments = new LinkedList<EquipmentCommand>();

        service.getAllTypes(id).forEach(equipment -> {
            EquipmentCommand model = new EquipmentCommand(equipment);
            equipments.add(model);
        });
        return Response.ok(equipments).build();
    }*/
    @GET
    @Path("/{id}")
    public Response getEquipmentsById(@PathParam("id") @NotNull Long id) {
        Equipment equipment = service.findById(id);
       // Response.ResponseBuilder responseBuilder = Response.ok(new EquipmentCommand(equipment));
       // addCorsHeader(responseBuilder);
       // return responseBuilder.build();
        return Response.ok(new EquipmentCommand(equipment)).build();
    }


   /* @POST
    public Response saveEquipment(EquipmentCommand equipmentCommand) {
        Equipment equipment = service.save(equipmentCommand.toEquipment());

        equipment.setTypeEquipment(typeEquipmentService.findById(equipmentCommand.getTypeEquipmentID()));

        // Response.ResponseBuilder responseBuilder = Response.ok(new EquipmentCommand(equipmentPersisted));
        // addCorsHeader(responseBuilder);
        // return responseBuilder.build();
        return Response.ok(new EquipmentCommand(equipment)).build();

    } */
   @POST
   public Response saveEquipment(EquipmentCommand equipment) {
       Equipment model = equipment.toEquipment();
       model.setTypeEquipment(typeEquipmentService.findById(equipment.getTypeEquipmentID()));
       Equipment equipmentPersisted = service.save(model);
      // Response.ResponseBuilder responseBuilder = Response.ok(new EquipmentCommand(equipmentPersisted));
       //addCorsHeader(responseBuilder);
       //return responseBuilder.build();
       return Response.ok(new EquipmentCommand(model)).build();

   }


/*
    @POST
    public EquipmentCommand addEquipment(EquipmentCommand equipmentComand) {
        Equipment equipment = service.save(equipmentComand.toEquipment());
        return new EquipmentCommand(equipment);
    }
    */

    @PUT
    public  Response updateEquipment(EquipmentCommand equipmentCommand){
        Equipment equipment = service.findById(equipmentCommand.getId());

        equipment.setBrand(equipmentCommand.getBrand());
        equipment.setName(equipmentCommand.getName());
        equipment.setDateofpurchase(equipment.getDateofpurchase());
        equipment.setTypeEquipment(typeEquipmentService.findById(equipmentCommand.getTypeEquipmentID()));

        service.save(equipment);

       // Response.ResponseBuilder responseBuilder = Response.ok(new EquipmentCommand(equipment));
       // addCorsHeader(responseBuilder);
       // return responseBuilder.build();
        return Response.ok(new EquipmentCommand(equipment)).build();
    }



    @DELETE
    @Path("/{id}")
    public void deleteEquipment(@PathParam("id") String id){
        service.deleteById(Long.valueOf(id));
       // Response.ResponseBuilder responseBuilder =  Response.ok();
        // addCorsHeader(responseBuilder);
        // return  responseBuilder.build();
    }

    @OPTIONS
    public Response preflight() {
        Response.ResponseBuilder responseBuilder = Response.ok();
        responseBuilder.allow("OPTIONS").build();
        return Response.ok().build();
        }


}