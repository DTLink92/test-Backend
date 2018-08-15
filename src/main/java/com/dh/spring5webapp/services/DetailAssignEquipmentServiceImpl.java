package com.dh.spring5webapp.services;

import com.dh.spring5webapp.model.Accident;
import com.dh.spring5webapp.model.DetailAssignEquipment;
import com.dh.spring5webapp.model.Detail_Assign_Equipment;
import com.dh.spring5webapp.repositories.DetailAssignEquipmentRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

@Service
public class DetailAssignEquipmentServiceImpl extends GenericServiceImpl<Detail_Assign_Equipment> implements DetailAssignEquipmentService {
    @PersistenceUnit
    private EntityManagerFactory entityFactory;
    private static Logger logger = LoggerFactory.getLogger(DetailAssignEquipmentServiceImpl.class);
    private DetailAssignEquipmentRepository repository;
    private EntityManager entityManager;

    public DetailAssignEquipmentServiceImpl(DetailAssignEquipmentRepository repository, EntityManager entityManager) {
        this.repository = repository;
        this.entityManager = entityManager;
    }

    @Override
    protected CrudRepository<Detail_Assign_Equipment, Long> getRepository() {
        return this.repository;
    }

    /*@Override
    public List<Detail_Assign_Equipment> getAllAssignEquip(Long id) {
        return this.repository.findByAssignEquipment_Id(id);
    }*/
    /*@Override
    public List<Detail_Assign_Equipment> getDetailByAssignEquip(Long id) {
        return this.repository.findByAssignEquipment_Id(id);
    }*/
    @Override
    public List<DetailAssignEquipment> getAllAssignEquip(Long id) {
        int idAux = BigInteger.valueOf(id).intValue();
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("GetDetailByAssignEquipID", DetailAssignEquipment.class);
        query.registerStoredProcedureParameter("AssignEquipID", Integer.class, ParameterMode.IN);
        query.setParameter("AssignEquipID",idAux);
        query.execute();
        List<DetailAssignEquipment> detail_assign_equipments = query.getResultList();
        return detail_assign_equipments;
    }

    @Override
    @Transactional
    public List<Object> GroupEquipmentByAssign() {
        String newQuery = "SELECT d.equipment.name, COUNT(*) FROM Detail_Assign_Equipment d " +
                "GROUP BY d.equipment.name";
        List result = this.runQuery(newQuery);
        List<Object> list = new ArrayList<Object>();
        list.addAll(result);
        return list;
    }

    @Override
    @Transactional
    public List<Object> GroupEquipmentByDateAssign() {
        String newQuery = "SELECT d.assign_equipment.date_assign, COUNT(*) FROM Detail_Assign_Equipment d " +
                "GROUP BY d.assign_equipment.date_assign";
        List result = this.runQuery(newQuery);
        List<Object> list = new ArrayList<Object>();
        list.addAll(result);
        return list;
    }

    private List runQuery(String query){
        EntityManager em = entityFactory.createEntityManager();
        List result = em.createQuery(query).getResultList();
        em.clear();
        em.close();
        return result;
    }
}
