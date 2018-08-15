package com.dh.spring5webapp.command;

import com.dh.spring5webapp.model.ModelBase;
import com.dh.spring5webapp.model.Rol;
import com.dh.spring5webapp.model.System_Project_User;

public class UserCommand extends ModelBase {
    private String firstName;
    private String lastName;
    private String login;
    private String password;
    //Role
    private String roleName;
    private Long roleId;
    private Long id;

    public UserCommand() {

    }

    public UserCommand(System_Project_User user) {
        this.setFirstName(user.getName());
        this.setLastName(user.getLast_name());
        this.setLogin(user.getUser_login());
        this.setPassword(user.getUser_password());
        this.setRoleId(user.getRol().getId());
        this.setRoleName(user.getRol().getName());
        this.setId(user.getId());
    }

    public System_Project_User toUser(Rol role) {
        System_Project_User user = new System_Project_User();
        user.setName(this.getFirstName());
        user.setLast_name(this.getLastName());
        user.setUser_login(this.login);
        user.setUser_password(this.password);
        user.setRol(role);
        return user;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public void updateValues(System_Project_User user, Rol role) {
        user.setRol(role);
        user.setUser_password(this.getPassword());
        user.setUser_login(this.login);
        user.setLast_name(this.getLastName());
        user.setName(this.getFirstName());
    }

    public UserCommand LoginUser(System_Project_User user) {
        if (user.getUser_login().equals(this.getLogin())&&
                user.getUser_password().equals(this.getPassword()))
        {
            return this;
        }
        return new UserCommand();
    }
}
