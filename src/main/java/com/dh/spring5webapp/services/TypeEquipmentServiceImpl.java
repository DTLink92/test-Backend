package com.dh.spring5webapp.services;

import com.dh.spring5webapp.model.TypeEquipment;
import com.dh.spring5webapp.repositories.TypeEquipmentRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;


@Service
public class TypeEquipmentServiceImpl extends GenericServiceImpl<TypeEquipment> implements TypeEquipmentService {
    private static Logger logger = LoggerFactory.getLogger(TypeEquipmentServiceImpl.class);

    private TypeEquipmentRepository repository;

    public TypeEquipmentServiceImpl(TypeEquipmentRepository repository) {
        this.repository = repository;
    }

    @Override
    protected CrudRepository<TypeEquipment, Long> getRepository() {
        return repository;
    }


}
