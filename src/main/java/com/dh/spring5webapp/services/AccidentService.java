package com.dh.spring5webapp.services;

import com.dh.spring5webapp.model.Accident;

public interface AccidentService extends GenericService<Accident> {
    public int saveAccident(Accident accident);
    public int editAccident(Accident accident);

}
