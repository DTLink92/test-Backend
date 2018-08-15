/**
 * @author: Edson A. Terceros T.
 */

package com.dh.spring5webapp.services;

import com.dh.spring5webapp.model.AccidentArea;
import com.dh.spring5webapp.model.Area;

import java.util.List;


public interface AreaService extends GenericService<Area> {
    public AccidentArea findByIdArea(Long id);

     public List<Area> getAreasAsigned(Long id_project);
}