package com.dh.spring5webapp.services;

import com.dh.spring5webapp.model.Assign_Equipment;
import com.dh.spring5webapp.repositories.AssignEquipmentRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

@Service
public class AssignEquipmentServiceImpl extends GenericServiceImpl<Assign_Equipment> implements AssignEquipmentService {

    private static Logger logger = LoggerFactory.getLogger(AssignEquipmentServiceImpl.class);

    private AssignEquipmentRepository repository;

    public AssignEquipmentServiceImpl(AssignEquipmentRepository repository) {
        this.repository = repository;
    }

    @Override
    protected CrudRepository<Assign_Equipment, Long> getRepository() {
        return this.repository;
    }
}
