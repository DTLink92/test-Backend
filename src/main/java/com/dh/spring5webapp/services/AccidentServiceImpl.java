package com.dh.spring5webapp.services;

import com.dh.spring5webapp.model.Accident;
import com.dh.spring5webapp.model.EmployeeAccident;
import com.dh.spring5webapp.repositories.AccidentRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.ParameterMode;
import javax.persistence.StoredProcedureQuery;
import javax.ws.rs.core.Response;
import java.math.BigInteger;
import java.sql.Time;
import java.util.Date;
import java.util.List;

@Service
public class AccidentServiceImpl extends GenericServiceImpl<Accident> implements AccidentService{

    private static Logger logger = LoggerFactory.getLogger(AccidentServiceImpl.class);
    private AccidentRepository accidentRepository;
    private EntityManager entityManager;

    public AccidentServiceImpl(AccidentRepository accidentRepository, EntityManager entityManager) {
        this.entityManager = entityManager;
        this.accidentRepository = accidentRepository;
    }

    @Override
    protected CrudRepository<Accident, Long> getRepository() {
            return accidentRepository;
    }

    @Override
    public List<Accident> findAll() {
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("SP_Accident_getAccidents", Accident.class);
        // query.registerStoredProcedureParameter("input_number", Integer.class, ParameterMode.IN);
        // query.setParameter("input_number", 10000);
        query.execute();

        List<Accident> accidents = query.getResultList();
        return accidents;
    }

    @Override
    public Accident findById(Long id) {
        int idAux = BigInteger.valueOf(id).intValue();
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("SP_Accident_getAccidentByID", Accident.class);
        query.registerStoredProcedureParameter("accidentID", Integer.class, ParameterMode.IN);
        query.setParameter("accidentID",idAux);
        query.execute();
        Accident accident = (Accident) query.getSingleResult();
        return accident;
    }

    @Override
    public void deleteById(Long id) {
        int idAux = BigInteger.valueOf(id).intValue();
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("SP_Accident_DeleteAccident");
        query.registerStoredProcedureParameter("accidentID", Integer.class, ParameterMode.IN);
        query.setParameter("accidentID",idAux);
        query.execute();
    }

    @Override
    public int saveAccident(Accident model) {
            StoredProcedureQuery query = entityManager.createStoredProcedureQuery("SP_Accident_insertAccident");
            query.registerStoredProcedureParameter("nameAccidentado", String.class, ParameterMode.IN);
            query.registerStoredProcedureParameter("date_accident", Date.class, ParameterMode.IN);
            query.registerStoredProcedureParameter("hour_accident", Date.class, ParameterMode.IN);
            query.registerStoredProcedureParameter("place_accident", String.class, ParameterMode.IN);
            query.registerStoredProcedureParameter("gravity_accident", String.class, ParameterMode.IN);
            query.registerStoredProcedureParameter("description_accident", String.class, ParameterMode.IN);
            query.registerStoredProcedureParameter("accidentTypeID", Integer.class, ParameterMode.IN);
            query.registerStoredProcedureParameter("areaID", Integer.class, ParameterMode.IN);
            query.registerStoredProcedureParameter("CreatedBy", Integer.class, ParameterMode.IN);
            query.registerStoredProcedureParameter("accidentID", Integer.class, ParameterMode.OUT);

            query.setParameter("nameAccidentado", model.getNameAccidentado());
            query.setParameter("date_accident", model.getDate_accident());
            query.setParameter("hour_accident", model.getHour_accident());
            query.setParameter("place_accident", model.getPlace_accident());
            query.setParameter("gravity_accident", model.getGravity_accident());
            query.setParameter("description_accident", model.getDescription_accident());
            query.setParameter("accidentTypeID", model.getAccidentTypeID());
            query.setParameter("areaID", model.getAreaID());
            query.setParameter("CreatedBy", 1);
            // query.registerStoredProcedureParameter("accidentID", Integer.class, ParameterMode.OUT);

            query.execute();

            int accidentID = (int) query.getOutputParameterValue("accidentID");
            entityManager.clear();
            entityManager.close();
            return accidentID;

    }

    @Override
    public int editAccident(Accident model) {
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("SP_Accident_UpdateAccident");
        query.registerStoredProcedureParameter("nameAccidentado", String.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("date_accident", Date.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("hour_accident", Date.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("place_accident", String.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("gravity_accident", String.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("description_accident", String.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("accidentTypeID", Integer.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("areaID", Integer.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("ModifiedBy", Integer.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("accidentID", Integer.class, ParameterMode.IN);

        int idAux = BigInteger.valueOf(model.getId()).intValue();

        query.setParameter("nameAccidentado", model.getNameAccidentado());
        query.setParameter("date_accident", model.getDate_accident());
        query.setParameter("hour_accident", model.getHour_accident());
        query.setParameter("place_accident", model.getPlace_accident());
        query.setParameter("gravity_accident", model.getGravity_accident());
        query.setParameter("description_accident", model.getDescription_accident());
        query.setParameter("accidentTypeID", model.getAccidentTypeID());
        query.setParameter("areaID", model.getAreaID());
        query.setParameter("ModifiedBy", 1);
        query.setParameter("accidentID", idAux);

        query.execute();
        return idAux;
    }
}

