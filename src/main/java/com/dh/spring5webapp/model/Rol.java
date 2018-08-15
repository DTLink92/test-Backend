package com.dh.spring5webapp.model;

import javax.persistence.*;
import java.util.*;

@Entity
@Table(name="Rol")
public class Rol  extends ModelBase{

    private String name;
    private Long modified_by;
    private Long created_by;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "rol", cascade = CascadeType.REMOVE)
    private List<System_Project_User> user = new ArrayList<System_Project_User>();

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getModified_by() {
        return modified_by;
    }

    public void setModified_by(Long modified_by) {
        this.modified_by = modified_by;
    }

    public Long getCreated_by() {
        return created_by;
    }

    public void setCreated_by(Long created_by) {
        this.created_by = created_by;
    }

    public List<System_Project_User> getUser() {
        return user;
    }

    public void setUser(List<System_Project_User> user) {
        this.user = user;
    }
}
