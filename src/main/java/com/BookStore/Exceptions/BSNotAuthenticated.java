package com.BookStore.Exceptions;

public class BSNotAuthenticated extends Exception {

	private static final long serialVersionUID = 1L;

	public BSNotAuthenticated(){
		super("Unauthorized user!");
	}
}
