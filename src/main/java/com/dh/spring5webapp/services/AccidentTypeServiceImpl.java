package com.dh.spring5webapp.services;

import com.dh.spring5webapp.model.Accident;
import com.dh.spring5webapp.model.AccidentType;
import com.dh.spring5webapp.repositories.AccidentTypeRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.ParameterMode;
import javax.persistence.StoredProcedureQuery;
import java.math.BigInteger;
import java.util.List;

@Service
public class AccidentTypeServiceImpl extends GenericServiceImpl<AccidentType> implements AccidentTypeService{
    private static Logger logger =LoggerFactory.getLogger(AccidentTypeServiceImpl.class);
    private AccidentTypeRepository accidentTypeRepository;
    private EntityManager entityManager;

    public AccidentTypeServiceImpl(AccidentTypeRepository accidentTypeRepository, EntityManager entityManager) {
        this.accidentTypeRepository = accidentTypeRepository;
        this.entityManager = entityManager;
    }
    @Override
    protected CrudRepository<AccidentType, Long> getRepository(){
        return accidentTypeRepository;
    }


    @Override
    public List<AccidentType> findAll() {
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("SP_AccidentType_getAccidentTypes", AccidentType.class);
        query.execute();
        List<AccidentType> accidentTypes = query.getResultList();
        return accidentTypes;
    }

    @Override
    public AccidentType findById(Long id) {
        int idAux = BigInteger.valueOf(id).intValue();
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("SP_AccidentType_getAccidentTypeByID", AccidentType.class);
        query.registerStoredProcedureParameter("accidentTypeID", Integer.class, ParameterMode.IN);
        query.setParameter("accidentTypeID",idAux);
        query.execute();
        AccidentType accidentType = (AccidentType) query.getSingleResult();
        return accidentType;
    }
}
