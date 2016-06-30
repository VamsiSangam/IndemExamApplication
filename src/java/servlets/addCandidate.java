package servlets;

import classes.App;
import classes.Status;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "addCandidate", urlPatterns = {"/addCandidate"})
public class addCandidate extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            resp.setContentType("text/json");
            PrintWriter pw = resp.getWriter();
            Gson g = new Gson();

            if (req.getParameter("roll_no").equals("") || req.getParameter("name").equals("")) {
                Status s = new Status(0);
                pw.println(g.toJson(s));

                return;
            }

            Class.forName(App.DRIVER_CLASS);

            try (
                    Connection con = DriverManager.getConnection(App.CONNECTION_STRING);
                    PreparedStatement st = con.prepareStatement("insert into students(roll_no, name) values(?, ?)");) {

                st.setString(1, req.getParameter("roll_no"));
                st.setString(2, req.getParameter("name"));

                int count = st.executeUpdate();
                Status s;

                if (count == 1) {
                    s = new Status(1);
                } else {
                    s = new Status(0);
                }

                pw.println(g.toJson(s));
            } catch (Exception ex) {
                System.out.println("Error in addCandidate.java  - " + ex.getMessage());
            }
        } catch (Exception ex) {
            System.out.println("Error in addCandidate.java - " + ex.getMessage());
        }
    }
}
