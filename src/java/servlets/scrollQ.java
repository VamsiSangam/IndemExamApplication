package servlets;

import classes.App;
import classes.Question;
import com.google.gson.Gson;
import java.io.IOException;
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

@WebServlet(name = "scrollQ", urlPatterns = {"/scrollQ"})
public class scrollQ extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/json");
        PrintWriter pw = resp.getWriter();

        try {
            Class.forName(App.DRIVER_CLASS);
            Connection con = DriverManager.getConnection(App.CONNECTION_STRING);
            PreparedStatement st = con.prepareStatement("select q_no, question, choice1, choice2, choice3, choice4, q_type, correct_ans, positive_marks, negative_marks, flag from questions where q_no = ?");
            st.setInt(1, Integer.parseInt(req.getParameter("q_no")));
            ResultSet crs = st.executeQuery();
            crs.next();

            Question q = new Question(crs.getInt(1), crs.getInt(9), crs.getInt(10), crs.getString(2), crs.getString(3), crs.getString(4), crs.getString(5), crs.getString(6), crs.getString(7), crs.getString(8), crs.getString(11));
            Gson gson = new Gson();
            String json = gson.toJson(q);
            pw.println(json);
            con.close();
            st.close();
            crs.close();
        } catch (Exception ex) {
            pw.println("{\"error\" : \"error\"}");
            System.out.println("Error in scrollQ.java - " + ex.getMessage());
        }
    }
}
