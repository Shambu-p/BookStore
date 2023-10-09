package com.BookStore.Models;

public class Order {

    public int Id;
    public int BookId;
    public int UserId;
    public int Quantity;
    public double TotalPrice;

    public User User;
    public Book Book;
}