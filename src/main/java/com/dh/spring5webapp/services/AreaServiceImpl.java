package com.dh.spring5webapp.services;

import com.dh.spring5webapp.model.Accident;
import com.dh.spring5webapp.model.AccidentArea;
import com.dh.spring5webapp.model.AccidentType;
import com.dh.spring5webapp.model.Area;
import com.dh.spring5webapp.repositories.AreaRepository;
import com.dh.spring5webapp.repositories.ProjectRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.ParameterMode;
import javax.persistence.StoredProcedureQuery;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

@Service
public class AreaServiceImpl extends GenericServiceImpl<Area> implements AreaService{

    private static Logger logger = LoggerFactory.getLogger(AreaServiceImpl.class);

    private AreaRepository areaRepository;
    private EntityManager entityManager;

    public AreaServiceImpl(AreaRepository areaRepository, EntityManager entityManager) {
        this.areaRepository = areaRepository;
        this.entityManager = entityManager;
    }

    @Override
    protected CrudRepository<Area, Long> getRepository() {
        return this.areaRepository;
    }

    @Override
    public AccidentArea findByIdArea(Long id) {
        int idAux = BigInteger.valueOf(id).intValue();
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("get_area_by_id", AccidentArea.class);
        query.registerStoredProcedureParameter("id_area", Integer.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("UserLogin", Integer.class, ParameterMode.IN);
        query.setParameter("id_area",idAux);
        query.setParameter("UserLogin",1);
        query.execute();
        AccidentArea area = (AccidentArea) query.getSingleResult();
        return area;
    }

    public List<Area> getAreasAsigned(Long id_project){
        List<Area> areas = new ArrayList<>();
        int id_int = BigInteger.valueOf(id_project).intValue();
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("get_areas_by_project",Area.class);
        query.registerStoredProcedureParameter("id_project", Integer.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("UserLogin", Integer.class, ParameterMode.IN);
        query.setParameter("id_project",id_int);
        query.setParameter("UserLogin",1);
        query.execute();
        query.getResultList().forEach(o -> {
            areas.add((Area)o);
        });

        return areas;


    }

}
