/**
 * @author: Edson A. Terceros T.
 */

package com.dh.spring5webapp.services;

import com.dh.spring5webapp.command.ParserUser;
import com.dh.spring5webapp.controller.UserController;
import com.dh.spring5webapp.model.Employee;
import com.dh.spring5webapp.model.System_Project_User;
import com.dh.spring5webapp.repositories.EmployeeRepository;
import com.dh.spring5webapp.repositories.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Service
public class UserServiceImpl extends GenericServiceImpl<System_Project_User> implements UserService {
    @PersistenceUnit
    private EntityManagerFactory entityFactory;
    private static Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
    private UserRepository userRepository;
    private ParserUser parser = new ParserUser();

    public UserServiceImpl(UserRepository userRepository) {

        this.userRepository = userRepository;
    }

    @Override
    protected CrudRepository<System_Project_User, Long> getRepository() {
        return userRepository;
    }

    @Override
    public List<System_Project_User> getAllUsers() {
        EntityManager em = entityFactory.createEntityManager();
        StoredProcedureQuery query = em.createStoredProcedureQuery("GetSystemUsers");
        query.execute();
        List<Object> result = query.getResultList();
        em.clear();
        em.close();
        List<System_Project_User> users = new ArrayList<>();
        result.forEach(object -> {
            users.add(parser.parseToUser(object));
        });
        return users;
    }

    @Override
    public void deleteByUserId(Long id) {
        EntityManager em = entityFactory.createEntityManager();
        StoredProcedureQuery query = em.createStoredProcedureQuery("DeleteSystemUser");
        query.registerStoredProcedureParameter("SystemUserID", Integer.class, ParameterMode.IN);
        query.setParameter("SystemUserID", (int) (long)id);
        query.execute();
        em.clear();
        em.close();
    }

    @Override
    public System_Project_User login(String login, String password)
    {
        EntityManager em = entityFactory.createEntityManager();
        StoredProcedureQuery query = em.createStoredProcedureQuery("LoginUser");
        query.registerStoredProcedureParameter("UserLogin", String.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("Password", String.class, ParameterMode.IN);
        query.setParameter("UserLogin", login);
        query.setParameter("Password", password);
        List<Object> result = query.getResultList();
        em.clear();
        em.close();
        List<System_Project_User> users = new ArrayList<>();
        result.forEach(object -> {
            users.add(parser.parseToUser(object));
        });
        return  users.get(0);
    }

    @Override
    public System_Project_User getUserById(Long id)
    {
        EntityManager em = entityFactory.createEntityManager();
        StoredProcedureQuery query = em.createStoredProcedureQuery("GetSystemUserByID");
        query.registerStoredProcedureParameter("SystemUserID", Integer.class, ParameterMode.IN);
        query.setParameter("SystemUserID", (int) (long)id);
        List<Object> result = query.getResultList();
        em.clear();
        em.close();
        List<System_Project_User> users = new ArrayList<>();
        result.forEach(object -> {
            users.add(parser.parseToUser(object));
        });
        return  users.get(0);
    }

    @Override
    public System_Project_User updateUser(System_Project_User user) {
        EntityManager em = entityFactory.createEntityManager();
        StoredProcedureQuery query = em.createStoredProcedureQuery("UpdatePasswordSystemUser");
        query.registerStoredProcedureParameter("UserLogin", String.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("Password", String.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("ModifiedBy", Integer.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("UserID", Integer.class, ParameterMode.IN);
        query.setParameter("UserLogin", user.getUser_login());
        query.setParameter("Password", user.getUser_password());
        query.setParameter("ModifiedBy", 1);
        query.setParameter("UserID", user.getId());
        return  user;
    }

    @Override
    public System_Project_User createUser(System_Project_User user) {
        EntityManager em = entityFactory.createEntityManager();
        StoredProcedureQuery query = em.createStoredProcedureQuery("CreateSystemUser");
        query.registerStoredProcedureParameter("Name", String.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("LastName", String.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("UserLogin", String.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("Password", String.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("RolID", Integer.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("CreatedBy", Integer.class, ParameterMode.IN);
        query.setParameter("Name", user.getName());
        query.setParameter("LastName", user.getLast_name());
        query.setParameter("UserLogin", user.getUser_login());
        query.setParameter("Password", user.getUser_password());
        query.setParameter("RolID", user.getRol().getId());
        query.setParameter("CreatedBy", 1);
        return  user;
    }
}