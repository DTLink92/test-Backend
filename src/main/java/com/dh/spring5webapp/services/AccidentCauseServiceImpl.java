package com.dh.spring5webapp.services;

import com.dh.spring5webapp.model.AccidentCause;
import com.dh.spring5webapp.repositories.AccidentCauseRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

@Service
public class AccidentCauseServiceImpl extends GenericServiceImpl<AccidentCause> implements AccidentCauseService {
    private static Logger logger = LoggerFactory.getLogger(AccidentCauseServiceImpl.class);
    private AccidentCauseRepository accidentCauseRepository;

    public AccidentCauseServiceImpl(AccidentCauseRepository accidentCauseRepository) {
        this.accidentCauseRepository = accidentCauseRepository;
    }
    @Override
    protected CrudRepository<AccidentCause, Long>getRepository(){
        return accidentCauseRepository;
    }
}

