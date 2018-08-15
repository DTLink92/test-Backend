/**
 * @author: Edson A. Terceros T.
 */

package com.dh.spring5webapp.services;

import com.dh.spring5webapp.model.Rol;
import com.dh.spring5webapp.repositories.RoleRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Service
public class RoleServiceImpl extends GenericServiceImpl<Rol> implements RoleService {
    @PersistenceUnit
    private EntityManagerFactory entityFactory;
    private static Logger logger = LoggerFactory.getLogger(RoleServiceImpl.class);
    private RoleRepository roleRepository;

    public RoleServiceImpl(RoleRepository roleRepository) {

        this.roleRepository = roleRepository;
    }

    @Override
    protected CrudRepository<Rol, Long> getRepository() {
        return roleRepository;
    }

    @Override
    public void deleteRoleById(long id) {
        EntityManager em = entityFactory.createEntityManager();
        StoredProcedureQuery query = em.createStoredProcedureQuery("DeleteRol");
        query.registerStoredProcedureParameter("RolID", Integer.class, ParameterMode.IN);
        query.setParameter("RolID", (int) (long)id);
        query.execute();
        em.clear();
        em.close();
    }
}