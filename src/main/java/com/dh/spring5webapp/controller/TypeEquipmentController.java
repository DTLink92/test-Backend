package com.dh.spring5webapp.controller;


import com.dh.spring5webapp.command.EquipmentCommand;
import com.dh.spring5webapp.command.TypeEquipmentCommand;
import com.dh.spring5webapp.model.Equipment;
import com.dh.spring5webapp.model.TypeEquipment;
import com.dh.spring5webapp.services.TypeEquipmentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;


import javax.validation.constraints.NotNull;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

@Path("/type_equipments")
@Produces(MediaType.APPLICATION_JSON)
@Controller
//@Produces("application/json")

@CrossOrigin(origins = "http://localhost:4200")
public class TypeEquipmentController {
    private TypeEquipmentService service;
    public TypeEquipmentController(TypeEquipmentService service){
        this.service=service;
    }


    @GET
    public Response getTypeEquipment() {
      //  List<TypeEquipmentCommand> typeEquipments = new ArrayList<>();
        List<TypeEquipmentCommand> typeEquipments = new LinkedList<TypeEquipmentCommand>();

        service.findAll().forEach(typeEquipment -> {
            TypeEquipmentCommand model = new TypeEquipmentCommand(typeEquipment);
            typeEquipments.add(model);


        });

        return Response.ok(typeEquipments).build();
    }
/*
 public Response getEmployees() {
        List<EmployeeCommand> employeeList = new ArrayList<>();
        service.findAll().forEach(employee -> {
            employeeList.add(new EmployeeCommand(employee));
        });
        return Response.ok(employeeList).build();


     }*/

    @GET
    @Path("/{id}")
    public Response getTypeEquipmentById(@PathParam("id") @NotNull Long id) {
        TypeEquipment typeEquipment = service.findById(id);
       // Response.ResponseBuilder responseBuilder = Response.ok(new TypeEquipmentCommand(typeEquipment));
       // addCorsHeader(responseBuilder);
        // return responseBuilder.build();
        return Response.ok(new TypeEquipmentCommand(typeEquipment)).build();

    }
    @POST
    public  Response addTypeEquipment(TypeEquipmentCommand typeEquipmentCommand){
        TypeEquipment typeEquipment = service.save(typeEquipmentCommand.toTypeEquipment());
       // Response.ResponseBuilder responseBuilder = Response.ok(new TypeEquipmentCommand(typeEquipment));
        // addCorsHeader(responseBuilder);
        // return responseBuilder.build();
        return Response.ok(new TypeEquipmentCommand(typeEquipment)).build();

    }
/*public Response addPosition(PositionCommand positionCommand) {
        Position position = service.save(positionCommand.toPosition());
        return Response.ok(new PositionCommand(position)).build();
    }*/
    @PUT
    public Response updateTypeEquipment(TypeEquipmentCommand typeEquipmentCommand){
        TypeEquipment typeEquipment = service.findById(typeEquipmentCommand.getId());
       typeEquipment.setName(typeEquipmentCommand.getName());
       typeEquipment.setDescriptionTypeEquipment(typeEquipmentCommand.getDescriptionTypeEquipment());
       service.save(typeEquipment);
      //  Response.ResponseBuilder responseBuilder = Response.ok(new TypeEquipmentCommand(typeEquipment));
       // addCorsHeader(responseBuilder);
        // return responseBuilder.build();
        return Response.ok(new TypeEquipmentCommand(typeEquipment)).build();

    }

    @DELETE
    @Path("/{id}")
    public void deleteTypeEquipment(@PathParam("id") long id ){

        service.deleteById(id);

    }
   /* public Response deleteTypeEquipment(@PathParam("id") String id){
        service.deleteById(Long.valueOf(id));
        Response.ResponseBuilder responseBuilder = Response.ok();
        addCorsHeader(responseBuilder);
        return  responseBuilder.build();
    }*/

    @OPTIONS
    public Response prefligth() {
     /*   Response.ResponseBuilder responseBuilder = Response.ok();
        addCorsHeader(responseBuilder);
        responseBuilder.allow("OPTIONS").build();
        return responseBuilder.build();
    }


    private void addCorsHeader(javax.ws.rs.core.Response.ResponseBuilder responseBuilder) {
        responseBuilder.header("Access-Control-Allow-Origin", "*")
                .header("Access-Control-Allow-Credentials", "true")
                .header("Access-Control-Allow-Methods", "GET, POST, DELETE, PUT")
                .header("Access-Control-Allow-Headers",
                        "Access-Control-Allow-Credentials, Access-Control-Allow-Headers, Origin, Accept, Authorization, X-Requested-With, Content-Type, Access-Control-Request-Method, Access-Control-Request-Headers");
    */
        return Response.ok().build();
    }
}
