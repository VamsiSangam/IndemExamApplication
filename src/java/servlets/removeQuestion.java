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

@WebServlet(name = "removeQuestion", urlPatterns = {"/removeQuestion"})
public class removeQuestion extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/plain");
        PrintWriter pw = resp.getWriter();

        try {
            Class.forName(App.DRIVER_CLASS);
        } catch (Exception ex) {
            System.out.println("Error in removeQuestions.java - " + ex.getMessage());
        }

        try (Connection con = DriverManager.getConnection(App.CONNECTION_STRING);
                PreparedStatement st = con.prepareStatement("delete from questions where q_no = ?");) {

            int num = Integer.parseInt(req.getParameter("q_no"));

            st.setInt(1, num);

            int count = st.executeUpdate();

            if (count == 1) {
                resp.sendRedirect("/Indem/admin/admin-questions.jsp");
            } else {
                pw.println("Question could not be Deleted!");
            }
        } catch (Exception ex) {
            System.out.println("Error in removeQuestion.java - " + ex.getMessage());
        }
    }
}
