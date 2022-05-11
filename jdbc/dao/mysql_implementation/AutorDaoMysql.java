package dao.mysql_implementation;

import dao.AutorDao;
import domain.Autor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AutorDaoMysql  implements AutorDao {
        private Connection con;

        public AutorDaoMysql(Connection con) {
            this.con =con;
        }

        @Override
        public Autor findById(int id) {
            Autor autor = null;
            String query = "SELECT * FROM autor WHERE autorID = 2";

            try {
                //Preparar la query
                PreparedStatement getAutorStmnt = con.prepareStatement(query);

                //sustituir..
                getAutorStmnt.setInt(1,id);

                //ejecutar la query

                ResultSet result = getAutorStmnt.executeQuery();

                if (result.next()) {
                    //obtener un campo "nombre"
                    String nombreAutor = result.getString("nombre");
                    int autorId = result.getInt("autorID");

                    autor = new Autor(autorId, nombreAutor);
                }


            } catch (SQLException e) {
                System.err.println(e);
            }
        }
    }

