package com.BookStore.AssetsManager;

import java.io.*;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/image_assets")
public class FileAssets extends HttpServlet {
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // int BUFF_SIZE = 1024;
        // String home_address = "/home/abnet/Documents/Projects/BookStore/demo/";
        String home_address = "D:\\book_store\\BookStore\\";
        // byte[] buffer = new byte[BUFF_SIZE];
        String asset_type = request.getParameter("type");
        String asset_name = request.getParameter("name");
        // File fileMp3 = new File(home_address + ((!asset_type.equals("cover")) ? "/src/main/webapp/assets/" : "/src/main/resources/book_covers/") + asset_name);
        File fileMp3 = new File(home_address + ((!asset_type.equals("cover")) ? "\\src\\main\\webapp\\assets\\" : "\\src\\main\\resources\\book_covers\\") + asset_name);

        // response.setHeader("Content-Disposition", "filename=\"hoge.txt\"");
        // BufferedReader br = new BufferedReader(fileMp3);
        response.setContentLength((int) fileMp3.length());
        response.setContentType("image/"+(asset_type.equals("cover") ? "png" : asset_type));
        OutputStream os = response.getOutputStream();
        FileInputStream fis = new FileInputStream(fileMp3);
        
        try {
            int byteRead = 0;
            while ((byteRead = fis.read()) != -1) {
                // os.write(byteRead, 0, byteRead);
                os.write(byteRead);
            }
            os.flush();
        } catch (Exception excp) {
            excp.printStackTrace();
        } finally {
            os.close();
            fis.close();
        }
    }
}
