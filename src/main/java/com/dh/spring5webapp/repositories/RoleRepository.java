/**
 * @author: edson
 */

package com.dh.spring5webapp.repositories;

import com.dh.spring5webapp.model.Employee;
import com.dh.spring5webapp.model.Rol;
import org.springframework.data.repository.CrudRepository;

public interface RoleRepository extends CrudRepository<Rol, Long> {
}
