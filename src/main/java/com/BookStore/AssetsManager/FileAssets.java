package com.BookStore.AssetsManager;

import java.io.*;

import javax.servlet.http.*;

public class FileAssets extends HttpServlet {
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // int BUFF_SIZE = 1024;
        // String home_address = "/home/abnet/Documents/Projects/BookStore/demo/";
        String home_address = "C:\\Projects\\BookStore\\";
        // byte[] buffer = new byte[BUFF_SIZE];
        String asset_type = request.getParameter("type");
        String asset_name = request.getParameter("name");
        File fileMp3 = new File(home_address + "\\src\\main\\webapp\\assets\\" + asset_name);

        // response.setHeader("Content-Disposition", "filename=\"hoge.txt\"");
        // BufferedReader br = new BufferedReader(fileMp3);
        response.setContentLength((int) fileMp3.length());
        response.setContentType("image/"+asset_type);
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
