package com.dh.spring5webapp.services;

import com.dh.spring5webapp.model.DWAccident;
import com.dh.spring5webapp.model.DWArea;
import com.dh.spring5webapp.model.DWEquipment;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.StoredProcedureQuery;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class DW_GetDataServiceImpl extends GenericServiceImpl<DWAccident> implements DW_GetDataService {

    private EntityManager entityManager;

    public DW_GetDataServiceImpl(EntityManager entityManager)
    {
        this.entityManager = entityManager;
    }
    @Override
    public List<DWAccident> findAllDWAccidents() {
        List<DWAccident> results = new ArrayList<>();
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("GET_DW_ALLDETAILS");
        query.execute();
        List<Object> result = query.getResultList();
        result.forEach(object -> {
            Object[] values = (Object[])object;
            DWAccident dwa = new DWAccident();
            dwa.setArea_id(((BigInteger)values[0]).longValue());
            dwa.setAreaname((String)values[1]);
            dwa.setPositionname((String)values[2]);
            dwa.setEquipmentname((String)values[3]);
            dwa.setEquipmentbrand((String)values[4]);
            dwa.setEmployeeName((String)values[5]);
            dwa.setName_Accidentado((String)values[6]);
            dwa.setDate((Date)values[7]);
            dwa.setPlace((String)values[8]);
            dwa.setGravity((String)values[9]);
            dwa.setDescription((String)values[10]);
            dwa.setType((String)values[11]);
            dwa.setEquipment_id(((BigInteger)values[12]).longValue());
            results.add(dwa);
        });
        return results;
    }

    @Override
    public List<DWArea> findAllDWAreas() {
        List<DWArea> results = new ArrayList<>();
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("GET_DW_DIMAREASYN");
        query.execute();
        List<Object> result = query.getResultList();
        result.forEach(object -> {
            Object[] values = (Object[])object;
            DWArea dwa = new DWArea();
            dwa.setArea_id(((BigInteger)values[0]).longValue());
            dwa.setAreaname((String)values[2]);
            results.add(dwa);
        });
        return results;
    }

    @Override
    public List<DWEquipment> findAllDWEquipments() {

        List<DWEquipment> results = new ArrayList<>();
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("GET_DW_DIMEQUIPMENTSYN");
        query.execute();
        List<Object> result = query.getResultList();
        result.forEach(object -> {
            Object[] values = (Object[])object;
            DWEquipment dwa = new DWEquipment();
            dwa.setEquipment_id(((BigInteger)values[0]).longValue());
            dwa.setEquipmentbrand((String)values[1]);
            dwa.setEquipmentname((String)values[6]);
            results.add(dwa);
        });
        return results;
    }

    @Override
    protected CrudRepository<DWAccident, Long> getRepository() {
        return null;
    }
}
