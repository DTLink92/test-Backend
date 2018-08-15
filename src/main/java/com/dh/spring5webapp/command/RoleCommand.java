package com.dh.spring5webapp.command;

import com.dh.spring5webapp.model.ModelBase;
import com.dh.spring5webapp.model.Rol;
import com.dh.spring5webapp.model.System_Project_User;

public class RoleCommand extends ModelBase {
    private String roleName;

    public RoleCommand() {

    }

    public RoleCommand(Rol role) {
        this.setRoleName(role.getName());
        this.setId(role.getId());
    }

    public Rol toRole() {
        Rol role = new Rol();
        role.setName(this.getRoleName());
        return role;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
}
