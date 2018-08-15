/**
 * @author: Juan Pablo Mejia.
 */

package com.dh.spring5webapp.services;

import com.dh.spring5webapp.model.AccidentCauses;
import com.dh.spring5webapp.repositories.AccidentCausesRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;


@Service
public class AccidentCausesServiceImpl extends GenericServiceImpl<AccidentCauses> implements AccidentCausesService {
    private static Logger logger = LoggerFactory.getLogger(AccidentCausesServiceImpl.class);

    private AccidentCausesRepository repository;

    public AccidentCausesServiceImpl(AccidentCausesRepository repository) {
        this.repository = repository;
    }

    @Override
    protected CrudRepository<AccidentCauses, Long> getRepository() {
        return this.repository;
    }

}
