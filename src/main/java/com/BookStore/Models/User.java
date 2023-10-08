package com.BookStore.Models;

public class User {
    
    public int Id;
    public String Name;
    public String Email;
    public String Password;
    public String Mobile;
    public String Role;

    public Boolean roleCheck(String role) {
        return this.Role.equals(role);
    }

    public Boolean isNormalUser() {
        return this.roleCheck("user");
    }

    public Boolean isAdminUser() {
        return this.roleCheck("admin");
    }

    public Boolean isAuthorUser() {
        return this.roleCheck("author");
    }

    public String toString() {
        return "{'Id': '"+ this.Id +"', 'Name': '"+ this.Name +"', 'Email': '"+ this.Email +"', 'Password': '"+ this.Password +"', 'Mobile': '"+ this.Mobile +"', 'Role': '"+ this.Role +"'}";
    }

}