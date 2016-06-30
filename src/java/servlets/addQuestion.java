package servlets;

import classes.App;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.Types;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(name = "addQuestion", urlPatterns = {"/addQuestion"})
@MultipartConfig(maxFileSize = 16177215)	//Max Pic size 16MB
public class addQuestion extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/plain");
        PrintWriter pw = resp.getWriter();

        try {
            Class.forName(App.DRIVER_CLASS);
        } catch (Exception ex) {
            System.out.println("Driver Error -> " + ex.getMessage());
        }

        try (Connection con = DriverManager.getConnection(App.CONNECTION_STRING);
                PreparedStatement st1 = con.prepareStatement("insert into questions(question, image, choice1, choice2, choice3, choice4, q_type, correct_ans, positive_marks, negative_marks, flag) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
                Statement st2 = con.createStatement();) {

            st1.setString(1, req.getParameter("question"));

            if (req.getPart("pic") != null) {
                Part photo = req.getPart("pic");
                InputStream inputstream = null;

                if (photo != null) {
                    inputstream = photo.getInputStream();
                }

                if (inputstream != null) {
                    byte[] b = new byte[(int) photo.getSize()];
                    inputstream.read(b, 0, b.length);
                    st1.setBytes(2, b);
                }

                st1.setString(11, "I");
            } else {
                st1.setNull(2, Types.VARBINARY);
                st1.setString(11, null);
            }

            st1.setString(3, req.getParameter("choice1"));
            st1.setString(4, req.getParameter("choice2"));
            st1.setString(5, req.getParameter("choice3"));
            st1.setString(6, req.getParameter("choice4"));

            if (req.getParameter("type").equals("I")) {
                st1.setString(7, "I");
            } else {
                st1.setString(7, "N");
            }

            if (req.getParameter("category").equals("single")) {
                st1.setString(8, req.getParameter("radio"));
            } else {
                String[] choices = req.getParameterValues("box");
                String multiple_ans = choices[0];

                for (int i = 1; i < choices.length; ++i) {
                    multiple_ans += choices[i];
                }

                st1.setString(8, multiple_ans);
            }

            st1.setInt(9, Integer.parseInt(req.getParameter("positive_marks")));
            st1.setInt(10, Integer.parseInt(req.getParameter("negative_marks")));
            
            int count = st1.executeUpdate();
            
            if (count == 1) {
                resp.sendRedirect("/Indem/admin/admin-questions.jsp");
            } else {
                pw.println("Question could not be Added!");
            }
        } catch (Exception ex) {
            pw.println("Error in addQuestion.java - " + ex.getMessage());
        }
    }

}
