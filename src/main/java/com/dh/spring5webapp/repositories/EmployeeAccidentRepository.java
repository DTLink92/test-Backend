/**
 * @author: Juan Pablo Mejia C.
 */

package com.dh.spring5webapp.repositories;

import com.dh.spring5webapp.model.EmployeeAccident;
import org.springframework.data.repository.CrudRepository;

public interface EmployeeAccidentRepository extends CrudRepository<EmployeeAccident, Long> {
}
