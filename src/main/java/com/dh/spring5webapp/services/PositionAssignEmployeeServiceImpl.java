package com.dh.spring5webapp.services;

import com.dh.spring5webapp.model.Project_Contract;
import com.dh.spring5webapp.repositories.PositionAssignEmployeeRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class PositionAssignEmployeeServiceImpl extends GenericServiceImpl<Project_Contract> implements PositionAssignEmployeeService {

    @PersistenceUnit
    private EntityManagerFactory entityFactory;
    private static Logger logger = LoggerFactory.getLogger(EmployeeServiceImpl.class);
    private PositionAssignEmployeeRepository positionAssignEmployeeRepository;

    public PositionAssignEmployeeServiceImpl(PositionAssignEmployeeRepository positionAssignEmployeeRepository) {
        this.positionAssignEmployeeRepository = positionAssignEmployeeRepository;
    }

    @Override
    protected CrudRepository<Project_Contract, Long> getRepository() {
        return this.positionAssignEmployeeRepository;
    }

    @Override
    public List<Project_Contract> findByPosition_Id(Long id) {
        return this.positionAssignEmployeeRepository.findByPosition_Id(id);
    }

    @Override
    @Transactional
    public List<Object> GroupEmployeeByPosition() {
        String newQuery = "SELECT d.position.name, COUNT(*) FROM Project_Contract d " +
                "GROUP BY d.position.id, d.position.name";
        List result = this.runQuery(newQuery);
        List<Object> list = new ArrayList<Object>();
        list.addAll(result);
        return list;
    }

    @Override
    @Transactional
    public List<Object> GroupEmployeeByGenre() {
        String newQuery = "SELECT e.gender, COUNT(*) FROM Employee e " +
                "GROUP BY e.gender";
        List result = this.runQuery(newQuery);
        List<Object> list = new ArrayList<Object>();
        list.addAll(result);
        return list;
    }

    @Override
    @Transactional
    public List<Object> GroupEmployeeBySalary() {
        String newQuery = "SELECT d.salary, COUNT(*) FROM Project_Contract d " +
                "GROUP BY d.salary";
        List result = this.runQuery(newQuery);
        List<Object> list = new ArrayList<Object>();
        list.addAll(result);
        return list;
    }

    @Override
    public void deleteContractById(Long id) {
        EntityManager em = entityFactory.createEntityManager();
        StoredProcedureQuery query = em.createStoredProcedureQuery("DeleteProjectContract");
        query.registerStoredProcedureParameter("ContractID", Integer.class, ParameterMode.IN);
        query.setParameter("ContractID", (int) (long)id);
        query.execute();
        em.clear();
        em.close();
    }

    private List runQuery(String query){
        EntityManager em = entityFactory.createEntityManager();
        List result = em.createQuery(query).getResultList();
        em.clear();
        em.close();
        return result;
    }

    public Project_Contract saveContractById(Project_Contract pc) {
        EntityManager em = entityFactory.createEntityManager();
        StoredProcedureQuery query = em.createStoredProcedureQuery("CreateProjectContract");
        query.registerStoredProcedureParameter("ContractDescription", String.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("HireDate", Date.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("EndDate", Date.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("Salary", Long.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("PositionID", Integer.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("EmployeeID", Integer.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("SupervisorID", Integer.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("CreatedBy", Integer.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("ProjectID", Integer.class, ParameterMode.IN);

        query.registerStoredProcedureParameter("ContractID", Integer.class, ParameterMode.OUT);

        query.setParameter("ContractDescription", pc.getContract_description());
        query.setParameter("HireDate", pc.getHire_date());
        query.setParameter("EndDate", pc.getEnd_date());
        query.setParameter("Salary", pc.getSalary());
        query.setParameter("PositionID", (int) (long)pc.getPosition().getId());
        query.setParameter("EmployeeID", (int) (long)pc.getEmployee().getId());
        long supervisor = 0;
        if(pc.getSupervisor() != null)
        {
            supervisor = pc.getSupervisor().getId();
        }
        query.setParameter("SupervisorID", (int) (long)supervisor);
        query.setParameter("CreatedBy", 1);
        query.setParameter("ProjectID", (int) (long)pc.getProject().getId());

        query.execute();
        int id = (Integer) query.getOutputParameterValue("ContractID");
        em.clear();
        em.close();
        pc.setId(new Long(id));
        return pc;
    }
}
