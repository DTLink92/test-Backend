/**
 * @author: Edson A. Terceros T.
 */

package com.dh.spring5webapp.controller;

import com.dh.spring5webapp.command.AuditHistoryComand;
import com.dh.spring5webapp.model.AuditHistory;
import com.dh.spring5webapp.services.AuditHistoryService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.constraints.NotNull;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.ArrayList;
import java.util.List;

@Controller
@Path("/auditHistorys")
@Produces("application/json")
@CrossOrigin
public class AuditHistoryController {
    private AuditHistoryService service;

    public AuditHistoryController(AuditHistoryService service) {
        this.service = service;
    }

    @GET
    public Response getAccident() {
        List<AuditHistoryComand> auditHistoryList = new ArrayList<>();
        service.findAll().forEach(auditHistory -> {
            auditHistoryList.add(new AuditHistoryComand(auditHistory));
        });
        Response.ResponseBuilder responseBuilder = Response.ok(auditHistoryList);
        return responseBuilder.build();
    }
    @GET
    @Path("/{id}")
    public AuditHistoryComand getAuditHistoryById(@PathParam("id") long id) {
        AuditHistory auditHistory = service.findById(id);
        return new AuditHistoryComand(auditHistory);
    }

    @OPTIONS
    public Response prefligth() {
        return Response.ok().build();
    }


   @POST
    public AuditHistoryComand saveAccident(AuditHistoryComand auditHistoryComand) {
        int auditHistory_id = service.saveAuditHistory(auditHistoryComand.toAuditHistory());
        AuditHistory auditHistory = service.findById((long)auditHistory_id);
        return new AuditHistoryComand(auditHistory);
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


    @RequestMapping
    public String getAuditHistorys(Model model) {
        model.addAttribute("auditHistorys", service.findAll());
        return "auditHistorys";
    }

    @RequestMapping("/{id}")
    public String getAuditHistorysById(@PathVariable("id") @NotNull Long id, Model model) {
        model.addAttribute("auditHistory", service.findById(id));
        return "auditHistory";
    }
}    
