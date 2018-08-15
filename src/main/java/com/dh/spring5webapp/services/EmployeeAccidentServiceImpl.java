/**
 * @author: Juan Pablo Mejia.
 */

package com.dh.spring5webapp.services;

import com.dh.spring5webapp.model.EmployeeAccident;
import com.dh.spring5webapp.repositories.EmployeeAccidentRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;


@Service
public class EmployeeAccidentServiceImpl extends GenericServiceImpl<EmployeeAccident> implements EmployeeAccidentService {
    private static Logger logger = LoggerFactory.getLogger(EmployeeAccidentServiceImpl.class);

    private EmployeeAccidentRepository repository;

    public EmployeeAccidentServiceImpl(EmployeeAccidentRepository repository) {
        this.repository = repository;
    }

    @Override
    protected CrudRepository<EmployeeAccident, Long> getRepository() {
        return this.repository;
    }


}