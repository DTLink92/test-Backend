package com.dh.spring5webapp.services;

import com.dh.spring5webapp.model.AccidentCauseGroup;

import com.dh.spring5webapp.repositories.AccidentCauseGroupRepository;
import com.dh.spring5webapp.repositories.AccidentTypeRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

@Service
public class AccidentCauseGroupServiceImpl  extends GenericServiceImpl<AccidentCauseGroup>implements AccidentCauseGroupService{
    private static Logger logger = LoggerFactory.getLogger(AccidentTypeServiceImpl.class);
    private AccidentCauseGroupRepository accidentCauseGroupRepository;

    public AccidentCauseGroupServiceImpl(AccidentCauseGroupRepository accidentCauseGroupRepository) {
        this.accidentCauseGroupRepository = accidentCauseGroupRepository;
    }

    @Override
    protected CrudRepository<AccidentCauseGroup, Long> getRepository(){
        return accidentCauseGroupRepository;
    }
}
