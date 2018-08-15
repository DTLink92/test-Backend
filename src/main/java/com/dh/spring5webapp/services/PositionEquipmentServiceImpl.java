package com.dh.spring5webapp.services;

import com.dh.spring5webapp.model.Position_Equipment;
import com.dh.spring5webapp.repositories.PositionEquipmentRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PositionEquipmentServiceImpl extends GenericServiceImpl<Position_Equipment> implements PositionEquipmentService{

    private static Logger logger = LoggerFactory.getLogger(PositionEquipmentServiceImpl.class);
    private PositionEquipmentRepository repository;

    public PositionEquipmentServiceImpl(PositionEquipmentRepository repository) {
        this.repository = repository;
    }

    @Override
    protected CrudRepository<Position_Equipment, Long> getRepository() {
        return this.repository;
    }

    @Override
    public List<Position_Equipment> getAllPosition(Long id) {
        return this.repository.findByPosition_Id(id);
    }
}
