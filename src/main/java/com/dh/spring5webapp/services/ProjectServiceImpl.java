/**
 * @author: Edson A. Terceros T.
 */

package com.dh.spring5webapp.services;

import com.dh.spring5webapp.command.ProjectCommand;
import com.dh.spring5webapp.model.AuditHistory;
import com.dh.spring5webapp.model.Project;
import com.dh.spring5webapp.repositories.ProjectRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.jdbc.object.StoredProcedure;
import org.springframework.stereotype.Service;
import javax.persistence.EntityManager;
import javax.persistence.ParameterMode;
import javax.persistence.StoredProcedureQuery;
import javax.ws.rs.core.Response;
import java.util.ArrayList;
import java.util.List;

@Service
public class ProjectServiceImpl extends GenericServiceImpl<Project> implements ProjectService {
    private static Logger logger = LoggerFactory.getLogger(ProjectServiceImpl.class);
    EntityManager entityManager;

    private ProjectRepository repository;

    public ProjectServiceImpl(ProjectRepository repository, EntityManager entityManager) {
        this.repository = repository;
        this.entityManager = entityManager;
    }

    @Override
    protected CrudRepository<Project, Long> getRepository() {
        return repository;
    }


    @Override
    public List<Project> findAll(){
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("get_all_project", Project.class);
        query.execute();
        List<Project> projectList = query.getResultList();
        entityManager.clear();
        entityManager.close();
        return projectList;
    }

    @Override
    public Project findById(Long id){
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("get_project_by_id",Project.class);
        query.registerStoredProcedureParameter("id_project", Integer.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("UserLogin", Integer.class, ParameterMode.IN);
        Integer id_integer = Integer.valueOf(id.intValue());
        query.setParameter("id_project", id_integer); // OJO CON EL TIPO DE DATO
        query.setParameter("UserLogin", 1); // OJO AUN NO SE MANDEJA CONTROL DE USUARIOS
        query.execute();
        Project res = (Project)query.getSingleResult();
        entityManager.clear();
        entityManager.close();
        return res;

    }
}