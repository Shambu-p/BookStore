package com.BookStore.Exceptions;

public class BookNotFoundException extends Exception {
    
    private static final long serialVersionUID = 1L;

	public BookNotFoundException(){
		super("book not found!");
	}

}
