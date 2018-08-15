/**
 * @author: Edson A. Terceros T.
 */

package com.dh.spring5webapp.services;

import com.dh.spring5webapp.model.Rol;

import java.util.List;

public interface RoleService extends GenericService<Rol>{
    public void deleteRoleById(long id);
}