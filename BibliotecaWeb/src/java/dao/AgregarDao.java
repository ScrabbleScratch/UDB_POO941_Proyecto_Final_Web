/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

/**
 *
 * @author Mario O.
 */

import bean.AgregarBean;
import database.Conexion;

import java.sql.*;

public class AgregarDao {
    public static boolean validate(AgregarBean bean) {
        boolean data = false;
        try {
            Connection con = Conexion.conectar();
            PreparedStatement ps = null;
            
            switch (bean.getCategoria()) {
                case "libros":
                    ps = con.prepareStatement("INSERT INTO libros (titulo, autor, genero, editorial, isbn, "
                            + "anio_publicacion, edicion, unidades, estante, palabras_clave) "
                            + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);");
                    ps.setString(1, bean.getTitulo());
                    ps.setString(2, bean.getAutor());
                    ps.setString(3, bean.getTipo());
                    ps.setString(4, bean.getEditorial());
                    ps.setString(5, bean.getIdentificacion());
                    ps.setString(6, bean.getPublicacion());
                    ps.setString(7, bean.getEdicion());
                    ps.setString(8, bean.getUnidades());
                    ps.setString(9, bean.getEstante());
                    ps.setString(10, bean.getTags());
                    break;
                case "obras":
                    ps = con.prepareStatement("INSERT INTO obras (titulo, autor, genero, editorial, isbn, "
                            + "anio_publicacion, edicion, unidades, estante, palabras_clave) "
                            + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);");
                    ps.setString(1, bean.getTitulo());
                    ps.setString(2, bean.getAutor());
                    ps.setString(3, bean.getTipo());
                    ps.setString(4, bean.getEditorial());
                    ps.setString(5, bean.getIdentificacion());
                    ps.setString(6, bean.getPublicacion());
                    ps.setString(7, bean.getEdicion());
                    ps.setString(8, bean.getUnidades());
                    ps.setString(9, bean.getEstante());
                    ps.setString(10, bean.getTags());
                    break;
                case "revistas":
                    ps = con.prepareStatement("INSERT INTO revistas (titulo, editorial, frecuencia, issn, "
                            + "tematica, volumen, unidades, estante, palabras_clave) "
                            + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);");
                    ps.setString(1, bean.getTitulo());
                    ps.setString(2, bean.getEditorial());
                    ps.setString(3, bean.getPublicacion());
                    ps.setString(4, bean.getIdentificacion());
                    ps.setString(5, bean.getTipo());
                    ps.setString(6, bean.getEdicion());
                    ps.setString(7, bean.getUnidades());
                    ps.setString(8, bean.getEstante());
                    ps.setString(9, bean.getTags());
                    break;
                case "cds":
                    ps = con.prepareStatement("INSERT INTO cds "
                            + "(titulo, autor, genero, anio_publicacion, duracion, unidades, estante) "
                            + "VALUES (?, ?, ?, ?, ?, ?, ?);");
                    ps.setString(1, bean.getTitulo());
                    ps.setString(2, bean.getAutor());
                    ps.setString(3, bean.getTipo());
                    ps.setString(4, bean.getPublicacion());
                    ps.setString(5, bean.getDuracion());
                    ps.setString(6, bean.getUnidades());
                    ps.setString(7, bean.getEstante());
                    break;
                case "tesis":
                    ps = con.prepareStatement("INSERT INTO tesis "
                            + "(titulo, fecha_publicacion, institucion, facultad, paginas, unidades, estante) "
                            + "VALUES (?, ?, ?, ?, ?, ?, ?);");
                    ps.setString(1, bean.getTitulo());
                    ps.setString(2, bean.getPublicacion());
                    ps.setString(3, bean.getEditorial());
                    ps.setString(4, bean.getAutor());
                    ps.setString(5, bean.getDuracion());
                    ps.setString(6, bean.getUnidades());
                    ps.setString(7, bean.getEstante());
                    break;
                default:
                    break;
            }
            
            if (ps != null) {
                int resultado = ps.executeUpdate();
            
                if (resultado > 0)
                    data = true;
            }
        } catch (Exception e) {
            data = false;
        }
        Conexion.desconectar();
        return data;
    }
}
