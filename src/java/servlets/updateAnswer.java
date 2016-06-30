package servlets;

import classes.App;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "updateAnswer", urlPatterns = {"/updateAnswer"})
public class updateAnswer extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/json");
        PrintWriter pw = resp.getWriter();

        try {
            Class.forName(App.DRIVER_CLASS);

            try {
                Connection con = DriverManager.getConnection(App.CONNECTION_STRING);
                Statement st = con.createStatement();

                String roll_no = req.getParameter("roll_no");
                String choice = req.getParameter("choice");
                int q_no = Integer.parseInt(req.getParameter("q_no"));

                ResultSet rs = st.executeQuery("select * from answers where roll_no = '" + roll_no + "' and q_no = " + q_no);

                if (rs.next()) {
                    PreparedStatement ps = con.prepareStatement("update answers set ans_selected = ? where roll_no = ? and q_no = ?");
                    ps.setString(1, choice);
                    ps.setString(2, roll_no);
                    ps.setInt(3, q_no);

                    int count = ps.executeUpdate();

                    if (count == 1) {
                        pw.println("{\"status\" : 1}");
                    } else {
                        pw.println("{\"status\" : 0}");
                    }
                } else {
                    PreparedStatement ps = con.prepareStatement("insert into answers(roll_no, q_no, ans_selected) values( \'" + roll_no + " \',  " + q_no + ", \' " + choice + "\')");

                    int count = ps.executeUpdate();

                    if (count == 1) {
                        pw.println("{\"status\" : 1}");
                    } else {
                        pw.println("{\"status\" : 0}");
                    }
                }

                con.close();
                st.close();
                rs.close();
            } catch (Exception ex) {
                System.out.println("Error in updateAnswers.java  -> " + ex.getMessage());
            }
        } catch (Exception ex) {
            System.out.println("Error in updateAnswers.java - " + ex.getMessage());
        }
    }
}