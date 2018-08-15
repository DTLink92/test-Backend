/**
 * @author: edson
 */

package com.dh.spring5webapp.controller;

import com.dh.spring5webapp.command.RoleCommand;
import com.dh.spring5webapp.command.UserCommand;
import com.dh.spring5webapp.model.Rol;
import com.dh.spring5webapp.model.System_Project_User;
import com.dh.spring5webapp.services.RoleService;
import com.dh.spring5webapp.services.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.ArrayList;
import java.util.List;

@Path("/roles")
@Produces(MediaType.APPLICATION_JSON)
@Controller
@CrossOrigin
public class RoleController {
    private RoleService service;

    public RoleController(RoleService roleService)
    {
        this.service = roleService;
    }

    @GET
    public Response getRoles() {
        List<RoleCommand> roleList = new ArrayList<>();
        service.findAll().forEach(role -> {
            roleList.add(new RoleCommand(role));
        });
        return Response.ok(roleList).build();
    }

    @OPTIONS
    public Response prefligth() {
        return Response.ok().build();
    }

    @POST
    public Response addRole(RoleCommand roleCommand) {
        Rol role = service.save(roleCommand.toRole());
        return Response.ok(new RoleCommand(role)).build();
    }

    @DELETE
    @Path("/{id}")
    public Response deleteRole(@PathParam("id") long id) {
        service.deleteRoleById(id);
        return Response.ok(id).build();
    }
}