package com.dh.spring5webapp.services;

import com.dh.spring5webapp.exceptions.NotFoundException;
import com.dh.spring5webapp.model.Position;
import com.dh.spring5webapp.model.PositionNew;
import com.dh.spring5webapp.repositories.PositionRepository;
import javafx.geometry.Pos;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import java.lang.reflect.ParameterizedType;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import org.hibernate.Hibernate;

import javax.persistence.EntityManager;
import javax.persistence.ParameterMode;
import javax.persistence.StoredProcedureQuery;
import javax.persistence.criteria.CriteriaBuilder;

@Service
public class PositionServiceImpl extends GenericServiceImpl<Position> implements PositionService{

    private static Logger logger = LoggerFactory.getLogger(Position.class);

    private EntityManager entityManager;
    private PositionRepository repository;

    public PositionServiceImpl(PositionRepository repository, EntityManager entityManager)
    {
        this.repository = repository;
        this.entityManager = entityManager;
    }

    //@Override
    public List<PositionNew> findAllPositions() {
        List<PositionNew> results = new ArrayList<>();
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("Get_Positions",PositionNew.class);
        query.execute();
        results = query.getResultList();
        entityManager.clear();
        entityManager.close();
        //getRepository().findAll().forEach(results::add);
        return results;
    }

    //@Override
    public PositionNew findByIdPosition(Long id) {
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("Get_Position_by_id",PositionNew.class);
        query.registerStoredProcedureParameter("id",Long.class,ParameterMode.IN);
        query.setParameter("id",id);
        query.execute();
        PositionNew result = (PositionNew) query.getSingleResult();

        //Optional<Position> optional = getRepository().findById(id);
        /*if (result != null){// !optional.isPresent()) {
            String typeName = (((ParameterizedType) getClass()
                    .getGenericSuperclass()).getActualTypeArguments()[0]).getTypeName();
            typeName = typeName.substring(typeName.lastIndexOf(".") + 1);
            throw new NotFoundException(typeName + " id:" + id + " Not Found");
        }*/
        return result; //optional.get();
    }

    //@Override
    public PositionNew savePosition (PositionNew model) {
        //return getRepository().save(model);
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("Get_Positions",PositionNew.class);
        query.registerStoredProcedureParameter("created_on",Date.class,ParameterMode.IN);
        query.registerStoredProcedureParameter("updated_on",Date.class,ParameterMode.IN);
        query.registerStoredProcedureParameter("version",Long.class,ParameterMode.IN);
        query.registerStoredProcedureParameter("code",String.class,ParameterMode.IN);
        query.registerStoredProcedureParameter("process",String.class,ParameterMode.IN);
        query.registerStoredProcedureParameter("purpose",String.class,ParameterMode.IN);
        query.registerStoredProcedureParameter("area_id",Long.class,ParameterMode.IN);
        query.registerStoredProcedureParameter("higher_work_position_id",Long.class,ParameterMode.IN);
        query.registerStoredProcedureParameter("Created_by",Long.class,ParameterMode.IN);
        query.registerStoredProcedureParameter("modified_by",Long.class,ParameterMode.IN);
        query.registerStoredProcedureParameter("identity",Integer.class,ParameterMode.INOUT);


        query.setParameter("created_on",model.getCreatedOn());
        query.setParameter("updated_on",model.getUpdatedOn());
        query.setParameter("version",model.getVersion());
        query.setParameter("code",model.getCode());
        query.setParameter("process",model.getProcess());
        query.setParameter("purpose",model.getPurpose());
        query.setParameter("area_id",model.getArea());
        query.setParameter("higher_work_position_id",model.getHigherWorkPosition());
        query.setParameter("Created_by",model.getCreate_by());
        query.setParameter("modified_by",model.getModified_by());

        query.execute();
        entityManager.clear();
        entityManager.close();
        PositionNew result = (PositionNew) query.getSingleResult();

        return result;
    }

    @Override
    public void deleteById(Long id) {
        getRepository().deleteById(id);
    }

    @Override
    protected CrudRepository<Position, Long> getRepository() {
        return repository;
    }

    @Override
    public void DeletePosition(Long id) {
        PositionNew pos = findByIdPosition(id);
        List<Position> list = new LinkedList<Position>();
        /*for (Position position : findAll()) {
            if(position.getHigherWorkPosition().getId() == id){
                position.setHigherWorkPosition(null);
                save(pos);
            }
        }*/
        repository.deleteById(id);

    }
}
