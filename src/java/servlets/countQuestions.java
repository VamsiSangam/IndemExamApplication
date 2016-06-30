package servlets;

import classes.App;
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

@WebServlet(name = "countQuestions", urlPatterns = {"/countQuestions"})
public class countQuestions extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/json");
        PrintWriter pw = resp.getWriter();

        try {
            Class.forName(App.DRIVER_CLASS);
            Connection con = DriverManager.getConnection(App.CONNECTION_STRING);
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select count(*) from questions");
            rs.next();
            pw.println("{\"count\" : " + rs.getInt(1) + "}");
            con.close();
            st.close();
            rs.close();
        } catch (Exception ex) {
            pw.println("{\"error\" : \"error\"}");
            System.out.println("Error in countQuestions.java - " + ex.getMessage());
        }
    }

}
