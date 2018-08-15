/**
 * @author: edson
 */

package com.dh.spring5webapp.repositories;

import com.dh.spring5webapp.model.Employee;
import com.dh.spring5webapp.model.System_Project_User;
import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<System_Project_User, Long> {

}
