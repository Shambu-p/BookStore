package com.BookStore.AssetsManager;

import java.io.*;
import java.nio.charset.Charset;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/assets")
public class Assets extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // int BUFF_SIZE = 1024;
        String home_address = "C:\\Projects\\BookStore\\";
        // String home_address = "/home/abnet/Documents/Projects/BookStore/demo/";
        // byte[] buffer = new byte[BUFF_SIZE];
        String asset_type = request.getParameter("type");
        String asset_name = request.getParameter("name");
        FileReader fileMp3;
        
        if(asset_type.equals("js")) {
            fileMp3 = new FileReader(home_address + "\\src\\main\\webapp\\js\\" + asset_name);
            // fileMp3 = new FileReader(home_address + "/src/main/webapp/js/" + asset_name);
        } else if(asset_type.equals("css")) {
            fileMp3 = new FileReader(home_address + "\\src\\main\\webapp\\css\\" + asset_name);
            // fileMp3 = new FileReader(home_address + "/src/main/webapp/css/" + asset_name);
        } else {
            fileMp3 = new FileReader(home_address + "\\src\\main\\webapp\\webfonts\\" + asset_name);
            // fileMp3 = new FileReader(home_address + "/src/main/webapp/webfonts/" + asset_name);
        }

        // FileInputStream fis = new FileInputStream(fileMp3);
        // response.setHeader("Content-Disposition", "filename=\"hoge.txt\"");
        // response.setContentLength((int) fileMp3.length());
        if(asset_type.equals("image")) {
            response.setContentType("image/"+asset_type);
        } else {
            response.setContentType("text/"+asset_type);
        }
        OutputStream os = response.getOutputStream();
        BufferedReader br = new BufferedReader(fileMp3);

        try {
            // int byteRead = 0;
            // while ((currLine = br.readLine()) != null) {
            while (true) {

                String currLine = br.readLine();
                if(currLine == null) {
                    break;
                }

                os.write(currLine.getBytes(Charset.forName("UTF-8")));

            }
            // while ((byteRead = fis.read()) != -1) {
            //     os.write(buffer, 0, byteRead);
            // }
            os.flush();
        } catch (Exception excp) {
            excp.printStackTrace();
        } finally {
            os.close();
            br.close();
        }

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        // throw new Exception("not implemented yet!");
    }

}
