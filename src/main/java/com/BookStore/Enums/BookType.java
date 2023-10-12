package com.BookStore.Enums;

import java.util.HashMap;

public enum BookType {
    Fiction,
    Biography,
    Fables,
    History,
    Education;

    public HashMap<String, String> getBookTypes() {

        HashMap<String, String> map = new HashMap<String, String>();

        map.put(BookType.Biography.toString(), "Biography");
        map.put(BookType.Fiction.toString(), "Fictions Content");
        map.put(BookType.History.toString(), "Historic Content");
        map.put(BookType.Education.toString(), "School Text Book");
        map.put(BookType.Fables.toString(), "Fables for Children");

        return map;

    }

    public String getBookType(String type) {

        HashMap<String, String> map = new HashMap<String, String>();

        map.put(BookType.Biography.toString(), "Biography");
        map.put(BookType.Fiction.toString(), "Fictions Content");
        map.put(BookType.History.toString(), "Historic Content");
        map.put(BookType.Education.toString(), "School Text Book");
        map.put(BookType.Fables.toString(), "Fables for Children");

        return map.get(type);

    }

}
