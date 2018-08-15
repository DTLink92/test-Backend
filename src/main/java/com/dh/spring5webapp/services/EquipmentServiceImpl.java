

package com.dh.spring5webapp.services;

import com.dh.spring5webapp.model.Equipment;
import com.dh.spring5webapp.repositories.EquipmentRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;


@Service
public class EquipmentServiceImpl extends GenericServiceImpl<Equipment> implements EquipmentService {
    private static Logger logger = LoggerFactory.getLogger(EquipmentServiceImpl.class);

    private EquipmentRepository repository;

    public EquipmentServiceImpl(EquipmentRepository repository) {
        this.repository = repository;
    }

    @Override
    protected CrudRepository<Equipment, Long> getRepository() {
        return repository;
    }

    /*@Override
    public List<Equipment> getAllTypes(Long id) {
        return this.repository.findByTypeEquipment_Id(id);
    }*/
}