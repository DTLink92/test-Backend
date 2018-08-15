/**
 * @author: Edson A. Terceros T.
 */

package com.dh.spring5webapp.services;

import com.dh.spring5webapp.model.System_Project_User;

import java.util.List;

public interface UserService extends GenericService<System_Project_User>{
    public List<System_Project_User> getAllUsers();
    public void deleteByUserId(Long id);
    public System_Project_User login(String login, String password);
    public System_Project_User getUserById(Long id);
    public System_Project_User updateUser(System_Project_User user);
    public System_Project_User createUser(System_Project_User user);
}