package com.dh.spring5webapp.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToOne;
import java.util.Date;
import javax.persistence.*;
import java.util.*;

@Entity
@Table(name="System_Project_User")
public class System_Project_User extends ModelBase{

    private String name;
    private String last_name;
    private String user_login;
    private String user_password;

    @OneToOne
    private Rol rol;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getUser_login() {
        return user_login;
    }

    public void setUser_login(String user_login) {
        this.user_login = user_login;
    }

    public String getUser_password() {
        return user_password;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }

    public Rol getRol() {
        return rol;
    }

    public void setRol(Rol role) {
        this.rol = role;
    }
}
