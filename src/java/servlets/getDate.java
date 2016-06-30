package servlets;

import classes.App;
import classes.Deadline;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "getDate", urlPatterns = {"/getDate"})
public class getDate extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/json");
        PrintWriter pw = resp.getWriter();

        try {
            Class.forName(App.DRIVER_CLASS);
        } catch (Exception ex) {
            System.out.println("Error in getDate.java -> " + ex.getMessage());
        }

        try (
                Connection con = DriverManager.getConnection(App.CONNECTION_STRING);
                Statement st = con.createStatement();) {

            ResultSet rs = st.executeQuery("select datediff(second, getdate(), exam_date) from exam_details");

            int days;
            byte hrs;
            byte min;
            byte sec;

            if (!rs.next()) {
                days = 0;
                hrs = min = sec = 0;
            } else {
                long time = rs.getLong(1);

                sec = (byte) (time % 60);
                time -= (long) sec;
                min = (byte) (time / (60) % 60);
                time -= (long) min * 60l;
                hrs = (byte) (time / (60 * 60) % 24);
                time -= (long) hrs * 60l * 60l;
                days = (int) (time / (60 * 60 * 24));
                time -= (long) days * 60l * 60l * 24l;
            }

            Deadline d = new Deadline(days, hrs, min, sec);
            Gson gson = new Gson();
            String json = gson.toJson(d);
            pw.print(json);
            rs.close();

        } catch (Exception ex) {
            System.out.println("Error in getDate.java - " + ex.getMessage());
        }
    }

}
