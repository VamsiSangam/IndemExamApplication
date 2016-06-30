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

@WebServlet(name = "calculateTotal", urlPatterns = {"/calculateTotal"})
public class calculateTotal extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter pw = resp.getWriter();

        try {
            Class.forName(App.DRIVER_CLASS);

            try (
                    Connection con = DriverManager.getConnection(App.CONNECTION_STRING);
                    Statement st = con.createStatement();) {
                String roll_no = req.getParameter("roll_no");

                ResultSet rs = st.executeQuery("select correct_ans, ans_selected, positive_marks, negative_marks from\n"
                        + "questions inner join answers\n"
                        + "on questions.q_no = answers.q_no\n"
                        + "where roll_no = '" + roll_no + "'\n"
                        + "and q_type = 'N'");
                int positive_n = 0, negative_n = 0;

                while (rs.next()) {
                    if (rs.getString(1).trim().equals(rs.getString(2).trim())) {
                        positive_n += rs.getInt(3);

                    } else {
                        negative_n += rs.getInt(4);
                    }
                }

                int positive_i = 0, negative_i = 0;
                
                rs = st.executeQuery("select correct_ans, ans_selected, positive_marks, negative_marks from\n"
                        + "questions inner join answers\n"
                        + "on questions.q_no = answers.q_no\n"
                        + "where roll_no = '" + roll_no + "'\n"
                        + "and q_type = 'I'");

                while (rs.next()) {
                    if (rs.getString(1).trim().equals(rs.getString(2).trim())) {
                        positive_i += rs.getInt(3);
                    } else {
                        negative_i += rs.getInt(4);
                    }
                }

                rs = st.executeQuery("select sum(positive_marks) from questions where q_type = 'N'");
                rs.next();
                int total_n = rs.getInt(1);

                rs = st.executeQuery("select sum(positive_marks) from questions WHERE q_type = 'I'");
                rs.next();
                int total_i = rs.getInt(1);

                int total = positive_n - negative_n + positive_i - negative_i;
                double networking = (double) (positive_n - negative_n) / (double) (total_n);
                double iq = (double) (positive_i - negative_i) / (double) (total_i);

                networking *= 100;
                iq *= 100;

                if (networking < 0) {
                    networking = 0.0d;
                }

                if (iq < 0) {
                    iq = 0.0d;
                }

                PreparedStatement ps = con.prepareStatement("update students set networking = " + String.format("%.2f", networking) + " , iq = " + String.format("%.2f", iq) + " , total = ? where roll_no = ?");
                ps.setInt(1, total);
                ps.setString(2, roll_no);

                int count = ps.executeUpdate();

                if (count == 1) {
                    pw.println("{\"status\" : 1}");
                    rs.close();
                } else {
                    pw.println("Your total could not be validated! Please contact your Invigilator at immediately!");
                    rs.close();
                }
            }
        } catch (Exception ex) {
            System.out.println("Error - " + ex.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}