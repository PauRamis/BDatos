import dao.AutorDao;
import dao.mysql_implementation.AutorDaoMysql;
import domain.Autor;

import java.sql.Connection;

public class App {
    public static void main(String[] args) {
        Connection con = DBUtil.createConnectionFromProperties("");
        AutorDao autorDao = new AutorDaoMysql(con);

        Autor a = autorDao.findById(1);
        System.out.println(a);
    }
}
