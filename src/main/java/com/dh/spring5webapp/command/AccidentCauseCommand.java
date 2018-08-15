package com.dh.spring5webapp.command;

import com.dh.spring5webapp.model.AccidentCause;


public class AccidentCauseCommand {

    private Long id;
    private String description;
    private Long idGroup;

 public  AccidentCauseCommand (AccidentCause accidentCause){
     this.setDescription(accidentCause.getDescription());
     this.setId(accidentCause.getId());
     this.idGroup = accidentCause.getAccidentCauseGroup().getId();
 }
 public AccidentCause toAccidentCause(){
     AccidentCause accidentCause = new AccidentCause();
     accidentCause.setDescription(getDescription());

     return accidentCause;
 }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Long getIdGroup() {
        return idGroup;
    }

    public void setIdGroup(Long idGroup) {
        this.idGroup = idGroup;
    }

    public AccidentCauseCommand() {


    }

}
