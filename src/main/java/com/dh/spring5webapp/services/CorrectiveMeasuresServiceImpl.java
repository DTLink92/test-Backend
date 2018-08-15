/**
 * @author: Juan Pablo Mejia.
 */

package com.dh.spring5webapp.services;

import com.dh.spring5webapp.model.CorrectiveMeasures;
import com.dh.spring5webapp.repositories.CorrectiveMeasuresRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;


@Service
public class CorrectiveMeasuresServiceImpl extends GenericServiceImpl<CorrectiveMeasures> implements CorrectiveMeasuresService {
    private static Logger logger = LoggerFactory.getLogger(CorrectiveMeasuresServiceImpl.class);

    private CorrectiveMeasuresRepository repository;

    public CorrectiveMeasuresServiceImpl(CorrectiveMeasuresRepository repository) {
        this.repository = repository;
    }

    @Override
    protected CrudRepository<CorrectiveMeasures, Long> getRepository() {
        return this.repository;
    }

}