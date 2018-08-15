package com.dh.spring5webapp.controller;

import com.dh.spring5webapp.model.DWAccident;
import com.dh.spring5webapp.model.DWArea;
import com.dh.spring5webapp.model.DWEquipment;
import com.dh.spring5webapp.services.DW_GetDataService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;

import javax.persistence.StoredProcedureQuery;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.ArrayList;
import java.util.List;

@Path("/DWAccidents")
@Produces(MediaType.APPLICATION_JSON)
@Controller
@CrossOrigin
public class DWAccidentController {

    private DW_GetDataService service;

    public DWAccidentController(DW_GetDataService service)
    {
        this.service = service;
    }

    @GET
    public Response getAccidents() {
        List<DWAccident> DWAccidents = service.findAllDWAccidents();
        return Response.ok(DWAccidents).build();
    }
    @GET
    @Path("/DWAreas")
    public Response getAreas() {
        List<DWArea> DWAccidents = service.findAllDWAreas();
        return Response.ok(DWAccidents).build();
    }
    @GET
    @Path("ng serve ")
    public Response getEquipments() {
        List<DWEquipment> DWAccidents = service.findAllDWEquipments();
        return Response.ok(DWAccidents).build();
    }

    @GET
    @Path("/DWAreas/{id}")
    public Response getAreasSearch(@PathParam("id") long id) {
        List<DWAccident> result = service.findAllDWAccidents();
        List<DWAccident> filter = new ArrayList<>();
        result.forEach(accident -> {
            if(accident.getArea_id() == id){
                filter.add(accident);
            }
        });
        return Response.ok(filter).build();
    }
    @GET
    @Path("/DWEquipments/{id}")
    public Response getEquipmentsSearch(@PathParam("id") long id) {
        List<DWAccident> result = service.findAllDWAccidents();
        List<DWAccident> filter = new ArrayList<>();
        result.forEach(accident -> {
            if(accident.getEquipment_id() == id){
                filter.add(accident);
            }
        });
        return Response.ok(filter).build();
    }

}
