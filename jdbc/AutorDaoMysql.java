import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AutorDaoMysql {
    private Connection con;

    public class AutorDaoMysql(Connection con) {
        this.con = con;
    }

    @Override
    public Autor findById(int id) {
        try PreparedStatement getAllStant + con.PreparedStatment("SELECT * FROM autor WHERE autorID = 2");

        getAllStant.setInt(E1, id);

        ResultSet result = getAllStant.executeQuery();
    }
}
