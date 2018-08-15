package com.dh.spring5webapp.services;

import com.dh.spring5webapp.model.AuditHistory;
import com.dh.spring5webapp.repositories.AuditHistoryRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.StoredProcedureQuery;
import java.util.List;


@Service
public class AuditHistoryServiceImpl extends GenericServiceImpl<AuditHistory> implements AuditHistoryService {
    static Logger logger = LoggerFactory.getLogger(AuditHistoryServiceImpl.class);
    AuditHistoryRepository auditHistoryRepository;
    EntityManager entityManager;

    public AuditHistoryServiceImpl(AuditHistoryRepository auditHistoryRepository,
                                   EntityManager entityManager) {
        this.auditHistoryRepository = auditHistoryRepository;
        this.entityManager = entityManager;
    }


    @Override
    public List<AuditHistory> findAll() {
        StoredProcedureQuery query = entityManager.createStoredProcedureQuery("SP_getAuditHistory", AuditHistory.class);
        query.execute();
        List<AuditHistory> auditHistories = query.getResultList();

        return auditHistories;
    }

    @Override
    public AuditHistory findById(Long id) {
        return null;
    }

    @Override
    public AuditHistory save(AuditHistory model) {
        return null;
    }

    @Override
    public void deleteById(Long id) {

    }

    @Override
    protected CrudRepository<AuditHistory, Long> getRepository() {
        return null;
    }

    @Override
    public int saveAuditHistory(AuditHistory auditHistory) {
        return 0;
    }
}
