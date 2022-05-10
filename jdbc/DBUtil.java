import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBUtil {

    public static Connection createConnectionFromProperties(String filePath) {
        Properties properties = new Properties();
        Connection con = null;

        try {

            properties.load(new FileInputStream("res/connection.properties"));

            String userName = properties.getProperty("username");
            String uri = properties.getProperty("uri");
            String pass = properties.getProperty("password");

            con = DriverManager.getConnection(uri, userName, pass);


        } catch (FileNotFoundException fileNotFound) {
            System.err.println("El fichero no existe");
        } catch (IOException ioEx) {
            System.err.println("Error leyendo el fichero");
        } catch (SQLException sqlEx) {
            System.err.println("Error creando la conexión");
            System.err.println(sqlEx);
        }

        return con;
    }

}