package com.BookStore.Exceptions;

public class BSNotAuthorized extends Exception {
    
    private static final long serialVersionUID = 1L;

	public BSNotAuthorized(String role) {
		super("Unauthorized user! Role " + role + " is not authorized for this action!");
	}

}
