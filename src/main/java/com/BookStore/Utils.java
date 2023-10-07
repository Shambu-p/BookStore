package com.BookStore;

import javax.servlet.http.HttpServletRequest;

public class Utils {
    
    public static String projectName = "demo";

    public static String getAddress(HttpServletRequest request, String path) {
        String protocol = request.getProtocol();
        String server = request.getServerName();
        int port = request.getServerPort();

        return (protocol.equals("HTTP/1.0") ? "http://" : "https://") + server + ((port == 80 || port == 443) ? "" : ":"+port) + "/" + Utils.projectName + path;

    }
}
