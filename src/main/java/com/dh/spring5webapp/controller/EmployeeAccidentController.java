/*
 * @author: Juan Pablo Mejia
 */

package com.dh.spring5webapp.controller;

import com.dh.spring5webapp.command.EmployeeAccidentCommand;
import com.dh.spring5webapp.model.Accident;
import com.dh.spring5webapp.model.Employee;
import com.dh.spring5webapp.model.EmployeeAccident;
import com.dh.spring5webapp.services.*;
import org.hibernate.Hibernate;
import org.springframework.jdbc.object.StoredProcedure;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;

import javax.persistence.EntityManager;
import javax.persistence.ParameterMode;
import javax.persistence.Query;
import javax.persistence.StoredProcedureQuery;
import javax.ws.rs.*;
import javax.ws.rs.core.Response;
import java.util.ArrayList;
import java.util.List;

@Controller
@Path("/employee_accidents")
@Produces("application/json")
@CrossOrigin
public class EmployeeAccidentController {
    private EmployeeAccidentService service;
    private EmployeeService serviceEmployee;
    private AccidentService serviceAccident;
    private EntityManager entityManager;
    public EmployeeAccidentController(EmployeeAccidentService service,
                                      EmployeeService serviceEmployee,
                                      AccidentService serviceAccident,
                                      EntityManager entityManager
                                      ) {
        this.service = service;
        this.serviceEmployee = serviceEmployee;
        this.serviceAccident = serviceAccident;
        this.entityManager = entityManager;
    }

    @GET
    public Response getEmployeesAccidents() {
        List<EmployeeAccidentCommand> employeeAccidents = new ArrayList<>();
        service.findAll().forEach(employeeAccident -> {
            EmployeeAccidentCommand employeeAccidentCommand = new EmployeeAccidentCommand(employeeAccident);
            employeeAccidents.add(employeeAccidentCommand);
        });
        return Response.ok(employeeAccidents).build();
    }


    @GET
    @Path("/test")
    public Response getTest() {
/*        StoredProcedureQuery query = entityManager.
                createStoredProcedureQuery("hello")
                .registerStoredProcedureParameter(1, String.class,
                        ParameterMode.IN)
                .setParameter(1, "The Walking bugs");
        query.execute();
        List<Object[]> results = query.getResultList();*/
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("my_sqrt");
        query.registerStoredProcedureParameter("input_number", Integer.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("output_number", Integer.class, ParameterMode.OUT);
        query.setParameter("input_number", 100);
        query.execute();
        int res = (int) query.getOutputParameterValue("output_number");
        return Response.ok(res).build();
    }

    @GET
    @Path("/test2")
    public Response getTest2() {
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("getEmployees");
        query.registerStoredProcedureParameter("input_number", Integer.class, ParameterMode.IN);
        query.setParameter("input_number", 10000);
        query.execute();
        List res = query.getResultList();
        return Response.ok(res).build();
    }
    @GET
    @Path("/test3")
    public Response getTest3() {
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("GetEmployeesAccident", EmployeeAccident.class);
        // query.registerStoredProcedureParameter("input_number", Integer.class, ParameterMode.IN);
        // query.setParameter("input_number", 10000);
        query.execute();
        return Response.ok(query.getResultList()).build();

//        Hibernate.initialize(topics.getComments());
        /*List<EmployeeAccident> res = query.getResultList();
        List<EmployeeAccidentCommand> results = new ArrayList<>();
        for (EmployeeAccident employeeAccident: res) {
            results.add(new EmployeeAccidentCommand(employeeAccident));
        }

        return Response.ok(results).build();
        */
    }
    @GET
    @Path("/{id}")
    public Response getById(@PathParam("id") long id) {
        EmployeeAccident employeeAccident = service.findById(id);
        Response.ResponseBuilder responseBuilder = Response.ok(new EmployeeAccidentCommand(employeeAccident));
        return responseBuilder.build();
    }

    @OPTIONS
    public Response prefligth() {
        return Response.ok().build();
    }

    @POST
    public Response saveItem(EmployeeAccidentCommand item) {
        EmployeeAccident model = item.toDomain();
        model.setEmployee(serviceEmployee.findById(item.getIdEmployee()));
        // enlace con accident
        model.setAccident(serviceAccident.findById(item.getIdAccident()));
        EmployeeAccident itemPersisted = service.save(model);
        Response.ResponseBuilder responseBuilder = Response.ok(new EmployeeAccidentCommand(itemPersisted));
        return responseBuilder.build();
    }

    @PUT
    public Response updateItem(EmployeeAccidentCommand employeeAccidentCommand) {
        EmployeeAccident employeeAccident = service.findById(employeeAccidentCommand.getId());
        if(employeeAccidentCommand.getIdEmployee() != null) {
            Employee employee = serviceEmployee.findById(employeeAccidentCommand.getIdEmployee());
            employeeAccident.setEmployee(employee);
        }
        if(employeeAccidentCommand.getIdAccident() != null) {
            Accident accident = serviceAccident.findById(employeeAccidentCommand.getIdAccident());
            employeeAccident.setAccident(accident);
        }
        employeeAccidentCommand.updateValues(employeeAccident);
        employeeAccident = service.save(employeeAccident);
        Response.ResponseBuilder responseBuilder = Response.ok(new EmployeeAccidentCommand(employeeAccident));
        return responseBuilder.build();
    }


    @DELETE
    @Path("/{id}")
    public void deleteItem(@PathParam("id") long id) {
        service.deleteById(id);
        //Response.ResponseBuilder responseBuilder = Response.ok();
        //addCorsHeader(responseBuilder);
        //return responseBuilder.build();
    }
}

/*
*
DELIMITER $$

DROP PROCEDURE IF EXISTS my_sqrt$$
CREATE PROCEDURE my_sqrt(input_number INT, OUT out_number FLOAT)
BEGIN
    SET out_number=SQRT(input_number);
END$$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS getEmployees$$
CREATE PROCEDURE getEmployees(input_number INT)
BEGIN
    SELECT * from employee;
END$$

DELIMITER ;


ERRORS
failed to lazily initialize a collection of role: com.dh.spring5webapp.model.Employee.positions,
could not initialize proxy - no Session (through reference chain:
java.util.ArrayList[0]->com.dh.spring5webapp.model.Employee["positions"])
* */