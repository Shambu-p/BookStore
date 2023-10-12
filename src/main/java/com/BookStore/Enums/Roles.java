package com.BookStore.Enums;

import java.util.HashMap;

public enum Roles {

    Administrator,
    User,
    Author;

    public static String getRole(String role){
        
        HashMap<String, String> all = new HashMap<String, String>();
        all.put(Roles.Administrator.toString(), "Application Administrator!");
        all.put(Roles.Author.toString(), "Books Author!");
        all.put(Roles.User.toString(), "Application Customer!");

        return all.get(role);

    }
}
