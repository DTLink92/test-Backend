package com.dh.spring5webapp.repositories;

import com.dh.spring5webapp.model.TypeEquipment;
import org.springframework.data.repository.CrudRepository;
import org.springframework.web.bind.annotation.CrossOrigin;

@CrossOrigin(origins = "http://localhost:4200")
public interface TypeEquipmentRepository extends CrudRepository<TypeEquipment, Long> {
}
