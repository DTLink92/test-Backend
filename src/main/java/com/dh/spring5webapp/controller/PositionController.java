package com.dh.spring5webapp.controller;

import com.dh.spring5webapp.command.PositionCommand;
import com.dh.spring5webapp.command.PositionEmployeeReportCommand;
import com.dh.spring5webapp.model.*;
import com.dh.spring5webapp.services.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;

import javax.validation.constraints.NotNull;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

@Path("/positions")
@Produces(MediaType.APPLICATION_JSON)
@Controller
@CrossOrigin
public class PositionController {
    private PositionService service;
    private PositionRecruitmentProfileService profileService;
    private AreaService areaService;
    private PositionAssignEmployeeService assignEmployeeService;
    private EmployeeService employeeService;

    private DateFormat dt = new SimpleDateFormat("MM/dd/yyyy");

    public PositionController(PositionService service, PositionRecruitmentProfileService profileService
            ,AreaService areaService,PositionAssignEmployeeService assignEmployeeService
            ,EmployeeService employeeService)
    {
        this.service = service;
        this.profileService = profileService;
        this.areaService = areaService;
        this.assignEmployeeService = assignEmployeeService;
        this.employeeService = employeeService;
    }

    @GET
    public Response getPositions() {
        List<PositionCommand> positionList = new LinkedList<PositionCommand>();
        List<RecruitmentProfile> profilesEntity = profileService.findAll();
        List<Area> areasEntity =  areaService.findAll();
        service.findAll().forEach(position -> {
            PositionCommand model = new PositionCommand(position);
            profilesEntity.forEach(profile ->{
                if(position.getId() == profile.getPosition().getId())
                {
                    model.getProfilesName().add(profile.getDescription());
                }
            });
            areasEntity.forEach(area -> {
                if(model.getArea() == area.getId()){
                    model.setAreaName(area.getName());
                }
            });
            positionList.add(model);
        });
        return Response.ok(positionList).build();
    }

    @GET
    @Path("/{id}")
    public Response getPositionById(@PathParam("id") @NotNull Long id) {
        Position position = service.findById(id);
        List<RecruitmentProfile> profilesEntity = profileService.findAll();
        List<Area> areasEntity =  areaService.findAll();
        PositionCommand model = new PositionCommand(position);
        profilesEntity.forEach(profile ->{
            if(position.getId() == profile.getPosition().getId())
            {
                model.getProfilesName().add(profile.getDescription());
            }
        });
        areasEntity.forEach(area -> {
            if(model.getArea() == area.getId()){
                model.setAreaName(area.getName());
            }
        });
        return Response.ok(model).build();
    }

    @DELETE
    @Path("/{id}")
    public Response deletePosition(@PathParam("id") @NotNull String id) {
        service.deleteById(Long.valueOf(id));
        return Response.ok().build();
    }

    @POST
    public Response addPosition(PositionCommand positionCommand) {
        Position position = service.save(positionCommand.toPosition());
        return Response.ok(new PositionCommand(position)).build();
    }

    @PUT
    public Response updatePosition(PositionCommand positionCommand) {

        Position positionSave = service.findById(positionCommand.getId());
        positionSave = positionCommand.UpdatePosition(positionSave);
        Position position = service.save(positionSave);
        return Response.ok(new PositionCommand(position)).build();
    }

    @OPTIONS
    public Response prefligth() {
        return Response.ok().build();
    }

    @GET
    @Path("/PositionReport/{id}")
    public Response getProfileByPositionId(@PathParam("id") long id) {
        List<PositionEmployeeReportCommand> posAssEmplList = new LinkedList<>();
        AtomicInteger number = new AtomicInteger(1);
        assignEmployeeService.findByPosition_Id(id).forEach(posAssEmpl -> {
            PositionEmployeeReportCommand report = new PositionEmployeeReportCommand();
            report.setSalary(posAssEmpl.getSalary().toString());
            //report.setStartContract(dt.format(posAssEmpl.getInitDate()));
            //report.setEndContract(dt.format(posAssEmpl.getFinishDate()));

            Employee empl = employeeService.findById(posAssEmpl.getEmployee().getId());
            report.setCiEmpl(empl.getCi().toString());
            report.setNameEmpl(empl.getFirst_name() + " " + empl.getLast_name());
            report.setNumberlist(number.get());
            posAssEmplList.add(report);
            number.set(number.get() + 1);
        });

        return Response.ok(posAssEmplList).build();
    }
}
