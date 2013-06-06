import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;

public class JDBCExample {

  public static void main (String[] argv) {

    System.out.println("-----PostgreSQL" + "JDBC Connection Testing-----");

    try {
      Class.forName("org.posgresql.Driver");
    } catch (ClassNotFoundException e) {
      System.out.println("Where is your PostgreSQL JDBC Driver? " + "Include in your library path");
      e.printStackTrace();
      return;
    }

    System.out.println("PostgreSQL JDBC Driver Registered!");

    Connection connection = null;

    try {

      connection = DriverManager.getConnection("jdbc:postgresql://127.0.0.1:5432/testdb", "user12", "123456");

    } catch (SQLException e) {

      System.out.println("Connection failed! Check out console");
      e.printStackTrace();
      return;

    }

    if (null != connection) {
      System.out.println("You made it, take control of your database now!");
    } else {
      System.out.println("Failed to make connection!");
    }
  }
}
