package com.dh.spring5webapp.repositories;

import com.dh.spring5webapp.model.AccidentType;
import org.springframework.data.repository.CrudRepository;

public interface AccidentTypeRepository extends CrudRepository<AccidentType, Long> {
}
