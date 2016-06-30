package servlets;

import classes.App;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "displayPic", urlPatterns = {"/displayphoto"})
public class displayPic extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Class.forName(App.DRIVER_CLASS);
            Connection con = DriverManager.getConnection(App.CONNECTION_STRING);
            PreparedStatement ps = con.prepareStatement("select image from questions where q_no = ?");
            String q = req.getParameter("q_no");
            ps.setString(1, q);
            ResultSet rs = ps.executeQuery();
            if (!rs.next()) {
                PrintWriter pw = resp.getWriter();
                pw.print("{\"error\" : \"error\"}");
                return;
            }
            byte[] b = rs.getBytes("image");
            resp.setContentType("image/jpg");
            resp.setContentLengthLong((int) b.length);
            InputStream is = new ByteArrayInputStream(b);//= b.getBinaryStream();
            OutputStream os = resp.getOutputStream();
            byte buf[] = new byte[(int) b.length];
            is.read(buf);
            os.write(buf);
            os.close();
            con.close();
            ps.close();
            rs.close();
        } catch (Exception ex) {
            System.out.println("Error in displayPic.java" + ex.getMessage());
        }
    }
}
