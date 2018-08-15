package com.dh.spring5webapp.services;

import com.dh.spring5webapp.model.DWAccident;
import com.dh.spring5webapp.model.DWArea;
import com.dh.spring5webapp.model.DWEquipment;

import java.util.List;

public interface DW_GetDataService extends GenericService<DWAccident> {

    List<DWAccident> findAllDWAccidents() ;
    List<DWArea> findAllDWAreas();
    List<DWEquipment> findAllDWEquipments();
}
