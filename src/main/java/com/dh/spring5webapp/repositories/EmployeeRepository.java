/**
 * @author: edson
 */

package com.dh.spring5webapp.repositories;

import com.dh.spring5webapp.model.Employee;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface EmployeeRepository extends CrudRepository<Employee, Long> {
}
