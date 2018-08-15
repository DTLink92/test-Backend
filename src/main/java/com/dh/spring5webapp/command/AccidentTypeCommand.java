package com.dh.spring5webapp.command;

import com.dh.spring5webapp.model.AccidentType;

public class AccidentTypeCommand {
    private Long id;
    private String name_type_accident;
    private String code_type_accident;

    public AccidentTypeCommand() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName_type_accident() {
        return name_type_accident;
    }

    public void setName_type_accident(String name_type_accident) {
        this.name_type_accident = name_type_accident;
    }

    public String getCode_type_accident() {
        return code_type_accident;
    }

    public void setCode_type_accident(String code_type_accident) {
        this.code_type_accident = code_type_accident;
    }
    public AccidentTypeCommand(AccidentType accidentType){
        this.setId(accidentType.getId());
        this.setName_type_accident(accidentType.getName_type_accident());
        this.setCode_type_accident(accidentType.getCode_type_accident());

    }
    public AccidentType toAccidentType(){

        AccidentType accidentType= new AccidentType();
        accidentType.setName_type_accident(getName_type_accident());
        accidentType.setCode_type_accident(getCode_type_accident());
        accidentType.setId(getId());
        return accidentType;
    }
}

