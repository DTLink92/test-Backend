package com.dh.spring5webapp.controller;

import com.dh.spring5webapp.command.PositionRecruitmentProfileCommand;
import com.dh.spring5webapp.model.Position;
import com.dh.spring5webapp.model.RecruitmentProfile;
import com.dh.spring5webapp.services.PositionRecruitmentProfileService;
import com.dh.spring5webapp.services.PositionService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.*;

@Path("/recruitmentProfiles")
@Produces(MediaType.APPLICATION_JSON)
@Controller
@CrossOrigin
public class PositionRecruitmentProfileController {

    private PositionRecruitmentProfileService service;
    private PositionService positionService;

    public PositionRecruitmentProfileController(PositionRecruitmentProfileService service
    , PositionService positionService)
    {
        this.service = service;
        this.positionService = positionService;
    }

    @GET
    public Response getProfiles() {
        List<PositionRecruitmentProfileCommand> profiles = new LinkedList<PositionRecruitmentProfileCommand>();
        List<Position> positions = positionService.findAll();
        service.findAll().forEach(profile -> {
            PositionRecruitmentProfileCommand model = new PositionRecruitmentProfileCommand(profile);
            positions.forEach(position -> {
                if(position.getId() == model.getPosition()){
                    model.setPositionName(position.getName());
                }
            });
            profiles.add(model);
        });
        return Response.ok(profiles).build();
    }

    @GET
    @Path("/{id}")
    public Response getProfileById(@PathParam("id") long id) {
        RecruitmentProfile profile = service.findById(id);
        return Response.ok(new PositionRecruitmentProfileCommand(profile)).build();
    }

    @GET
    @Path("/position/{id}")
    public Response getProfileByPositionId(@PathParam("id") long id) {
        List<PositionRecruitmentProfileCommand> profiles = new LinkedList<PositionRecruitmentProfileCommand>() ;
        service.findByPositionId(id).forEach(profile -> {
            profiles.add(new PositionRecruitmentProfileCommand(profile));
        });
        return Response.ok(profiles).build();
    }

    @OPTIONS
    public Response prefligth() {
        return Response.ok().build();
    }

    @POST
    public Response addProfile(PositionRecruitmentProfileCommand profileCommand) {
        RecruitmentProfile profile = service.save(profileCommand.toRecruitmentProfile());
        return Response.ok(new PositionRecruitmentProfileCommand(profile)).build();
    }

    @PUT
    public Response updateProfile(PositionRecruitmentProfileCommand profileCommand) {
        RecruitmentProfile profileSave = service.findById(profileCommand.getId());
        profileSave = profileCommand.UpdateProfile(profileSave);
        RecruitmentProfile result = service.save(profileSave);
        return Response.ok(new PositionRecruitmentProfileCommand(result)).build();
    }

    @DELETE
    @Path("/{id}")
    public Response deleteProfile(@PathParam("id") long id) {
        service.deleteById(id);
        return Response.ok().build();
    }


}
