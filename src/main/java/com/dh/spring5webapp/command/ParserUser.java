package com.dh.spring5webapp.command;

import com.dh.spring5webapp.model.Rol;
import com.dh.spring5webapp.model.System_Project_User;

import java.util.List;

public class ParserUser{
    public ParserUser()
    {}

    public System_Project_User parseToUser(Object object)
    {
        Object[] values = (Object[])object;
        System_Project_User newUser = new System_Project_User();
        Rol rol = new Rol();
        if(values.length == 7)
        {
            newUser.setId(new Long((Integer)values[0]));
            newUser.setName((String)values[1]);
            newUser.setLast_name((String)values[2]);
            newUser.setUser_login((String)values[3]);
            newUser.setUser_password((String)values[4]);
            rol.setId(new Long((Integer)values[5]));
            rol.setName((String)values[6]);
        }
        newUser.setRol(rol);
        return newUser;
    }
}
