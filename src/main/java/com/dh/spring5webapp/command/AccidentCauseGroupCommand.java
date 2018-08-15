package com.dh.spring5webapp.command;

import com.dh.spring5webapp.model.AccidentCause;
import com.dh.spring5webapp.model.AccidentCauseGroup;
import com.dh.spring5webapp.model.ModelBase;

import java.util.ArrayList;
import java.util.List;

public class AccidentCauseGroupCommand  {
    private String title;
    private Long id;
    private List<AccidentCauseCommand> causes;
public AccidentCauseGroupCommand (AccidentCauseGroup accidentCauseGroup){
    this.setTitle(accidentCauseGroup.getTitle());
    this.setId(accidentCauseGroup.getId());
    this.causes = new ArrayList<>();
    for (AccidentCause cause: accidentCauseGroup.getAccidentCause()) {
        this.causes.add(new AccidentCauseCommand(cause));
    }

}
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public List<AccidentCauseCommand> getCauses() {
        return causes;
    }

    public void setCauses(List<AccidentCauseCommand> causes) {
        this.causes = causes;
    }
    public AccidentCauseGroup toAccidentCauseGroup(){
        AccidentCauseGroup accidentCauseGroup = new AccidentCauseGroup();
        accidentCauseGroup.setTitle(getTitle());
        accidentCauseGroup.setId(getId());
        return accidentCauseGroup;
    }
}
