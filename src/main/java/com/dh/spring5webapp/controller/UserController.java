/**
 * @author: edson
 */

package com.dh.spring5webapp.controller;

import com.dh.spring5webapp.command.UserCommand;
import com.dh.spring5webapp.model.Rol;
import com.dh.spring5webapp.model.System_Project_User;
import com.dh.spring5webapp.services.RoleService;
import com.dh.spring5webapp.services.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;

import javax.persistence.*;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.ArrayList;
import java.util.List;

@Path("/users")
@Produces(MediaType.APPLICATION_JSON)
@Controller
@CrossOrigin
public class UserController {
    private UserService service;
    private RoleService roleService;
    @PersistenceUnit
    private EntityManagerFactory entityFactory;
    private static Logger logger = LoggerFactory.getLogger(UserController.class);

    public UserController(UserService service, RoleService roleService)
    {
        this.service = service;
        this.roleService = roleService;
    }

    @GET
    public Response getUsers() {
        List<System_Project_User> usersList = service.findAll();
        List<UserCommand> userCommands = new ArrayList<>();
        usersList.forEach(user -> {
            userCommands.add(new UserCommand(user));
        });
        return Response.ok(userCommands).build();
    }

    @OPTIONS
    public Response prefligth() {
        return Response.ok().build();
    }

    @POST
    public Response addUser(UserCommand userCommand) {
        Rol role = roleService.findById(userCommand.getRoleId());
        System_Project_User user = service.createUser(userCommand.toUser(role));
        return Response.ok(new UserCommand(user)).build();
    }

    @PUT
    public Response updateUser(UserCommand userCommand) {
        System_Project_User user = service.findById(userCommand.getId());
        Rol role = roleService.findById(userCommand.getRoleId());
        userCommand.updateValues(user, role);
        user = service.save(user);
        return Response.ok(new UserCommand(user)).build();
    }

    @PUT
    @Path("/{id}")
    public Response login(UserCommand userCommand) {
        System_Project_User user = service.login(userCommand.getLogin(), userCommand.getPassword());
        return Response.ok(userCommand.LoginUser(user)).build();
    }

    @DELETE
    @Path("/{id}")
    public Response deleteUser(@PathParam("id") long id) {
        service.deleteByUserId(id);
        return Response.ok(id).build();
    }
}