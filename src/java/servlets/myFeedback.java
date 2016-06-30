package servlets;

import classes.App;
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

@WebServlet(name = "myFeedback", urlPatterns = {"/myFeedback"})
public class myFeedback extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter pw = resp.getWriter();
        resp.setContentType("text/json");

        try {
            Class.forName(App.DRIVER_CLASS);

            try (Connection con = DriverManager.getConnection(App.CONNECTION_STRING);
                    PreparedStatement st = con.prepareStatement("insert into feedback values(?, ?, ?)");) {
                st.setString(1, req.getParameter("roll_no"));
                st.setString(2, req.getParameter("name"));
                st.setString(3, req.getParameter("feedback"));

                int count = st.executeUpdate();

                if (count == 1) {
                    pw.println("{\"status\" : 1}");
                } else {
                    pw.println("{\"status\" : 0}");
                }
            } catch (Exception ex) {
                System.out.println("Error - " + ex.getMessage());
            }
        } catch (Exception ex) {
            System.out.println("Error in myFeedback.java -> " + ex.getMessage());
        }
    }
}