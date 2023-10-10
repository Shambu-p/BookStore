package com.BookStore.Exceptions;

public class BookNotAvailable extends Exception {
    
    private static final long serialVersionUID = 1L;

	public BookNotAvailable() {
		super("Available book copies are not enough to fulfill the request!");
	}

}
