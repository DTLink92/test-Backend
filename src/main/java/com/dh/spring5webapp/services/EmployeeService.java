/**
 * @author: Edson A. Terceros T.
 */

package com.dh.spring5webapp.services;

import com.dh.spring5webapp.model.Employee;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.Repository;
import org.springframework.data.repository.query.Param;

import java.io.InputStream;
import java.util.List;

public interface EmployeeService extends GenericService<Employee>{
    public  void deleteEmployeeById(long id);
    public Employee saveEmployeeById(Employee emp);
}