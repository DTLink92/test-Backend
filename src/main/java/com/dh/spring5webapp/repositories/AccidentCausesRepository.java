/**
 * @author: juan pablo mejia
 */

package com.dh.spring5webapp.repositories;

import com.dh.spring5webapp.model.AccidentCauses;
import org.springframework.data.repository.CrudRepository;

public interface AccidentCausesRepository extends CrudRepository<AccidentCauses, Long> {
}
