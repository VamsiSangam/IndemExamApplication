package classes;

// Has the Application level properties
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class App {

    public static final String students = "students";
    public static final String questions = "questions";
    public static final String answers = "answers";
    public static final String feedback = "feedback";
    public static final String PASS_KEY = "9513268710"; // For a future implementation
    public static final String CONNECTION_STRING = "enter the connection string to your database here";
    public static final String DRIVER_CLASS = "com.microsoft.sqlserver.jdbc.SQLServerDriver";   // MS SQL Server driver
    public static int questionCount;

    public static void countQuestions() {
        try {
            Class.forName(App.DRIVER_CLASS);
            Connection con = DriverManager.getConnection(App.CONNECTION_STRING);
            Statement st = con.createStatement();
            
            ResultSet rs = st.executeQuery("select max(q_no) from " + questions);
            
            rs.next();
                    
            questionCount = rs.getInt(1);
            
            rs.close();
        } catch (Exception ex) {
            System.out.println("Exception App.java - " + ex.getLocalizedMessage());
        }

    }
}
