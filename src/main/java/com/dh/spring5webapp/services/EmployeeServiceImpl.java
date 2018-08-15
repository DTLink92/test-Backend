/**
 * @author: Edson A. Terceros T.
 */

package com.dh.spring5webapp.services;

import com.dh.spring5webapp.model.Employee;
import com.dh.spring5webapp.repositories.EmployeeRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import javax.persistence.*;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class EmployeeServiceImpl extends GenericServiceImpl<Employee> implements EmployeeService {
    @PersistenceUnit
    private EntityManagerFactory entityFactory;
    private static Logger logger = LoggerFactory.getLogger(EmployeeServiceImpl.class);
    private EmployeeRepository employeeRepository;

    public EmployeeServiceImpl(EmployeeRepository EmployeeRepository) {

        this.employeeRepository = EmployeeRepository;
    }

    @Override
    protected CrudRepository<Employee, Long> getRepository() {
        return employeeRepository;
    }

    @Override
    public void deleteEmployeeById(long id) {
        EntityManager em = entityFactory.createEntityManager();
        StoredProcedureQuery query = em.createStoredProcedureQuery("DeleteEmployee");
        query.registerStoredProcedureParameter("EmployeeID", Integer.class, ParameterMode.IN);
        query.setParameter("EmployeeID", (int) (long)id);
        query.execute();
        em.clear();
        em.close();
    }

    public Employee saveEmployeeById(Employee emp) {
        EntityManager em = entityFactory.createEntityManager();
        StoredProcedureQuery query = em.createStoredProcedureQuery("CreateEmployee");
        query.registerStoredProcedureParameter("Name", String.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("LastName", String.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("EmployeeAddress", String.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("CI", Long.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("Phone", Long.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("CivilState", String.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("BirthDate", Date.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("DependenciesAmount", Integer.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("Experience", String.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("Gender", String.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("ProfileImage", byte[].class, ParameterMode.IN);
        query.registerStoredProcedureParameter("Email", String.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("CreatedBy", Integer.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("EmployeeID", Integer.class, ParameterMode.OUT);

        query.setParameter("Name", emp.getFirst_name());
        query.setParameter("LastName", emp.getLast_name());
        query.setParameter("EmployeeAddress", "address");
        query.setParameter("CI", emp.getCi());
        query.setParameter("Phone", emp.getPhone_number());
        query.setParameter("CivilState", emp.getCivil_state());
        query.setParameter("BirthDate", emp.getBirthdate());
        query.setParameter("DependenciesAmount", emp.getDependencies_amount());
        query.setParameter("Experience", emp.getExperience());
        query.setParameter("Gender", emp.getGender());
        query.setParameter("ProfileImage", emp.getProfile_image());
        query.setParameter("Email", emp.getEmail());
        query.setParameter("CreatedBy", 1);

        query.execute();
        int id = (Integer) query.getOutputParameterValue("EmployeeID");
        em.clear();
        em.close();
        emp.setId(new Long(id));
        return emp;
    }
}