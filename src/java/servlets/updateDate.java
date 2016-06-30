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

@WebServlet(name = "updateDate", urlPatterns = {"/updateDate"})
public class updateDate extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            resp.setContentType("text/json");
            PrintWriter pw = resp.getWriter();
            Gson g = new Gson();

            String update = req.getParameter("exam-date");
            update = update.replace('T', ' ');
            Class.forName(App.DRIVER_CLASS);

            try (
                    Connection con = DriverManager.getConnection(App.CONNECTION_STRING);
                    PreparedStatement st = con.prepareStatement("update exam_details set exam_date = convert(datetime, ?, 120)");) {
                st.setString(1, update);
                int count = st.executeUpdate();

                // JsonObjectBuilder builder = Json.createObjectBuilder();
                Status s;
                if (count == 1) {
                    s = new Status(1);
                } else {
                    s = new Status(0);
                }

                pw.println(g.toJson(s));
            } catch (Exception ex) {
                System.out.println("Error in updateDate.java - " + ex.getMessage());
            }

        } catch (Exception ex) {
            System.out.println("Error in updateDate.java - " + ex.getMessage());
        }
    }
}