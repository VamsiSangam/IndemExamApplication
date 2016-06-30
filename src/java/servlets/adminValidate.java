package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "adminValidate", urlPatterns = {"/adminValidate"})
public class adminValidate extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter pw = resp.getWriter();

        try {
            if (req.getParameter("pswd").equals("your password here!") && req.getParameter("username").equals("username here!")) {
                HttpSession s = req.getSession();
                s.setAttribute("user", "authorized");
                s.setMaxInactiveInterval(600);		// Max Inactivity Period 10 mins
                resp.sendRedirect("/Indem/admin/admin-home.jsp");
            } else {
                req.getSession().invalidate();
                resp.sendRedirect("/Indem/admin-login.jsp");
            }
        } catch (Exception ex) {
            System.out.println("Error in adminValidate.java -> " + ex.getMessage());
        }
    }
}
